# Load required libraries 
library(DBI)
library(RSQLite)

# Connect to SQLite database
con <- dbConnect(RSQLite::SQLite(), "workouts.db")

# Create a table to store workouts
dbExecute(con, "CREATE TABLE IF NOT EXISTS workouts (
                 id INTEGER PRIMARY KEY,
                 name TEXT,
                 day TEXT,
                 focus_area TEXT
               )")


# Function to insert predefined workout data into the database
insert_workout_data <- function() {
  predefined_workouts <- list(
    c("Push-ups", "Monday", "Upper Body"),
    c("Pull-ups", "Monday", "Upper Body"),
    c("Squats", "Monday", "Lower Body"),
    c("Planks", "Monday", "Core"),
    c("Bench press", "Tuesday", "Upper Body"),
    c("Rows", "Tuesday", "Upper Body"),
    c("Deadlifts", "Tuesday", "Lower Body"),
    c("Russian twists", "Tuesday", "Core"),
    c("Overhead press", "Wednesday", "Upper Body"),
    c("Lat pull-downs", "Wednesday", "Upper Body"),
    c("Leg press", "Wednesday", "Lower Body"),
    c("Crunches", "Wednesday", "Core"),
    c("Dumbbell curls", "Thursday", "Upper Body"),
    c("Tricep dips", "Thursday", "Upper Body"),
    c("Leg curls", "Thursday", "Lower Body"),
    c("Calf raises", "Thursday", "Lower Body"),
    c("Chest flys", "Friday", "Upper Body"),
    c("Lunges", "Friday", "Lower Body"),
    c("Side planks", "Friday", "Core"),
    c("Hanging leg raises", "Friday", "Core"),
    c("Leg press", "Monday", "Lower Body"),
    c("Hamstring curls", "Monday", "Lower Body"),
    c("Chest press", "Monday", "Upper Body"),
    c("Bicep curls", "Monday", "Upper Body"),
    c("Lateral raises", "Tuesday", "Upper Body"),
    c("Front squats", "Tuesday", "Lower Body"),
    c("Romanian deadlifts", "Tuesday", "Lower Body"),
    c("Russian twists", "Tuesday", "Core"),
    c("Arnold press", "Wednesday", "Upper Body"),
    c("Upright rows", "Wednesday", "Upper Body"),
    c("Step-ups", "Wednesday", "Lower Body"),
    c("Standing calf raises", "Wednesday", "Lower Body"),
    c("Decline bench press", "Thursday", "Upper Body"),
    c("Skull crushers", "Thursday", "Upper Body"),
    c("Sumo squats", "Thursday", "Lower Body"),
    c("Seated leg curls", "Thursday", "Lower Body"),
    c("Cable flys", "Friday", "Upper Body"),
    c("Reverse lunges", "Friday", "Lower Body"),
    c("Oblique crunches", "Friday", "Core"),
    c("Mountain climbers", "Friday", "Core")
  )
  
  # Insert predefined workout data into the database
  for (workout in predefined_workouts) {
    dbExecute(con, "INSERT INTO workouts (name, day, focus_area) VALUES (?, ?, ?)", workout[1], workout[2], workout[3])
  }
}

# Input fitness goals 
input_fitness_goals <- function() { 
  # Prompt user to input their fitness goals
  print("Please enter your fitness goals (e.g., lose weight, build muscle, improve endurance): ") 
  fitness_goals <- readline() 
  return(fitness_goals)
} 

# Input fitness preferences 
input_fitness_preferences <- function() { 
  # Prompt user to input their fitness preferences 
  print("Please enter your fitness preferences (e.g., favorite exercises, preferred workout style): ") 
  fitness_preferences <- readline() 
  return(fitness_preferences) 
} 

# Input physical constraints 
input_physical_constraints <- function() { 
  # Prompt user to input any physical constraints or limitations 
  print("Please enter any physical constraints or limitations (e.g., injuries, medical conditions): ") 
  physical_constraints <- readline() 
  return(physical_constraints)
}

# Function to generate workout plan 
generate_workout_plan <- function(user_goals, user_preferences, user_constraints) {
  # Get distinct days from the database
  days <- dbGetQuery(con, "SELECT DISTINCT day FROM workouts")$day
  
  # Initialize workout plan
  workout_plan <- list()
  
  # Iterate through each day and select random workouts
  for (day in days) {
    # Get all workouts for the current day
    workouts <- dbGetQuery(con, paste("SELECT name FROM workouts WHERE day = '", day, "'", sep = ""))
    
    # Randomly select a subset of workouts for the current day
    selected_workouts <- sample(workouts$name, size = min(length(workouts$name), 4), replace = FALSE)
    
    # Add selected workouts to the workout plan
    workout_plan[[day]] <- selected_workouts
  }
  
  return(workout_plan) 
} 

# Function to display workout plan 
print_workout_plan <- function(workout_plan) {
  # Generated workout plan
  print("Your personalized workout plan:") 
  for (day in names(workout_plan)) {
    cat("Day", day, ":\n")
    cat(paste(workout_plan[[day]], collapse = ", "), "\n\n") 
  } 
} 

# Insert predefined workout data into the database
insert_workout_data()

# User Input
user_goals <- input_fitness_goals()
user_preferences <- input_fitness_preferences()
user_constraints <- input_physical_constraints()

# Generate Workout Plan
workout_plan <- generate_workout_plan(user_goals, user_preferences, user_constraints)

# Output Display
print_workout_plan(workout_plan)

# Disconnect from the database
dbDisconnect(con)

