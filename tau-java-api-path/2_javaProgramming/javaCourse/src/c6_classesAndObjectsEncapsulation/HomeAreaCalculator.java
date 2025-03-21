package c6_classesAndObjectsEncapsulation;
/*
 * Write a class that creates instances of the `Rectangle` class to find the
 * total area of two rooms in a house.
 */
public class HomeAreaCalculator {


    public static void main(String[] args){
        /*
         * RECTANGLE 1
         */
        // Create instance of Rectangle class
        RectangleAccessModifiers roomOne = new RectangleAccessModifiers();
        roomOne.setWidth(30);
        roomOne.setLength(40);
        double roomOneArea = roomOne.calculateArea();

        /*
         * RECTANGLE 1
         */
        RectangleAccessModifiers roomTwo = new RectangleAccessModifiers(30, 60);
        double roomTwoArea = roomTwo.calculateArea();

        double totalArea = roomOneArea + roomTwoArea;
        System.out.printf("Area of both rooms is %.2f", totalArea);
    }

}
