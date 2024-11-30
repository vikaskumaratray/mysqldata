CREATE DATABASE IF NOT EXISTS games;
USE games;

CREATE TABLE gamesalesone(
    Game_ID INT AUTO_INCREMENT NOT NULL,
    Game_Rank INT NOT NULL ,
    Game_Name VARCHAR( 40 ),
    Platform VARCHAR( 40 ),
    Game_Year INT NOT NULL ,
    Genre VARCHAR( 40 ),
    Publisher VARCHAR( 40 ),
    PRIMARY KEY ( Game_ID )
    ) 

SELECT * FROM gamesalesone;

CREATE TABLE gamesalestwo(
    Game_ID INT AUTO_INCREMENT NOT NULL,
    Game_Name VARCHAR( 40 ),
    NA_Sales INT NOT NULL ,
    EU_Sales INT NOT NULL ,
    JP_Sales INT NOT NULL ,
    PRIMARY KEY ( Game_ID ) 
) 

SELECT * FROM gamesalestwo;

CREATE TABLE gamesalesthree(
    Game_ID INT AUTO_INCREMENT NOT NULL,
    Game_Name VARCHAR( 40 ),
    Other_Sales INT NOT NULL ,
    Global_Sales INT NOT NULL ,
    Rating VARCHAR( 10 ) ,
    PRIMARY KEY ( Game_ID ) 
) 

SELECT * FROM gamesalesthree;

ALTER TABLE gamesalesone
ADD FOREIGN KEY (Game_ID) REFERENCES gamesalestwo(Game_ID);

ALTER TABLE gamesalestwo
ADD FOREIGN KEY (Game_ID) REFERENCES gamesalesthree(Game_ID);

ALTER TABLE gamesalesthree
ADD FOREIGN KEY (Game_ID) REFERENCES gamesalesone(Game_ID);

# Top 10 Ranked Games
SELECT Game_ID,Game_Rank,Game_Name
FROM gamesalesone
WHERE Game_Rank<11;

# Top 5 Game Platform
SELECT Game_Rank,Game_Name,Platform
FROM gamesalesone
ORDER BY Game_Rank,Platform ASC
LIMIT 5 ;

# Top 20 Game Genre
SELECT Game_Rank,Genre
FROM gamesalesone
ORDER BY Game_Rank ASC
LIMIT 20 ;

# Top Game Publisher
SELECT Game_Rank,Game_Name,Publisher
FROM gamesalesone
WHERE Game_Rank=1;

#Top 5 Games sold in North America
SELECT Game_ID, Game_Name, NA_Sales
FROM gamesalestwo
ORDER BY Game_ID,NA_Sales ASC
LIMIT 5 ;

#Top 10 Games sold in Europe and Japan
SELECT Game_ID, Game_Name, EU_Sales, JP_Sales
FROM gamesalestwo
ORDER BY Game_ID,EU_Sales,JP_Sales ASC
LIMIT 10 ;

#Top 3 Most Profitable Games sold in the world(Global Sales)
SELECT Game_Name, Global_Sales
FROM gamesalesthree
WHERE Global_Sales > 34
LIMIT 3 ;

#Top 10 Games with 'E' Ratings
SELECT Game_ID ,Game_Name, Rating
FROM gamesalesthree
WHERE Rating LIKE 'E'
LIMIT 10 ;

#Top 10 Games with 'T' Ratings
SELECT Game_ID ,Game_Name, Rating
FROM gamesalesthree
WHERE Rating LIKE 'T'
LIMIT 10 ;