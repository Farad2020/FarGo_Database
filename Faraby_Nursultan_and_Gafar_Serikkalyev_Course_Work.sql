﻿--This message is for you
CREATE TABLE Genres(
	genre_id int PRIMARY KEY ,
	genre_name varchar(40)
);

CREATE TABLE GamePublishers(
	publisher_id int PRIMARY KEY ,
	publisher_name varchar(40)
);

CREATE TABLE GameDeveloperCompanies(
	dev_comp_id int PRIMARY KEY ,
	dev_comp_name varchar(40)
);

CREATE TABLE GamePlatform(
	platform_id int PRIMARY KEY ,
	platform_name varchar(40),
	platform_holder varchar(40)
);



CREATE TABLE Games(
	game_id int PRIMARY KEY ,
	game_name varchar(40), 
	game_description varchar(500), 
	release_date date,
	genre_id int,
	dev_comp_id int,
	publisher_id int,
	FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
	FOREIGN KEY (dev_comp_id) REFERENCES GameDeveloperCompanies(dev_comp_id),
	FOREIGN KEY (publisher_id) REFERENCES GamePublishers(publisher_id)
);

CREATE TABLE PlatformRelation(
	relation_id int PRIMARY KEY ,
	game_id int,
	platform_id int,
	FOREIGN KEY (game_id) REFERENCES Games(game_id),
	FOREIGN KEY (platform_id) REFERENCES GamePlatform(platform_id)
);

CREATE TABLE CompanyDepartments(
	department_id int PRIMARY KEY ,
	department_name varchar(40)
);

CREATE TABLE CompanySpecialties(
	specialty_id int PRIMARY KEY ,
	specialty_name varchar(40),
	department_id int,
	FOREIGN KEY (department_id) REFERENCES CompanyDepartments(department_id)
);

CREATE TABLE CompanyProjectTeams(
	team_id int PRIMARY KEY ,
	team_name varchar(40)
);

CREATE TABLE CompanyProjects(
	project_id int PRIMARY KEY ,
	project_name varchar(60), 
	project_description varchar(600), 
	in_development boolean,
	start_date date,
	team_id int,
	FOREIGN KEY (team_id) REFERENCES CompanyProjectTeams(team_id)
);


CREATE TABLE CompanyWorkers(
	worker_id int PRIMARY KEY ,
	worker_surname varchar(20), 
	worker_name varchar(20), 
	date_of_birth date,	
	phone_number varchar(20),
	email varchar(20), 
	employment_date date,
	is_employed boolean,
	specialty_id int,
	team_id int,
	FOREIGN KEY (specialty_id) REFERENCES CompanySpecialties(specialty_id),
	FOREIGN KEY (team_id) REFERENCES CompanyProjectTeams(team_id)
);


CREATE TABLE UsersOfSite(
	user_id int PRIMARY KEY ,
	username varchar(25), 
	user_email varchar(20), 
	user_login varchar(25), 
	user_password varchar(25),
	registration_date date,	
	wallet real,
	account_active boolean
);

--I wasnt able to change ER diagram, cause I didnt had access, but new change is Transaction history is combined with Shop Item

CREATE TABLE TransactionHistory(
	transaction_id int PRIMARY KEY ,
	transaction_date timestamp,	
	transaction_cost real,
	game_id int,
	user_id int,
	FOREIGN KEY (game_id) REFERENCES Games(game_id),
	FOREIGN KEY (user_id) REFERENCES UsersOfSite(user_id)
);

--Work with Genres

INSERT INTO Genres VALUES (1, 'RPG');
INSERT INTO Genres VALUES (2, 'FPS');
INSERT INTO Genres VALUES (3, 'Beat em up');
INSERT INTO Genres VALUES (4, 'MOBA');

SELECT * from Genres;

INSERT INTO GameDeveloperCompanies VALUES (1, 'CD Project Red');
INSERT INTO GameDeveloperCompanies VALUES (2, 'ID Software');
INSERT INTO GameDeveloperCompanies VALUES (3, 'Capcom');

SELECT * from GameDeveloperCompanies;

INSERT INTO GamePublishers VALUES (1, 'CD Project Red');
INSERT INTO GamePublishers VALUES (2, 'Bethesda');
INSERT INTO GamePublishers VALUES (3, 'Capcom');

SELECT * from GamePublishers;


INSERT INTO GamePlatform VALUES (1, 'Steam', 'Valve');
INSERT INTO GamePlatform VALUES (2, 'GOG', 'CD Project Red');
INSERT INTO GamePlatform VALUES (3, 'Play Station 4', 'Sony Entertainment');

SELECT * from GamePlatform;


