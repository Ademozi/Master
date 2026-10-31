# Exercise 1 — Employee Class (Java)

## Objective

Practice basic object-oriented programming concepts in Java:

- Encapsulation using `private` attributes
- Constructors and validation
- Getters without setters
- Object state and instance attributes
- Exceptions with `IllegalArgumentException`
- Methods that modify object state
- Imperative programming

## 1. Employee class

Create a file named `Employee.java`:

```java
public class Employee {

    private final String name;
    private double baseSalary;

    public Employee(String name, double baseSalary) {
        if (baseSalary < 0) {
            throw new IllegalArgumentException(
                "Salary cannot be negative."
            );
        }

        this.name = name;
        this.baseSalary = baseSalary;
    }

    public String getName() {
        return name;
    }

    public double getBaseSalary() {
        return baseSalary;
    }

    public void raiseSalary(double percent) {
        if (percent <= 0) {
            throw new IllegalArgumentException(
                "Percentage must be positive."
            );
        }

        baseSalary = baseSalary + (baseSalary * percent / 100);
    }
}
```

### Explanation

- `private final String name`: the name is private and cannot be reassigned after construction.
- `private double baseSalary`: the salary is private but can change when a valid raise is applied.
- The constructor rejects a negative starting salary.
- `getName()` and `getBaseSalary()` allow callers to read the attributes.
- No setters are provided.
- `raiseSalary(percent)` rejects percentages that are zero or negative, then increases the current salary.

Salary formula:

```text
new salary = current salary + (current salary * percent / 100)
```

## 2. Main class to test the Employee class

Create a file named `Main.java` in the same directory:

```java
public class Main {
    public static void main(String[] args) {

        Employee e1 = new Employee("Amine", 2000);
        Employee e2 = new Employee("Lina", 2500);

        e1.raiseSalary(10);
        e2.raiseSalary(4);
        e1.raiseSalary(10);

        System.out.println(
            e1.getBaseSalary() + " " + e2.getBaseSalary()
        );
    }
}
```

### Compile and run

Make sure `Employee.java` and `Main.java` are in the same folder. Open a terminal in that folder and run:

```bash
javac Employee.java Main.java
java Main
```

Expected output:

```text
2420.0 2600.0
```

## 3. Exercise 1.1 — Test and trace

Code:

```java
Employee e1 = new Employee("Amine", 2000);
Employee e2 = new Employee("Lina", 2500);

e1.raiseSalary(10);
e2.raiseSalary(4);
e1.raiseSalary(10);

System.out.println(
    e1.getBaseSalary() + " " + e2.getBaseSalary()
);
```

### Question 1 — What is printed?

| Command | `e1` salary | `e2` salary |
|---|---:|---:|
| `new Employee("Amine", 2000)` | 2000 | — |
| `new Employee("Lina", 2500)` | 2000 | 2500 |
| `e1.raiseSalary(10)` | 2200 | 2500 |
| `e2.raiseSalary(4)` | 2200 | 2600 |
| `e1.raiseSalary(10)` | 2420 | 2600 |

Output:

```text
2420.0 2600.0
```

Each object has its own instance attributes. Both objects come from the same class, but `e1` and `e2` represent different employees and have independent salary states.

### Question 2 — Invalid salary increase and invalid constructor

```java
e1.raiseSalary(-5);
new Employee("X", -1);
```

- `e1.raiseSalary(-5)` throws `IllegalArgumentException` because the percentage is not positive.
- The salary is **not modified** by this call because the exception is thrown before the update statement.
- `new Employee("X", -1)` throws `IllegalArgumentException` because the starting salary is negative. A valid object is not constructed.
- If the exceptions are not caught, the program terminates at the first exception, so later statements do not execute.

### Question 3 — Direct access to a private attribute

```java
e1.baseSalary = 99999;
```

The compiler reports an error similar to:

```text
baseSalary has private access in Employee
```

This illustrates **encapsulation**. The `baseSalary` attribute is private and cannot be modified directly from `Main`. The class controls access to its state through its public methods.

### Question 4 — Call `raiseSalary(10)` twice

Starting with a salary of 2000:

| Operation | Calculation | Salary |
|---|---|---:|
| Initial salary | — | 2000 |
| First call | `2000 * 1.10` | 2200 |
| Second call | `2200 * 1.10` | 2420 |

Both calls apply a 10% increase, but the second increase is calculated from the already-increased salary.

`raiseSalary()` is **not a pure function** because it changes the object's internal state (`baseSalary`).

OOP is still generally considered an **imperative paradigm** because a program executes statements that perform operations and change state. OOP organizes data and behavior into objects.

## Key concepts to remember

| Concept | Meaning in this exercise |
|---|---|
| Class | Defines the structure and behavior of an `Employee`. |
| Object | A particular employee created from the class. |
| Encapsulation | Protects internal state using `private` attributes and a public interface. |
| Constructor | Initializes an object and validates its initial salary. |
| `final` | Prevents reassignment of `name` after initialization. |
| Getter | Allows controlled reading of an attribute. |
| Exception | Rejects invalid input using `IllegalArgumentException`. |
| Object state | The current values of an object's attributes. |
| Side effect | A change made by a method, such as modifying `baseSalary`. |
| Imperative programming | Uses statements and operations to describe how program state changes. |
