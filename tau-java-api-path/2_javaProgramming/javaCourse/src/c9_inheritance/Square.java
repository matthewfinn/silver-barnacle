package c9_inheritance;


/**
 * NOTES
 *
 * It's encouraged that you use the override annotation, which is the @ symbol followed by the word Override — @Override.
 * This is not required, but it's strongly encouraged.
 * This lets Java know that your intention is to override the method that you inherited from your super class.
 *
 * Constructors are not technically members of a class, and therefore they are not inherited.
 *
 * All the public and protected methods and fields in a superclass are inherited, but the private methods and fields are not.
 *
 * Also, if there are any final methods, meaning methods that have the word final in the header, these are inherited but cannot be overridden.
 *
 * Java classes can only directly inherit from one superclass.
 * However, a superclass can also inherit from another class, thus forming a chain of inheritance where the subclass inherits from their ancestor classes as well.
 *
 * The subclass method cannot have weaker (more restrictive) access than the superclass method.
 * However, the subclass can have stronger (more permissive) access.
 */
public class Square extends Rectangle {

    @Override
    public double calculatePerimeter(){
        return sides * length;
    }

    public void print(String type){
        System.out.println("I am a " + type);
    }
}
