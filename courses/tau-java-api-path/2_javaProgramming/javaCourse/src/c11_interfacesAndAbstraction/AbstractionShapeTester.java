package c11_interfacesAndAbstraction;

public class AbstractionShapeTester {

    public static void main(String[] args) {
        Shape rectangle = new Rectangle(12, 10);
        rectangle.print();
        System.out.println(rectangle.calculateArea());
    }
}
