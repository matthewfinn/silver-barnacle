package c11_interfacesAndAbstraction;

/**
 * Interfaces cannot be instantiated.
 *
 * Interfaces are implemented, not extended.
 *
 * Any class that implements an interface must implement all of its methods or it must declare itself abstract.
 *
 * Methods in an interface must be default or abstract (there's no explicit declaration needed for abstract methods)
 *
 * Access modifier on the methods in an interface are public by default
 */
public class CustomerInterfaceTest {
    public static void main(String[] args) {
        Product book = new Book();
        book.setPrice(10.99);

    }
}
