/* CREATE DATABASE IF NOT EXISTS */
CREATE DATABASE IF NOT EXISTS linear_equations_calculator_db;

USE linear_equations_calculator_db;

/* CREATE TABLES IF NOT EXISTS */
CREATE TABLE IF NOT EXISTS profile(
	code INT NOT NULL,
	name VARCHAR(256) NOT NULL,
	PRIMARY KEY (code)
);

CREATE TABLE IF NOT EXISTS user(
	username VARCHAR(256) NOT NULL,
	password VARCHAR(64) NOT NULL,
	name VARCHAR(512) NOT NULL,
	surname VARCHAR(512) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	profile_code INT NOT NULL,
	PRIMARY KEY (username),
	CONSTRAINT FK_user_profile FOREIGN KEY (profile_code) REFERENCES profile(code)
);

CREATE TABLE IF NOT EXISTS operation(
	code INT AUTO_INCREMENT NOT NULL,
	dimensions INT NOT NULL,
	equation_coefficients TEXT NOT NULL,
	equation_constants TEXT NOT NULL,
	result TEXT NOT NULL,	
	determinant FLOAT NOT NULL,
	inverse TEXT,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	user_username VARCHAR(256) NOT NULL,
	PRIMARY KEY (code),
	CONSTRAINT FK_operarion_user FOREIGN KEY (user_username) REFERENCES user(username)
);

/* INSERT MANDATORY DATA */
INSERT INTO profile (code, name) VALUES(1, 'admin');
INSERT INTO profile (code, name) VALUES(2, 'regular');

INSERT INTO user (username, password, name, surname, profile_code) 
	VALUES('CCT', '0a8ad51fea30c29587f61bd8420a49602aa78304833627829cd29d7594ce3c57', 'Admin', 'CCT', 1);

/* INSERT DATA FOR EXAMPLE */
INSERT INTO operation (dimensions, equation_coefficients, equation_constants, result, determinant, inverse, user_username)
	VALUES(
		3,
		'{\"matrix\":[[1,2,1],[2,-1,1],[-1,3,1]]}',
		'{\"matrix\":[0,1,2]}',
		'{\"matrix\":[-1.4,-0.8,3]}',
		-5.0,
		'{\"matrix\":[[0.8,-0.2,-0.6],[0.6,-0.4,-0.2],[-1,1,1]]}',
		'CCT'
	);
	
INSERT INTO operation (dimensions, equation_coefficients, equation_constants, result, determinant, inverse, user_username)
	VALUES(
		2,
		'{\"matrix\":[[1,0],[1,0]]}',
		'{\"matrix\":[1,2]}',
		'{\"matrix\":\"inconsistent\"}',
		0.0,
		null,
		'CCT'
	);
	
INSERT INTO operation (dimensions, equation_coefficients, equation_constants, result, determinant, inverse, user_username)
	VALUES(
		3,
		'{\"matrix\":[[0,0,0],[0,0,0],[0,0,0]]}',
		'{\"matrix\":[0,0,0]}',
		'{\"matrix\":\"infinity solutions\"}',
		0.0,
		null,
		'CCT'
	);
	
INSERT INTO operation (dimensions, equation_coefficients, equation_constants, result, determinant, inverse, user_username)
	VALUES(
		2,
		'{\"matrix\":[[1,-5],[3,5]]}',
		'{\"matrix\":[15,-5]}',
		'{\"matrix\":[2.5,-2.5]}',
		20.0,
		'{\"matrix\":[[0.25,0.25],[-0.15,0.05]]}',
		'CCT'
	);

INSERT INTO operation (dimensions, equation_coefficients, equation_constants, result, determinant, inverse, user_username)
	VALUES(
		3,
		'{\"matrix\":[[2,1,-1],[-3,-1,2],[-2,1,2]]}',
		'{\"matrix\":[8,-11,-3]}',
		'{\"matrix\":[2,3,-1]}',
		-1.0,
		'{\"matrix\":[[4,3,-1],[-2,-2,1],[5,4,-1]]}',
		'CCT'
	);
	
INSERT INTO operation (dimensions, equation_coefficients, equation_constants, result, determinant, inverse, user_username)
	VALUES(
		2,
		'{\"matrix\":[[-1,1],[1,-1]]}',
		'{\"matrix\":[0,0]}',
		'{\"matrix\":\"infinity solutions\"}',
		0.0,
		null,
		'CCT'
	);