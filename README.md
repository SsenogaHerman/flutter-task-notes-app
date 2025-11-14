# task_notes_manager

NAME: SSENOGA HERMAN
REGISTRATION_NUMBER: 23/U/17648/EVE


## Description

This is a **Task Manager app** developed using **Flutter** and **sqflite** for local database storage.  
The app allows users to:

- Add tasks with title and description
- View all tasks in a list
- Delete tasks
- Toggle between light and dark themes

The UI is simple and user-friendly, making it easy to manage daily tasks efficiently.

---

## Features

- Add new tasks
- View all tasks in a scrollable list
- Delete tasks using a delete button
- Dark and light mode toggle
- Local storage using SQLite (sqflite)

---

## Getting Started

To run the project, first clone the repository and navigate into the project directory. Then, install all required dependencies by running `flutter pub get` in the terminal. Once the dependencies are installed, launch the app on an emulator or physical device using `flutter run`. Make sure that Flutter is properly installed and set up on your machine before attempting to run the project.

---

## Notes

- The app stores all tasks locally using **sqflite**, so no internet connection is required.
- The app supports **dark and light themes** which can be toggled from the main screen.
- The UI uses **ListView.builder** to dynamically display tasks stored in the database.
