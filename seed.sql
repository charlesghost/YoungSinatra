DROP TABLE IF EXISTS mixtape;

CREATE TABLE mixtape (

	id SERIAL PRIMARY KEY,
	title VARCHAR(255),
	body TEXT

);

INSERT INTO mixtape (title , body) VALUES ('J. Cole - The Warmup' , '4/5 Stars');
INSERT INTO mixtape (title , body) VALUES ('Royce da 5/9 - The Bar Exam' , '3/5 Stars');
INSERT INTO mixtape (title , body) VALUES ('Wale - The Mixtape about nothing' , '4/5 Stars');
INSERT INTO mixtape (title , body) VALUES ('Joe Budden - Mood Muzik 2' , '3/5 Stars');