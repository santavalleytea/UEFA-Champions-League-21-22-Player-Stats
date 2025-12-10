# 📊 UEFA-Champions-League-21-22-Player-Stats

A fully relational PostgreSQL project analyzing attacking and goalscoring performance in the 2021–22 UEFA Champions League season.
Built using raw CSV files → cleaned → transformed → analyzed with SQL. The goal is to build a normalized PostgreSQL relational database from raw CSV football datasets and run analytical SQL queries on datasets such as player and team attacking, defending, goalkeeping metrics alongside others. 

# 🧠 Project Overview

This project:

- Imports multiple raw CSV datasets (attacking, goals, etc.)

- Loads them into staging tables

- Cleans and transforms the data

- Builds a structured relational database with: teams, players, attacking_stats and goal_stats

- Runs analytical SQL queries to explore individual and team performance

The focus is on creating a clear, normalized schema that can be easily expanded with additional datasets (defending, attempts, goalkeeping, etc.).

# 📁 Project Structure
```
UCL 2021-2022 STATS/
│
├── csv_files/
│   ├── attacking.csv
│   ├── goals.csv
│   └── (more datasets later...)
│
├── sql_load/
│   ├── 01_schema.sql
│   ├── 02_load_raw_data.sql
│   ├── 03_transform_clean.sql
│   └── attacking.sql / goals.sql (individual ETL scripts)
│
├── analysis/
│   ├── attacking_analysis.sql
│   ├── goals_analysis.sql
│
└── README.md
```
