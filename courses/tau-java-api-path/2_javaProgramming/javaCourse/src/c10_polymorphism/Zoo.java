package c10_polymorphism;

public class Zoo {

    public static void main(String[] args) {

        Dog rocky = new Dog();
        rocky.fetch();
        rocky.makeSound();
        feedAnimal(rocky);

        Animal hayden = new Dog();
        hayden.makeSound();
        feedAnimal(hayden);
        // can't access fetch because type is Animal

        hayden = new Cat();
        hayden.makeSound();
        // can't access sleep because type is Animal

        // we can get around this by casting, not changing the object it's just for this call
        ((Cat) hayden).sleep();
        feedAnimal(hayden);

    }

    public static void feedAnimal(Animal animal){

        if(animal instanceof Dog){
            System.out.println("Getting Dog Food!");
        } else if (animal instanceof Cat) {
            System.out.println("Getting Cat Food!");

        }

    }
}
