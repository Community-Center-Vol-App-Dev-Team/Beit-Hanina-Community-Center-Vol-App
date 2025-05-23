CREATE DATABASE main;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
    phone_number VARCHAR(15) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    insurance VARCHAR(50),
    id_number VARCHAR(20) NOT NULL UNIQUE,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    logs TEXT[],
    role TEXT[]
);

CREATE TABLE users_waiting_list
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    sex CHAR(1) NOT NULL CHECK (sex IN ('M', 'F')),
    phone_number VARCHAR(15) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    insurance VARCHAR(50),
    id_number VARCHAR(20) NOT NULL UNIQUE,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    logs TEXT[],
    role TEXT[]
);

CREATE TABLE volunteer
(
    user_id INT PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    approved_hours INT DEFAULT 0,
    unapproved_hours INT DEFAULT 0,
    orgs TEXT[]
);

CREATE TABLE organizer
(
    user_id INT PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    org_name VARCHAR(100) NOT NULL,
    given_hours INT DEFAULT 0,
    vol_id INT[]
);

CREATE TABLE events
(
    event_id SERIAL PRIMARY KEY,
    event_name TEXT NOT NULL,
    event_date DATE NOT NULL,
    event_start TIME NOT NULL,
    event_end TIME NOT NULL,
    is_active BOOLEAN NOT NULL,
    stat TEXT NOT NULL,
    org_id INT REFERENCES organizer(user_id) ON DELETE SET NULL,
    vol_id INT[],
    vol_id_waiting_list INT[],
    max_number_of_vol INT DEFAULT 0,
    current_number_of_vol INT DEFAULT 0
);

-- ? maybe add more indexs or change
-- Indexes for frequently searched fields
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_phone_number ON users(phone_number);
CREATE INDEX idx_events_event_date ON events(event_date);

-- Indexes for id and id_number columns
CREATE INDEX idx_users_id_number ON users(id_number);
CREATE INDEX idx_users_waiting_list_id_number ON users_waiting_list(id_number);
CREATE INDEX idx_users_id ON users(id);
CREATE INDEX idx_users_waiting_list_id ON users_waiting_list(id);

-- predefine the Roles
-- INSERT INTO role (name) VALUES ('ADMIN'), ('VOLUNTEER'), ('ORGANIZER');

-- example
-- INSERT INTO users (name, birth_date, sex, address, phone_number, id_number, insurance, username, password_hash)
-- VALUES ('John Doe', '1990-01-01', 'M', '123 Main St', '123-456-7890', 'ID12345', 'Health Insurance', 'johndoe', 'password123');

-- Assign roles to the inserted user
-- INSERT INTO user_role (user_id, role_id)
-- SELECT id, (SELECT id FROM role WHERE name = 'ADMIN') FROM inserted_user;
-- INSERT INTO user_role (user_id, role_id)
-- SELECT id, (SELECT id FROM role WHERE name = 'ORGANIZER') FROM inserted_user;

-- CREATE TABLE role (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(50) NOT NULL UNIQUE
-- );

-- CREATE TABLE user_role (
--     user_id INT REFERENCES users(id) ON DELETE CASCADE,
--     role_id INT REFERENCES role(id) ON DELETE CASCADE,
--     PRIMARY KEY (user_id, role_id)
-- );
