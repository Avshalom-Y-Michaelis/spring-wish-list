CREATE TABLE public.region (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,  
    name TEXT NOT NULL
);

CREATE TABLE public.spring (
    id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,  
    name TEXT NOT NULL,
    description TEXT,
    rating integer,
    has_been_visited boolean not NULL,
    region_id bigint REFERENCES region (id)
); 

TRUNCATE ONLY region, spring RESTART IDENTITY; 

INSERT INTO region (name)
VALUES ('hgolan');


INSERT INTO region (name)
VALUES ('shfela');


INSERT INTO region (name)
VALUES ('jerusalem');


INSERT INTO region (name)
VALUES ('hnegev');


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('eyn lavan',
        'noiss',
        3,
        true,
        1);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('eyn kedem',
        'oh yeaa',
        5,
        true,
        2);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('hsvitan',
        NULL,
        NULL,
        false,
        4);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('nahac csiv',
        'way not',
        4,
        true,
        4);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('eyn itamar',
        NULL,
        NULL,
        false,
        2);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('bait leat',
        'meaa',
        1,
        true,
        3);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('hsnahal dragot',
        NULL,
        NULL,
        false,
        1);
