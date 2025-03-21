package c12_collections;

import java.util.*;

/**
 * Collection
 * <a href="https://docs.oracle.com/javase/tutorial/collections/interfaces/index.html">...</a>
 *
 * Set
 * <a href="https://docs.oracle.com/javase/8/docs/api/java/util/Set.html">...</a>
 * Unordered uniqye elements
 *
 * List
 * <a href="https://docs.oracle.com/javase/8/docs/api/java/util/List.html">...</a>
 * Ordered elements which can be accessed by position
 *
 * Queue
 * <a href="https://docs.oracle.com/javase/tutorial/collections/interfaces/queue.html">...</a>
 * Ordered elements for processing, Access in the order elements were added i.e. FIFO
 *
 * Map
 * <a href="https://docs.oracle.com/javase/9/docs/api/java/util/Map.html">...</a>
 * Unordered unique key-value, doesn't inherit from Collections
 *
 * Lambda Expressions
 * <a href="https://docs.oracle.com/javase/tutorial/java/javaOO/lambdaexpressions.html">...</a>
 *
 *
 */
public class CollectionsDemo {
    public static void main(String[] args){
        setDemo();
//        listDemo();
//        queueDemo();
        mapDemo();
    }

    public static void setDemo(){
        Set<String> fruits = new HashSet();
        fruits.add("apple");
        fruits.add("lemon");
        fruits.add("banana");
        fruits.add("orange");
        fruits.add("lemon");

        System.out.println("Set size: " + fruits.size());
        System.out.println("Set content: " + fruits);

        // looping through a collection
        System.out.println("\n--------------------Looping through a collection--------------------\n");
        // Option 1
        System.out.println("\n--------------------Option 1 - Iterator--------------------\n");
        Iterator i = fruits.iterator();
        while(i.hasNext()){
            System.out.println(i.next());
        }

        // Option 2
        System.out.println("\n--------------------Option 2 - Enhanced For Loop--------------------\n");
        for(String item : fruits){
            System.out.println(item);
        }

        // Option 3
        System.out.println("\n--------------------Option 3 - For Each With A Lambda--------------------\n");
        fruits.forEach(item -> System.out.println(item));

        // Option 4 - suggested by IDE, "replace lambda with method reference"
        System.out.println("\n--------------------Option 4 - method reference--------------------\n");
        fruits.forEach(System.out::println);
    }

    public static void mapDemo(){
        Map<String, Integer> fruitCalories = new HashMap();
        fruitCalories.put("apple", 95);
        fruitCalories.put("lemon", 20);
        fruitCalories.put("banana", 105);
        fruitCalories.put("orange", 45);
        fruitCalories.put("lemon", 17);

        System.out.println("\n--------------------Iterate Over a MAP--------------------\n");
        System.out.println("\n--------------------Option 1 enhanced for--------------------\n");

        for(Map.Entry<String, Integer> entry: fruitCalories.entrySet()){
            System.out.println(entry.getValue());
        }
        System.out.println("\n--------------------Option 2 enhanced for dynamically typed--------------------\n");

        for(var entry: fruitCalories.entrySet()){
            System.out.println(entry.getValue());
        }

        System.out.println("\n--------------------Option 3 For each--------------------\n");
        fruitCalories.forEach(
                (k,v) -> System.out.println("Fruit: " + k +", Calories: " + v)
        );



    }




}

