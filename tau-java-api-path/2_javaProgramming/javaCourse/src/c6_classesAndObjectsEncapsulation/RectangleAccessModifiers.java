package c6_classesAndObjectsEncapsulation;

/**
 *
 * ENCAPSULATION: Fundamental OOP principle that combines data and methods in a class.
 * It allows implementation details to be hidden while exposing a public interface for interaction.
 *
 * Access modifiers:
 * private - within class only
 * public - any class
 * protected - other classes within same package can access as well as sub classes
 * no access modifier - only classes within same package can access
 *
 * A visual representation:
 *
 *              Class   Package  Subclass(same pkg)  Subclass(diff pkg)  World
 * public	    ✔️	    ✔️	     ✔️	                 ✔️	                 ✔️
 * protected	✔️	    ✔️	     ✔️	                 ✔️	                 ❌
 * no modifier	✔️	    ✔️	     ✔️	                 ❌	                 ❌
 * private	    ✔️	    ❌	     ❌	                 ❌	                 ❌
 */
public class RectangleAccessModifiers {
    private double width;
    private double length;

    /*
    * The Java constructor, a simple method, is used to initialize Java objects.
    * It is automatically invoked at the time of object creation to set the object's preliminary states.
    * */
    public RectangleAccessModifiers(){
        // default contructor;
        this.length = 0;
        this.width = 0;
    }

    public RectangleAccessModifiers(double width, double length){
        // two ways of setting, using both to show alternative options
        setWidth(width);
        this.length = length;
    }

    public double getLength() {
        return length;
    }

    public void setLength(double length) {
        this.length = length;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public double calculatePerimeter(){
        return (length * 2) + (width * 2);
    }

    public double calculateArea(){
        return length * width;
    }
}