INSERT INTO Games VALUES (1, 'The Witcher 3', 'lorem ipsum', '2015-05-19', 1, 1, 1);
INSERT INTO Games VALUES (2, 'DOOM Eternal', 'lorem ipsum', '2020-03-27', 2, 2, 2);
INSERT INTO Games VALUES (3, 'Devil May Cry 5', 'lorem ipsum', '2019-03-08', 3, 3, 3);
INSERT INTO Games VALUES (4, 'Devil May Cry 4', 'lorem ipsum', '2019-02-08', 3, 3, 3);

SELECT * from Games; 

INSERT INTO PlatformRelation VALUES (1, 1, 1 );
INSERT INTO PlatformRelation VALUES (2, 1, 2 );
INSERT INTO PlatformRelation VALUES (3, 1, 3 );
INSERT INTO PlatformRelation VALUES (4, 2, 1 );
INSERT INTO PlatformRelation VALUES (5, 2, 2 );
INSERT INTO PlatformRelation VALUES (6, 2, 3 );
INSERT INTO PlatformRelation VALUES (7, 3, 1 );
INSERT INTO PlatformRelation VALUES (8, 3, 3 );
INSERT INTO PlatformRelation VALUES (9, 4, 1 );
INSERT INTO PlatformRelation VALUES (10, 4, 3 );

SELECT * from PlatformRelation;

INSERT INTO UsersOfSite VALUES (1, 'Farad2020', 'f.@mail.ru', 'faradj', 'Test1234', '2020-02-27', 0.0, True);
INSERT INTO UsersOfSite VALUES (2, 'Kaizy', 'g.@mail.ru', 'kaizyG', 'Test1234', '2020-02-25', 0.0,  True);
INSERT INTO UsersOfSite VALUES (3, 'Tur4r', 't.@mail.ru', 'turarara', 'Test1234', '2020-03-01',  0.0, True);

SELECT * from UsersOfSite;

INSERT INTO TransactionHistory VALUES (1,'2020-03-27 12:37:55', 20000.0, 1, 1);
INSERT INTO TransactionHistory VALUES (2, '2020-02-27 15:38:05', 7000.0, 2, 2);
INSERT INTO TransactionHistory VALUES (3, '2020-03-09 18:37:09', 20000.0, 3, 3);

SELECT * from TransactionHistory;


INSERT INTO CompanyDepartments VALUES (1, 'HR');
INSERT INTO CompanyDepartments VALUES (2, 'Marketing');
INSERT INTO CompanyDepartments VALUES (3, 'IT');

SELECT * from CompanyDepartments;

INSERT INTO CompanySpecialties VALUES (1, 'HR');
INSERT INTO CompanySpecialties VALUES (2, 'Marketing');
INSERT INTO CompanySpecialties VALUES (3, 'IT');

SELECT * from CompanySpecialties;

INSERT INTO CompanyProjectTeams VALUES (1, 'AlphaT');
INSERT INTO CompanyProjectTeams VALUES (2, 'BetaT');
INSERT INTO CompanyProjectTeams VALUES (3, 'SigmaT');

SELECT * from CompanyProjectTeams;

INSERT INTO CompanyProjects VALUES (1, 'BloodRaven','Project includes lorem ipsum inhen grase etc.',true,'2020-08-12',1);
INSERT INTO CompanyProjects VALUES (2, 'FunnyState','Project includes lorem ipsum inhen grase etc.',false,'2019-02-12',2);
INSERT INTO CompanyProjects VALUES (3, 'SportVR','Project includes lorem ipsum inhen grase etc.',true,'2020-04-17',3);

SELECT * from CompanyProjects;

ALTER TABLE CompanyWorkers 
ALTER COLUMN email TYPE varchar(40);

INSERT INTO CompanyWorkers VALUES (1, 'Jackson','Michael','1969-01-01','7077410707','example@mail.com','2018-05-25',true,1,1);
INSERT INTO CompanyWorkers VALUES (2, 'Sherzhinger','Ariana','1986-04-01','7077410707','example@mail.com','2018-06-15',true,2,2);
INSERT INTO CompanyWorkers VALUES (3, 'Miller','George','1990-12-12','7077410707','example@mail.com','2018-03-18',true,3,3);

SELECT * from CompanyWorkers;


--CourseWork 6

SELECT game_id
FROM Games;

SELECT game_name
FROM Games WHERE game_id=1;

SELECT
   dev_comp_id ,
   dev_comp_name
FROM GameDeveloperCompanies
UNION ALL
SELECT
  publisher_id,
  publisher_name
FROM GamePublishers;

SELECT * FROM CompanyWorkers
EXCEPT 
SELECT * FROM CompanyWorkers
WHERE worker_id=2;

SELECT Games.genre_id FROM Games INTERSECT
SELECT  Genres.genre_id FROM Genres;


SELECT worker_name, worker_surname, CompanyProjectTeams.team_name
FROM CompanyWorkers
INNER JOIN CompanyProjectTeams
ON CompanyWorkers.team_id = CompanyProjectTeams.team_id;


