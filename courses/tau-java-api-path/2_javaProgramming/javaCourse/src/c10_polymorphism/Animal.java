package c10_polymorphism;

/**
 * Inheritance enables polymorphism because a subclass can override a method from the parent class.
 * So while they are related, inheritance is about reusing code, and polymorphism is about flexibility and dynamic behavior.
 *
 * Polymorphism is the ability to take multiple forms. Specifically, in object-oriented programming,
 * polymorphism is where a subclass can define their own unique behaviors, and yet share some of the same behaviors of their superclass.
 *
 * An object can have a superclass type and a subclass instance.
 * Polymorphic objects can only access the methods of their type, not of their instance, unless you use casting.
 * If a method is overwritten by the subclass, the polymorphic object will execute the overwritten method at runtime.
 * The instanceof operator is used to determine if an object is an instance of a certain class.
 */
public class Animal {

    public void makeSound(){
        System.out.println("Unknown sound");
    }

}
