CREATE TABLE media_types(
    media_type_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name TEXT UNIQUE NOT NULL
);

INSERT INTO media_types (name) VALUES 
                                   ('Manga'),
                                   ('Manhwa'),
                                   ('Manhua'),
                                   ('Book'),
                                   ('Tv Show'),
                                   ('Anime'),
                                   ('Movie');
                                   

CREATE TABLE units(
    unit_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(20) UNIQUE NOT NULL 
);

INSERT INTO units (name) VALUES 
                             ('Chapters'),
                             ('Episodes'),
                             ('Duration');

CREATE TABLE media_status (
    status_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO media_status (name) VALUES
                                    ('Planned'),
                                    ('Started'),
                                    ('Completed'),
                                    ('Dropped');

CREATE TABLE media(
    media_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(255) UNIQUE  NOT NULL,
    description TEXT,
    media_type INTEGER REFERENCES media_types(media_type_id) ON DELETE SET NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    total_count INTEGER NOT NULL,
    unit INTEGER REFERENCES units(unit_id) ON DELETE SET NULL          
);   
 

CREATE TABLE genres (
    genre_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    genre_name varchar(20)
);

INSERT INTO genres (genre_name) VALUES 
                                    ('Comedy'),
                                    ('Romance'),
                                    ('Action'),
                                    ('Horror'),
                                    ('Drama'),
                                    ('Sci-Fi'),
                                    ('Fantasy');

CREATE TABLE media_genres (
    media_id INTEGER REFERENCES media(media_id) ON DELETE CASCADE,
    genre_id INTEGER REFERENCES genres(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (media_id, genre_id)
);

CREATE TABLE users(
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    username VARCHAR(50)  UNIQUE NOT NULL,
    email VARCHAR(50)  UNIQUE NOT NULL, 
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE media_progress (
    progress_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    media_id INTEGER REFERENCES media(media_id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(user_id) ON DELETE CASCADE,
    status_id INTEGER REFERENCES media_status(status_id) ON DELETE SET NULL,
    current_count INTEGER,
    start_date DATE DEFAULT CURRENT_DATE,
    end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);