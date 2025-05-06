package c6_classesAndObjectsEncapsulation;

public class PhoneBillDemo {

    public static void main(String[] args){
        PhoneBill bill = new PhoneBill(123456);
        bill.setMinutesUsed(900);
        bill.printBill();
    }
}
