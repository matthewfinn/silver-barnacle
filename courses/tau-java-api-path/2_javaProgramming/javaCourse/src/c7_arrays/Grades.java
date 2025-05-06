package c7_arrays;

import java.util.Scanner;
/*
 * Create a program that allows a user to enter any
 * number of grades and provides them with their
 * average score, as well as the highest and lowest scores.
 *
 *
 * NOTES
 * A two-dimensional array is like a table which holds multiple sets of data in rows, in columns.
 * i.e. int[][] grades = new int[24][4];

 *
 * The 1st one indicates the number of rows.
 * The 2nd one indicates the number of columns.
 */
public class Grades {
    private static int grades[];
    private static Scanner scanner = new Scanner(System.in);

    public static void main(String[] args){

        System.out.println("How many grades would you like to enter?");
        grades = new int[scanner.nextInt()];
        getGrades();

        System.out.println("Average: " + String.format("%.2f", calculateAverageGrade()));
        System.out.println("Highest: " + getHighest());
        System.out.println("Lowest: " + getLowest());
    }

    public static void getGrades(){
        for(int i = 0; i < grades.length; i++){
            System.out.println("Enter Grade #" + (i+1));
            grades[i] = scanner.nextInt();

        }
    }

    public static int sumUpGrade(){
        int sum = 0;
        for(int value : grades){
            sum+=value;
        }
        return sum;
    }

    public static double calculateAverageGrade(){
        return (double) sumUpGrade() /grades.length;
    }

    public static int getHighest(){
        int highest = grades[0];
        for(int grade : grades){
            if(grade > highest){
                highest = grade;
            }
        }
        return highest;
    }

    public static int getLowest(){
        int lowest = grades[0];
        for(int grade : grades){
            if(grade < lowest){
                lowest = grade;
            }
        }
        return lowest;
    }
}
