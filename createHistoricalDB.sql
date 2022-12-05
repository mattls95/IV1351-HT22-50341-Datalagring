CREATE TABLE "historical_lesson"(
    "id" SERIAL PRIMARY KEY,
    "lesson_type" type,
    "skill_level" varchar(100),
    "genre" varchar(100),
    "time" timestamp,
    "price" int
);

CREATE TABLE "historical_student_lesson"(
    "student_id" SERIAL REFERENCES "student" ON DELETE CASCADE,
    "lesson_id" SERIAL REFERENCES "lesson" ON DELETE CASCADE,
    PRIMARY KEY ("student_id", "lesson_id")
);

CREATE TABLE "historical_student"(
    "id" SERIAL PRIMARY KEY,
    "person_number" varchar(12) UNIQUE NOT NULL,
    "first_name" varchar(100),
    "last_name" varchar(100),
    "street" varchar(100),
    "zip" varchar(5),
    "city" varchar(100),
    "email" varchar(100),
    "phone" varchar(100),
    "contact_email" varchar(100),
    "contact_phone" varchar(100)
);