SELECT game_name, genre_name
FROM Games
LEFT JOIN Genres
ON Games.genre_id = Genres.genre_id;

SELECT game_name, genre_name
FROM Games
RIGHT JOIN Genres
ON Games.genre_id = Genres.genre_id;

SELECT game_name, genre_name
FROM Games
FULL OUTER JOIN Genres
ON Games.genre_id = Genres.genre_id;

SELECT *
FROM GamePlatform
CROSS JOIN Games;

SELECT *
FROM GamePlatform, Games;

SELECT count(*) 
FROM Games;

SELECT genre_id, count(*)
FROM Games gm, Genre gr
GROUP BY genre_id;


SELECT game.game_id, game.game_name, genre.genre_name, pub.publisher_name, devs.dev_comp_name
FROM Games game, Genres genre, GamePublishers pub, GameDeveloperCompanies devs 
Where genre.genre_id = game.genre_id and game.publisher_id = pub.publisher_id and game.dev_comp_id = devs.dev_comp_id;



SELECT game.game_id, game.game_name, genre.genre_name, platform.platform_name
FROM Games game, GamePlatform platform, Genres genre, PlatformRelation rel
Where rel.game_id = game.game_id and rel.platform_id = platform.platform_id and genre.genre_id = game.genre_id;


--CourseWork 7-8

INSERT INTO UsersOfSite VALUES (4, 'BOSS667', 'b.@mail.ru', 'boss', 'Test1234', '2020-02-27', 80000.0, True);
INSERT INTO UsersOfSite VALUES (5, 'GUMANGASAAAAVR', 'g.@mail.ru', 'Gumanga', 'Test1234', '2020-02-25', 200.0,  True);
INSERT INTO UsersOfSite VALUES (6, 'Yernar', 'y.@mail.ru', 'Yeranararara', 'Test1234', '2020-03-01',  100.0, True);


SELECT avg(wallet), min(wallet), max(wallet) FROM UsersOfSite;

SELECT username
FROM UsersOfSite
GROUP BY user_id
HAVING wallet > 2000;


SELECT username,registration_date
FROM UsersOfSite
ORDER BY username ASC, registration_date DESC;

SELECT us.user_login||' '|| us.user_password  , us.user_email,us.registration_date
FROM UsersOfSite us
ORDER BY us.user_login ASC;

SELECT sum(transaction_cost) FROM TransactionHistory
WHERE transaction_cost  BETWEEN 10000 AND 30000;

--COurseWork 9

SELECT worker_surname,team_id  FROM CompanyWorkers
WHERE team_id NOT IN  (SELECT team_id
FROM CompanyProjectTeams
WHERE team_id=1 or team_id=5);

SELECT worker_surname,team_id
FROM   CompanyWorkers
WHERE   team_id IN (SELECT team_id
FROM CompanyProjectTeams
WHERE team_id=5 or team_id=2 or team_id=1 or team_id=7);

SELECT worker_name, team_name
FROM CompanyWorkers, CompanyProjectTeams
WHERE NOT EXISTS (
  SELECT team_id
  FROM CompanyProjectTeams
  WHERE team_name = 'SigmaT');

SELECT *
FROM CompanyWorkers
WHERE team_id < ANY (
SELECT team_id
FROM CompanyWorkers
Where team_id=3
);

SELECT *
FROM  CompanyWorkers
WHERE worker_id < ALL (
SELECT team_id
FROM CompanyProjectTeams
Where team_id=4
);

SELECT worker_name, worker_surname
FROM (
SELECT *
FROM CompanyWorkers
Where worker_name='Michael' or worker_surname = 'Miller') AS foo;


--Task 5
SELECT *
FROM Teachers
WHERE teach_id < ALL (
SELECT group_id
FROM Students
Where group_id=3
);
 
--Task 6
SELECT fname, lname
FROM (
SELECT *
FROM Teachers
Where fname='Nazgul' or fname = 'Olga') AS foo;

--Task 7
INSERT INTO GamePlatform VALUES (1, 'Steam', 'Valve');
Select * from GamePublishers;
 
INSERT INTO GamePublishers (publisher_id, publisher_name)
Values(4, (SELECT platform_holder
FROM GamePlatform
WHERE platform_id = 1));

Select * from GamePublishers;
 
SELECT fname, lname from Teachers where teach_id = 9;
 
 
--Task 8
 
DELETE FROM GamePublishers Where publisher_name =
(SELECT platform_holder
FROM GamePlatform
WHERE platform_id = 1);
 
SELECT * from GamePublishers;
 
 
--Task 9
Select * from UsersOfSite;

UPDATE UsersOfSite
SET wallet=wallet+500
WHERE user_id =
(SELECT user_id
FROM UsersOfSite
WHERE user_id = 1);


Select * from UsersOfSite;

