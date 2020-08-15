--Create a SQL statement that reports all the student of a specific class when you know a
--specific class ID (aka something like “show all students of the class 1b, which has the ID=2”)
SELECT * from Students 
where students.course = 2;

--Create a SQL statement that reports all the student of a specific class when you know a
--specific class name (aka something like “show all students of the class ‘1b’; I don’t know the students ID”)
SELECT students.id, students.name, students.surname, students.email, courses.name 
from Students 
INNER Join courses ON students.course = courses.id 
WHERE courses.name = "3a";

--Add n-to-m relation to database that saves the data of type “a single teacher can teach
--several classes”. Connect the tables accordingly.

CREATE TABLE `teachingplan` (
     `course` int(11) DEFAULT NULL,
     `teacher` int(11) DEFAULT NULL,
     KEY `fk_course_id` (`course`),
     KEY `fk_teacher_id` (`teacher`),
     CONSTRAINT `fk_course_id` FOREIGN KEY (`course`) REFERENCES `courses` (`id`),
     CONSTRAINT `fk_teacher_id` FOREIGN KEY (`teacher`) REFERENCES `teachers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4