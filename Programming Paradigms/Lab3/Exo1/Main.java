
public class Main {

    public static void main(String[] args) {

        Employee e1 = new Employee("Dhiae", 2000);
        Employee e2 = new Employee("Chemssou", 0);

        e1.raiseSalary(10);
        e2.raiseSalary(4);
        e1.raiseSalary(10);

        System.out.println(
            e1.getBaseSalary() + " " + e2.getBaseSalary()
        );
    }
}
