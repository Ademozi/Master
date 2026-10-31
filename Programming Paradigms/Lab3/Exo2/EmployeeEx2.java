public abstract class EmployeeEx2 {
    private String name;
    private double baseSalary;

    public EmployeeEx2(String var1, double var2) {
        if (var2 < (double)0.0F) {
            throw new IllegalArgumentException("baseSalary must be positive");
        } else {
            this.name = var1;
            this.baseSalary = var2;
        }
    }

    public String getName() {
        return this.name;
    }

    public double getBaseSalary() {
        return this.baseSalary;
    }

    public void raiseSalary(double var1) {
        if (var1 < (double)0.0F) {
            throw new IllegalArgumentException("percent must be positive");
        } else {
            this.baseSalary += this.baseSalary * var1 / (double)100.0F;
        }
    }

    public abstract double monthlySalary();
}
