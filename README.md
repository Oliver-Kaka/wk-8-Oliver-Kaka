# Student Examination Results Database

## 📌 Project Overview
This project implements a **relational database management system (RDBMS)** for storing and managing student examination results.  
It was developed as part of a database assignment using **MySQL**.

The system captures:
- Student records
- Courses offered
- Units belonging to courses
- Exams conducted (Normal, Supplementary, Special)
- Student exam results

---

## 🗂️ Database Schema

The database contains the following tables:

1. **students** → Stores student details.  
2. **courses** → Stores all courses offered.  
3. **student_courses** → Links students to their enrolled courses (Many-to-Many).  
4. **units** → Stores academic units (subjects).  
5. **courses_units** → Links units to the courses they belong to (Many-to-Many).  
6. **exams** → Stores exam details, including type (Normal, Supplementary, Special).  
7. **results** → Stores exam results per student, unit, and exam session.  

---

## 🔑 Key Features
- Use of **PRIMARY KEY** and **FOREIGN KEY** constraints to enforce data integrity.
- Implementation of **relationships**:
  - One-to-Many → `courses → student_courses`, `exams → results`
  - Many-to-Many → `students ↔ courses`, `courses ↔ units`
- `CHECK` constraint ensures marks are between **0 and 100**.
- Use of `ENUM` for exam types (`NORMAL`, `SUPPLEMENTARY`, `SPECIAL`).

---

## 🛠️ Setup Instructions

1. Open MySQL and run the provided `.sql` file.
   ```sql
   SOURCE exam.sql;


2. The script will:

   * Create the database `exam`
   * Create all tables with constraints
   * Insert sample data

---

## 📊 Sample Data

The script inserts at least **5 records per table**, including:

* 5 students
* 5 courses
* Multiple units linked to courses
* Exam records (Normal, Supplementary, Special)
* Results for different students

---

## 🚀 Usage

Once loaded, you can:

* Query student exam results
* List all units offered in a course
* Track which students took Supplementary or Special exams
* Extend the schema with additional rules (e.g., restricting supplementary eligibility)

---

## 📁 Deliverables

* `exam.sql` → SQL script containing schema + sample data
* `README.md` → Documentation file (this file)
