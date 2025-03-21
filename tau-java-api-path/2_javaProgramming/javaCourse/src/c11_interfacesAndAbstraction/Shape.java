package c11_interfacesAndAbstraction;

/**
 * Abstract classes and methods are templates that are meant to be implemented by their subclasses.
 *
 * The classes and methods are declared abstract by using the abstract keyword.
 *
 * If a subclass inherits from an abstract class,
 * it must implement its abstract methods or the class itself must be declared as abstract.
 *
 * Abstract classes cannot be instantiated. They are only to be used as a superclass.
 * even one method in a class is abstract, then the entire class must be declared abstract as well.
 */
public abstract class Shape {

    abstract double calculateArea();

    public void print(){
        System.out.println("I am a " + getClass().getSimpleName());
    }
}
