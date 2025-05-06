package c9_inheritance;

/**
 * NOTES
 *
 * Inheritance is where one class becomes an extension of another class, therefore inheriting the members of that class.
 * When an inheritance relationship is created between these two classes, then the child class inherits the members of the parent class.
 *
 * This allows classes to reuse data that already exists within other classes.
 *
 * Subclasses should be a more specialized form of the superclass that they inherit from.
 *
 * RULES
 * Superclass constructors run 1st
 * Explicit calls can be made from subclass constructor with super()
 * Explicit calls to superclass constructor must be first statement in subclass constructor
 * If superclass does not have a default constructor the subclass must explicitly class one of its other constructors
 *
 *
 *
 *  */
public class InheritanceTest {

    public static void main(String[] args) {

        Person person = new Person();
        person.setName("Test Person");

        Employee emp1 = new Employee();
        emp1.setContractType(Employee.ContractType.PART_TIME);
        emp1.setAge(23);
        emp1.setHeight(1.78);
        System.out.println(emp1);

        Rectangle rectangle = new Rectangle();
        rectangle.print();;

        Square sq1 = new Square();
        sq1.print("square");
    }

}
