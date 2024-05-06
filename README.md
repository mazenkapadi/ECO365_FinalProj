**Workout Planner README**

**Description:**
This R script is designed to assist users in generating personalized workout plans based on their fitness goals, preferences, and any physical constraints they may have. The script utilizes a SQLite database to store predefined workout data and dynamically selects exercises for each day of the week, taking into account user input.

**Features:**
1. **Predefined Workout Data:** The script includes predefined workout data for various exercises categorized by day and focus area.

2. **User Input:** Users are prompted to input their fitness goals, preferences, and any physical constraints they may have.

3. **Workout Plan Generation:** Based on the user input, the script dynamically generates a personalized workout plan by randomly selecting exercises for each day of the week.

4. **Output Display:** The generated workout plan is displayed to the user, detailing the exercises allocated for each day.

**Instructions for Use:**
1. **Set Up SQLite Database:** Ensure that you have SQLite installed and create a SQLite database file named "workouts.db" in the same directory as the script.

2. **Install Required Libraries:** Install the required R libraries by executing `install.packages("DBI")` and `install.packages("RSQLite")` if you haven't already.

3. **Run the Script:** Execute the provided R script in your R environment. This will create a connection to the SQLite database and set up the necessary functions for workout plan generation.

4. **Input Fitness Goals, Preferences, and Constraints:** Follow the prompts to input your fitness goals, preferences, and any physical constraints you may have.

5. **View Generated Workout Plan:** Once the input is provided, the script will generate a personalized workout plan based on your input and display it on the screen.

6. **Disconnect from Database:** After viewing the workout plan, the script will automatically disconnect from the SQLite database.

**Note:** Ensure that you have R installed with the necessary packages and permissions to create and write to the SQLite database file.

**Disclaimer:** This script is provided for educational and informational purposes only. Consult with a fitness professional before starting any new exercise program. The author assumes no responsibility for any injuries or damages resulting from the use of this script.
