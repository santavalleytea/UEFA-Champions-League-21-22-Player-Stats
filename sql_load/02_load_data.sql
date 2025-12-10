-- Import attacking.csv 
COPY attacking_raw
FROM 'D:\VSCode\UCL 2021-2022 Stats\csv_files\attacking.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);

COPY goals_raw
FROM 'D:\VSCode\UCL 2021-2022 Stats\csv_files\goals.csv'
WITH (
    FORMAT CSV,
    HEADER true,
    DELIMITER ',',
    ENCODING 'UTF8'
);