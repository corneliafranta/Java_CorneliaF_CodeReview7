import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) throws SQLException, IOException {

        Database myDatabase = new Database();

        myDatabase.establishConnection("cr7-franta");

        char result = 'y';
        while (result == 'y'){

            int answer = UserInterface.showMenu();

            switch (answer){
                case 1:
                    ArrayList<Student> students = myDatabase.getStudents();
                    UserInterface.displayObjectListStudent(students, "All Students");
                    break;

                case 2:
                    ArrayList<Teacher>teachers = myDatabase.getTeachers();
                    UserInterface.displayObjectListTeacher(teachers, "All Teachers");
                    break;

                case 3:
                    ArrayList<Course>courses = myDatabase.getCourses();
                    UserInterface.displayObjectListCourses(courses, "All Courses");
                    break;

                case 4:
                    System.out.println("Please enter teachers ID");
                    answer = UserInterface.input.nextInt();
                    ArrayList<ArrayList<String>>data = myDatabase.showCoursesOfTeacher(answer);
                    UserInterface.input.nextLine();
                    UserInterface.displayTeachersCourses(data.get(0), data.get(1));
                    break;

                case 5:
                    System.out.println("Enter Tablename: ");
                    String tableName = UserInterface.input.nextLine();
                    myDatabase.printReport(tableName);
                    break;

                case 6:
                    result = 'n';
                    break;

            }

            if (result == 'y'){
                System.out.println("Do you want to return to the Menu? (y/n)");
                String returnAnswer = UserInterface.input.nextLine().toLowerCase();

                if (!returnAnswer.equals("y") && !returnAnswer.equals("n")){
                    System.out.println("Invalid Input");
                    returnAnswer = "y";
                }

                result = returnAnswer.charAt(0);

            }
        }

    }
}
