package c4_whileDoWhileForNested;

import java.util.Scanner;

/*
 * NESTED LOOPS:
 * Find the average of each student's test scores
 */
public class AverageTestScore {

    public static void main(String args[]){

        //Initialize what we know
        int numberOfStudents = 3;
        int numberOfTests = 4;
        Scanner sc = new Scanner(System.in);

        //Process all students
        for(int i = 0; i < numberOfStudents; i++){

            double total = 0;
            for(int j = 0; j<numberOfTests; j++){
                System.out.printf("Enter the score for test #%d%n", j+1);
                double score = sc.nextDouble();
                total += score;

            }
            double average = total/numberOfTests;
            System.out.printf("Average test score for student %d is %.2f%%\n", i+1, average);

        }
        sc.close();
    }
}
