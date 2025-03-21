package c13_exceptions;

public class DivisionByZeroExercise {

    public static void main(String[] args) {
        try{
            int c = 30/0;

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            System.out.println("Division is fun");
        }
    }
}
