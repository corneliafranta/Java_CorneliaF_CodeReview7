import java.util.ArrayList;
import java.util.Scanner;

public class UserInterface {

    public static Scanner input = new Scanner(System.in);

    public static void displayObjectListStudent(ArrayList<Student> students, String heading){
        System.out.println(String.format("                               %s                               \n**********************************************************************************", heading));

        for (Student student : students) {
            System.out.println(String.format("%-5s | %-55s | %-55s | %-55s ", student.getId(), student.getName(), student.getSurname(), student.getEmail()));

        }

    }

    public static void displayObjectListTeacher(ArrayList<Teacher> teachers, String heading){
        System.out.println(String.format("                               %s                               \n**********************************************************************************", heading));

        for (Teacher teacher : teachers) {
            System.out.println(String.format("%-5s | %-55s | %-55s | %-55s ", teacher.getId(), teacher.getName(), teacher.getSurname(), teacher.getEmail()));
        }

    }
    public static void displayObjectListCourses(ArrayList<Course> courses, String heading){
        System.out.println(String.format("                               %s                               \n**********************************************************************************", heading));

        for (Course course : courses) {
            System.out.println(String.format("%-5s | %-55s ", course.getId(), course.getName()));
        }

    }

    public static void displayTeachersCourses(ArrayList<String>teacher, ArrayList<String>courses){
        System.out.println(String.format("ID%s: Teacher '%s %s' teaches: ", teacher.get(0), teacher.get(1), teacher.get(2)));
        System.out.println("---------------------------------------------------------------------");

        for (String course : courses){
            System.out.println(course);
        }

    }

    public static Integer showMenu() {

        Scanner input = new Scanner(System.in);

        System.out.println("+-----------------------------------------------------------------------------------+");
        System.out.println("|                                      WELCOME                                      |");
        System.out.println("|                               Please choose an option                             |");
        System.out.println("+-----------------------------------------------------------------------------------+");
        System.out.println("                                                                                     ");
        System.out.println("                                   1) Display Students                               ");
        System.out.println("                                   2) Display Teachers                               ");
        System.out.println("                                   3) Display Classes                                ");
        System.out.println("                                   4) Display Classes of Teacher                     ");
        System.out.println("                                   5) Print Report of specific table                 ");
        System.out.println("                                   6) EXIT                                           ");
        System.out.println("                                                                                     ");
        System.out.println("+-----------------------------------------------------------------------------------+");
        System.out.println("Please enter your choice:                                                            ");

        return input.nextInt();

    }
}
