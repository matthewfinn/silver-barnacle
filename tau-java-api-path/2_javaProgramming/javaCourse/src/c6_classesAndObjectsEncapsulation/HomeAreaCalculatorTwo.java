package c6_classesAndObjectsEncapsulation;

import java.util.Scanner;

public class HomeAreaCalculatorTwo {
    private final Scanner sc = new Scanner(System.in);
    public static void main(String[] args){

        HomeAreaCalculatorTwo calculator = new HomeAreaCalculatorTwo(); // call to implicit default constructor
        RectangleAccessModifiers kitchen = calculator.getRoom();
        RectangleAccessModifiers bathroom = calculator.getRoom();

        double area = calculator.calculateTotalArea(kitchen, bathroom);
        System.out.printf("Total area is %.2f", area);
        calculator.sc.close();

    }

    public RectangleAccessModifiers getRoom(){
        System.out.println("Enter room width: ");
        double roomWidth = sc.nextDouble();

        System.out.println("Enter room length: ");
        double roomLength = sc.nextDouble();

        return new RectangleAccessModifiers(roomWidth, roomLength);
    }

    public double calculateTotalArea(RectangleAccessModifiers one, RectangleAccessModifiers two){
        return one.calculateArea() + two.calculateArea();
    }

}
