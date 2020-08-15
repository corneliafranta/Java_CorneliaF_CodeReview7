import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.ArrayList;

public class Database {


    Connection myConnection = null;

    public void establishConnection(String database) {
        Connection connection;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = String.format("jdbc:mysql://localhost:3306/%s", database);

            String user = "root";
            String password = "";

            connection = DriverManager.getConnection(url, user, password);
            connection.setAutoCommit(true);
            this.myConnection = connection;


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    public ResultSet getResultSet(String query) {

        Statement statement;
        ResultSet resultSet = null;
        try {
            assert myConnection != null;
            statement = myConnection.createStatement();
            resultSet = statement.executeQuery(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultSet;
    }


    public ArrayList<Student> getStudents() throws SQLException {

        ResultSet resultSet = getResultSet("SELECT * from students");
        ArrayList<Student> students = new ArrayList<>();

        while (resultSet.next()) {
            int id = (int) resultSet.getLong("id");
            String name = resultSet.getString("name");
            String surname = resultSet.getString("surname");
            String email = resultSet.getString("email");

            students.add(new Student(id, name, surname, email));
        }
        return students;
    }

    public ArrayList<Teacher> getTeachers() throws SQLException {

        ResultSet resultSet = getResultSet("SELECT * from teachers");
        ArrayList<Teacher> teachers = new ArrayList<>();

        while (resultSet.next()) {
            int id = (int) resultSet.getLong("id");
            String name = resultSet.getString("name");
            String surname = resultSet.getString("surname");
            String email = resultSet.getString("email");
            teachers.add(new Teacher(id, name, surname, email));
        }
        return teachers;
    }

    public ArrayList<Course> getCourses() throws SQLException {

        ResultSet resultSet = getResultSet("SELECT * from courses");
        ArrayList<Course> courses = new ArrayList<>();

        while (resultSet.next()) {
            int id = (int) resultSet.getLong("id");
            String name = resultSet.getString("name");
            courses.add(new Course(id, name));

        }
        return courses;
    }

    public ArrayList<ArrayList<String>> showCoursesOfTeacher(Integer teacherID) throws SQLException {

        String sql = String.format("SELECT courses.name FROM courses Inner JOIN teachingplan ON courses.id = teachingplan.course INNER JOIN teachers ON teachingplan.teacher = teachers.id WHERE teachers.id = %d", teacherID);
        String sql2 = String.format("SELECT teachers.id, teachers.name, teachers.surname FROM teachers WHERE teachers.id = %d", teacherID);
        ResultSet resultSetCourses = getResultSet(sql);
        ResultSet resultSetTeacher = getResultSet(sql2);


        ArrayList<String> teachersData = new ArrayList<>();
        while (resultSetTeacher.next()) {
            teachersData.add(String.valueOf(resultSetTeacher.getLong("id")));
            teachersData.add(resultSetTeacher.getString("name"));
            teachersData.add(resultSetTeacher.getString("surname"));

        }


        ArrayList<String> courses = new ArrayList<>();

        while (resultSetCourses.next()) {
            courses.add(resultSetCourses.getString("name"));
        }

        ArrayList<ArrayList<String>> result = new ArrayList<>();
        result.add(teachersData);
        result.add(courses);

        return result;

    }

    private ArrayList<String> getTableNames() throws SQLException {
        ArrayList<String> tableNames = new ArrayList<>();
        String query = "SELECT table_name FROM information_schema.tables\n" +
                "WHERE table_schema = 'cr7-franta';";
        ResultSet resultSet = getResultSet(query);
        while (resultSet.next()) {
            tableNames.add(resultSet.getString("table_name"));
        }
        return tableNames;
    }

    public ArrayList<ArrayList<String>> getTableData(String tableName) throws SQLException {
        ArrayList<ArrayList<String>> data = new ArrayList<>();

        ArrayList<String> validTableNames = getTableNames();


        if (validTableNames.contains(tableName)) {
            String sql = String.format("SELECT * from %s", tableName);
            ResultSet resultSet = getResultSet(sql);

            while (resultSet.next()) {
                ResultSetMetaData metaData = resultSet.getMetaData();
                int columnCount = metaData.getColumnCount();
                ArrayList<String> dataSet = new ArrayList<>();

                for (int i = 1; i <= columnCount; i++) {
                    String value = resultSet.getObject(i).toString();
                    dataSet.add(value);
                }

                data.add(dataSet);
            }

        } else {
            System.out.println("invalid Input");
        }
        return data;

    }

    public void printReport(String tableName) throws SQLException {


        ArrayList<ArrayList<String>> data = getTableData(tableName);

        if (data.size() > 0) {

            try {
                Path currentRelativePath = Paths.get("");
                String projectPath = currentRelativePath.toAbsolutePath().toString();
                String fileName = String.format("%s_Report.txt", tableName);
                File file = new File(projectPath + "/Reports/" + fileName);

                System.out.printf("\nFile Created %s \n", file.getName());
                FileWriter fileWriter = new FileWriter(file.getAbsolutePath(), false);
                fileWriter.write(String.format("%s \n --------------------------------------------------------------------------- \n", tableName.toUpperCase()));
                for (ArrayList<String> dataSet : data) {
                    switch (tableName) {
                        case "students":
                            fileWriter.write(String.format("%5s) %-30s | %-30s | %-30s | %-4s \n", dataSet.get(0), dataSet.get(1), dataSet.get(2), dataSet.get(3), dataSet.get(4)));
                            break;
                        case "teachers":
                            fileWriter.write(String.format("%5s) %-30s | %-30s | %-30s  \n", dataSet.get(0), dataSet.get(1), dataSet.get(2), dataSet.get(3)));
                            break;
                        case "courses":
                            fileWriter.write(String.format("%s) %-5s  \n", dataSet.get(0), dataSet.get(1)));
                            break;
                        case "teachingplan":
                            fileWriter.write(String.format("%-5s | %-5s  \n", dataSet.get(0), dataSet.get(1)));
                            break;
                    }
                }

                fileWriter.close();
                System.out.println("Created File successfully");
            } catch (IOException e) {
                System.out.println("An error occurred \n");
                e.printStackTrace();
            }
        } else {
            System.out.println("CANT BE EXECUTED!!!!!");
        }

    }


}

