package c13_exceptions;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * An exception is an unexpected event that occurs at runtime due to an error. Exceptions disrupt the normal flow of a program.
 *
 * Your method can initiate the throwing of an exception by using the word throw inside of the method's body and instantiating an exception.
 *
 */
public class ExceptionHandling {

    public static void main(String[] args) throws IOException {
        //createNewFile();
        //readNumbersFromFile();
        createNewFileRethrow();
    }

    public static void createNewFile() {
        File file = new File("resources/nonexistent.txt");
        try {
            boolean created = file.createNewFile();
        } catch (Exception e) {
            System.out.println("Error Message: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void createNewFileRethrow() throws IOException {
        File file = new File("resources/nonexistent.txt");
        boolean created = file.createNewFile();
    }

    public static void readNumbersFromFile() {
        File file = new File("resources/numbers.txt");
        Scanner sc = null;
        try {
            sc = new Scanner(file);

            while (sc.hasNextDouble()) {
                double number = sc.nextDouble();
                System.out.println(number);
            }
        } catch (FileNotFoundException | InputMismatchException e) {
            e.printStackTrace();
        } finally {
            assert sc != null;
            sc.close();
        }
    }

    // a different type of Try syntax
    public static void readNumbersFromFileTwo() {
        File file = new File("resources/numbers.txt");
        // This only works with classes that implement the Closable or AutoClosable interfaces, and Scanner happens to be one of those.
        // Otherwise, you may have other cases where finally is a good approach to execute some other statements, and that’s fine as well.
        try (Scanner sc = new Scanner(file)) {
            while (sc.hasNextDouble()) {
                double number = sc.nextDouble();
                System.out.println(number);
            }
        } catch (FileNotFoundException | InputMismatchException e) {
            e.printStackTrace();
        }
    }

    public static void calculateSalary(double hours, double rate){
        if(hours > 40){
            throw new IllegalArgumentException("We don't allow overtime");
        }
    }

}
