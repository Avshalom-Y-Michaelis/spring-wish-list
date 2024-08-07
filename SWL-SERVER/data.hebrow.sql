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

--1
INSERT INTO region (name)
VALUES ('הגולן');

--2
INSERT INTO region (name)
VALUES ('שפלה');

--3
INSERT INTO region (name)
VALUES ('אזור ירושלים');

--4
INSERT INTO region (name)
VALUES ('הנגב הצפוני');

--5
INSERT INTO region (name)
VALUES ('אזור הכרמל');


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין לבן',
        'מעיין מאוד יפה, יכלו לפעמים ליהיות עמוס ולא נעים, אבל עם באים בשעות הבוקר, אז הוא רגועה ויש הרבה מקומות טובים לפקך, בנוסף יש במקום גם מעיין נמוך המיועד לילדים',
        3,
        true,
        3);

        INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין לבן',
        'מעיין מאוד יפה, יכלו לפעמים ליהיות עמוס ולא נעים, אבל עם באים בשעות הבוקר, אז הוא רגועה ויש הרבה מקומות טובים לפקך, בנוסף יש במקום גם מעיין נמוך המיועד לילדים',
        3,
        true,
        3);

INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין לבן',
        'מעיין מאוד יפה, יכלו לפעמים ליהיות עמוס ולא נעים, אבל עם באים בשעות הבוקר, אז הוא רגועה ויש הרבה מקומות טובים לפקך, בנוסף יש במקום גם מעיין נמוך המיועד לילדים',
        3,
        true,
        3);



INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין קדם',
        'מעיין מאוד יפה, בתור ך מעין מערה. יש ניקה מאוד ארוכה ושווה, שווה להביא פנס ראש. הכניסה דרך טירת הכמל, ויש משהו כמו רבע שעה הליכה',
        5,
        true,
        5);

        INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין קדם',
        'מעיין מאוד יפה, בתור ך מעין מערה. יש ניקה מאוד ארוכה ושווה, שווה להביא פנס ראש. הכניסה דרך טירת הכמל, ויש משהו כמו רבע שעה הליכה',
        5,
        true,
        5);

        INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין קדם',
        'מעיין מאוד יפה, בתור ך מעין מערה. יש ניקה מאוד ארוכה ושווה, שווה להביא פנס ראש. הכניסה דרך טירת הכמל, ויש משהו כמו רבע שעה הליכה',
        5,
        true,
        5);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין מוקש',
        NULL,
        NULL,
        false,
        1);

        INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין מוקש',
        NULL,
        NULL,
        false,
        1);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין איתמר',
        NULL,
        NULL,
        false,
        3);

INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('עין איתמר',
        NULL,
        NULL,
        false,
        3);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('בית לאה',
        'מעיין חמוד, ךא שווה טירה גולה, נוח בגלל שהוא במרכז',
        1,
        true,
    	2);
    
INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('בית לאה',
        'מעיין חמוד, ךא שווה טירה גולה, נוח בגלל שהוא במרכז',
        1,
        true,
        2);

INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('נחל דרגות',
        NULL,
        NULL,
        false,
        3);


INSERT INTO spring (name, description, rating, has_been_visited, region_id)
VALUES ('נחל דרגות',
        NULL,
        NULL,
        false,
        3);
