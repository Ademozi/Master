class Employee {

    private String name;
    private double baseSalary;

    public Employee(String name, double baseSalary) {

        if (baseSalary < 0) {
            throw new IllegalArgumentException ("baseSalary must be positive");
        }
        else {
            this.name = name;
            this.baseSalary = baseSalary;
        }
    }

    public String getName() {
        return name;
    }

    public double getBaseSalary () {
        return baseSalary;
    }

    public void raiseSalary (double percent) {
        if (percent < 0) {
            throw new IllegalArgumentException ("percent must be positive");
        }
        baseSalary = baseSalary + (baseSalary * percent / 100);
    }
}