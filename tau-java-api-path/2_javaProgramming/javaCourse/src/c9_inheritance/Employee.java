package c9_inheritance;

import java.util.Date;

/**
 * Subclass, Child class, Derived class
 *
 */
public class Employee extends Person{

    private int id;
    private String title;
    private double salary;
    private Date startDate;
    private Date endDate;

    public Employee() {
        System.out.println("Default Employee NoArgs Constructor");
    }

    enum ContractType{
        PART_TIME,
        FULL_TIME,
        FIXED_TERM
    }

    public ContractType getContractType() {
        return contractType;
    }

    public void setContractType(ContractType contractType) {
        this.contractType = contractType;
    }

    private ContractType contractType;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return super.toString() +
                "Employee{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", salary=" + salary +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", contractType=" + contractType +
                '}';
    }

}
