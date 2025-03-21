package c10_polymorphism;

public class Cat extends Animal{

    @Override
    public void makeSound(){
        System.out.println("Meow!");
    }

    public void sleep(){
        System.out.println("I like to sleep!");
    }
}
