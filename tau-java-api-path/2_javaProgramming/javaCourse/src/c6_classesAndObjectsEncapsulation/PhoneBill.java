package c6_classesAndObjectsEncapsulation;

/*
So, a phone bill should have an ID, a base cost, a number of allotted minutes and a number of minutes used. And then,
it should also be able to calculate the overage, calculate the tax, and calculate the total.

And then, it should also be able to print an itemized bill.

You should also include three constructors
1. a default one
2. one that accepts the ID only
3. one that accepts all fields

Now no matter which of these constructors you use, all fields should be set eventually.
Then you can also create a different class that instantiates the PhoneBill and prints out an itemized bill.

*/
public class PhoneBill {
    private int id;
    private double cost;
    private double maxMinutesAllowed;
    private double minutesUsed;
    private static double OVERAGE_RATE = 0.25; // €0.25 per minute over
    private static double TAX_RATE = 0.15; // 15% tax

    public PhoneBill(){
        id = 1;
        cost = 50.00;
        minutesUsed = 800;
        maxMinutesAllowed = 960;
    }

    public PhoneBill(int id){
        this.id = id;
        cost = 50.00;
        minutesUsed = 960;
        maxMinutesAllowed = 800;
    }

    public PhoneBill(int id, double baseCost, int allottedMinutes, int minutesUsed){
        this.id = id;
        this.cost = baseCost;
        this.maxMinutesAllowed = allottedMinutes;
        this.minutesUsed = minutesUsed;
    }


    private double calculateOverage(){
        return minutesUsed >= maxMinutesAllowed ? (minutesUsed - maxMinutesAllowed) * OVERAGE_RATE : 0;
    }

    private double calculateTaxDue(){
        return (cost + calculateOverage()) * TAX_RATE;
    }

    private double calculateTotal(){
        return cost + calculateOverage() +calculateTaxDue();
    }

    public void printBill(){
        System.out.println(this); // overridden toString method defined below
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public double getMaxMinutesAllowed() {
        return maxMinutesAllowed;
    }

    public void setMaxMinutesAllowed(double maxMinutesAllowed) {
        this.maxMinutesAllowed = maxMinutesAllowed;
    }

    public double getMinutesUsed() {
        return minutesUsed;
    }

    public void setMinutesUsed(double minutesUsed) {
        this.minutesUsed = minutesUsed;
    }

    @Override
    public String toString() {
        return "---- PHONE BILL ----"
                + "\nID " + id
                + "\nBase Rate: €" + cost
                + "\nOverage Fee: €" + String.format("%.2f", calculateOverage())
                + "\nTaxes: €" + String.format("%.2f", calculateTaxDue())
                + "\nTotal: €" + String.format("%.2f", calculateTotal());
    }
}
