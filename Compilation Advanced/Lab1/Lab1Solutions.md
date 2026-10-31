# Compiler Design Exercises — Solutions

## Exercise 01: Choose the Right Answer

### 1. What is the main function of a compiler?

**Correct answer: (b) Translate source code into machine code.**

A compiler translates a program written in a high-level programming language into a lower-level representation, often machine code or an intermediate representation.

### 2. Which of the following is NOT a phase of compilation?

**Correct answer: (c) Machine execution.**

Compilation commonly includes lexical analysis, syntax analysis, semantic analysis, code optimization, and code generation. Machine execution happens when the compiled program runs.

### 3. Which phase of the compiler converts high-level code into tokens?

**Correct answer: (b) Lexical analysis.**

The lexical analyzer (lexer or scanner) reads source code and groups characters into tokens.

Example:

```c
int age = 20;
```

Tokens:
- `int` — keyword
- `age` — identifier
- `=` — operator
- `20` — numeric literal
- `;` — separator

### 4. Which of these best describes an interpreter?

**Correct answer: (c) Translates and executes code line by line.**

An interpreter executes a program by processing it at runtime. Not all interpreters work strictly line by line; some use intermediate representations or bytecode.

### 5. Which component checks for syntactic errors in a program?

**Correct answer: (c) Syntax analyzer (parser).**

The syntax analyzer checks whether the sequence of tokens follows the grammatical rules of the programming language.

Example of invalid syntax:

```c
int = age 20;
```

### 6. What is the difference between a compiler and an interpreter?

**Correct answer: (a) A compiler translates code all at once, while an interpreter does it line by line.**

This is the expected answer in a basic compiler course. More precisely, a compiler typically translates a program into another representation before execution, while an interpreter processes the program at runtime. The distinction is not always simply “all at once” versus “line by line.”

### 7. Which of the following is an example of an interpreted language?

**Correct answer: (c) Python.**

Python is commonly classified as an interpreted language. In the standard CPython implementation, source code is first compiled into bytecode, which is then executed by the Python virtual machine.

### 8. Which of the following is NOT a role of the semantic analysis phase?

**Correct answer: (c) Generating machine code.**

Semantic analysis checks whether the program makes sense according to the language's rules. It can include:
- Checking type consistency.
- Ensuring variables are declared and accessible before use.
- Checking function argument and parameter compatibility.

Generating machine code belongs to the code-generation phase.

### Exercise 01 — Answer Key

| Question | Correct answer |
|---|---|
| 1 | **(b)** Translate source code into machine code |
| 2 | **(c)** Machine execution |
| 3 | **(b)** Lexical analysis |
| 4 | **(c)** Translates and executes code line by line |
| 5 | **(c)** Syntax analyzer (parser) |
| 6 | **(a)** Compiler translates before execution; interpreter processes code at runtime |
| 7 | **(c)** Python |
| 8 | **(c)** Generating machine code |

### Compilation phases to remember

**Lexical Analysis → Syntax Analysis → Semantic Analysis → Code Optimization → Code Generation**

- **Lexical analysis:** What are the tokens?
- **Syntax analysis:** Is the structure grammatically correct?
- **Semantic analysis:** Does the program make sense according to the language's rules?
- **Code optimization:** Can the code be improved without changing its behavior?
- **Code generation:** How do we translate the program into the target representation?

---

## Additional Questions: Intermediate Representation and Compiler Front End

### 1. What is an intermediate representation (IR) in a compiler?

**Correct answer: (b) A representation between source code and machine code.**

An Intermediate Representation (IR) is an internal form of a program used by a compiler between the source code and the final target code.

A simplified compilation process is:

```text
Source Code
    ↓
Lexical Analysis
    ↓
Syntax Analysis
    ↓
Semantic Analysis
    ↓
Intermediate Representation (IR)
    ↓
Code Optimization
    ↓
Machine Code Generation
```

For example, the C statement:

```c
x = a + b * c;
```

Could be represented as three-address code:

```text
t1 = b * c
t2 = a + t1
x = t2
```

IR helps the compiler optimize the program and generate code for different target processors.

**Remember:** IR is an intermediate form, not the original source code or the final machine code.

### 2. Which of the following is NOT a front-end phase of a compiler?

**Correct answer: (c) Code optimization.**

| Compiler part | Main responsibility | Examples |
|---|---|---|
| **Front end** | Analyzes source code and checks its correctness | Lexical, syntax, and semantic analysis |
| **Middle end** | Optimizes the intermediate representation | Code optimization |
| **Back end** | Generates code for the target machine | Machine-code generation |

In the standard introductory classification, code optimization belongs to the **middle end**. Some optimizations can also occur in the front end or back end.

---

## Exercise 02: Classify Each Error

For each code example, determine whether the error is lexical, syntactic, or semantic.

### Code A

```c
int main() {
    char *str = "Hello;
    printf("%s", str);
    return 0;
}
```

**Answer: Lexical error — unterminated string literal.**

The string begins with a double quotation mark but has no closing quotation mark:

```c
char *str = "Hello;
```

The lexer cannot recognize a complete string literal.

**Correction:**

```c
char *str = "Hello";
printf("%s", str);
```

**Note:** In the usual introductory classification, an unterminated string literal is considered lexical because the lexer cannot recognize a complete string token. Some compilers may report it as a syntax error instead.

### Code B

```c
int main() {
    int x;
    printf("%d", x);
    return 0;
}
```

**Expected answer: Semantic error — use of an uninitialized variable.**

The local variable `x` is declared but not initialized before being read:

```c
int x;
printf("%d", x);
```

For an ordinary local variable, its value is indeterminate until initialized. Reading it in this way causes undefined behavior.

**Correction:**

```c
int main() {
    int x = 10;
    printf("%d", x);
    return 0;
}
```

Compilers commonly warn about this problem rather than treating it as a mandatory compilation error.

### Code C

```c
int main() {
    int num = "Text";
    printf("%d", num);
    return 0;
}
```

**Answer: Semantic error — incompatible types.**

The variable `num` is an integer, but `"Text"` is a string literal (an array of characters in C). These are incompatible for this initialization.

**Correction 1: Store an integer**

```c
int num = 10;
printf("%d", num);
```

**Correction 2: Store a string**

```c
char *num = "Text";
printf("%s", num);
```

The code is grammatically structured, but the types are incompatible.

### Code D

```c
int main() {
    int x = 10;
    float y = x / 0;
    printf("Result: %f", y);
    return 0;
}
```

**Expected answer: Semantic error — division by zero.**

Both `x` and `0` are integers, so `x / 0` attempts integer division by zero. This causes undefined behavior in C. Declaring `y` as `float` does not make the division floating-point because the operands are both integers.

**Correction:**

```c
int main() {
    int x = 10;
    float y = (float)x / 2;
    printf("Result: %f", y);
    return 0;
}
```

Output:

```text
Result: 5.000000
```

A compiler may issue a warning or diagnostic when it detects a constant zero divisor.

### Code E

```c
int x = 10.5;

if (x == ) {}

printf("%d", y);
```

**Answer: Syntactic and semantic errors.**

There are two main problems.

#### Error 1: Syntactic error

```c
if (x == ) {}
```

The equality operator `==` requires an expression on both sides. The expression after `==` is missing.

**Correction:**

```c
if (x == 10) {}
```

#### Error 2: Semantic error

```c
printf("%d", y);
```

The variable `y` has not been declared in the provided code.

**Correction:**

```c
int y = 5;
printf("%d", y);
```

#### Is `int x = 10.5;` an error?

```c
int x = 10.5;
```

This is syntactically valid C. The floating-point value is converted to an integer, resulting in `10`. A compiler may warn about the conversion, but it is not inherently an error.

### Code G

```c
int main() {
    int x = 10
    printf("%d", x);
    return 0;
}
```

**Answer: Syntactic error — missing semicolon.**

In C, the declaration must end with a semicolon:

```c
int x = 10;
```

Without it, the declaration does not follow C's grammar.

**Correction:**

```c
int main() {
    int x = 10;
    printf("%d", x);
    return 0;
}
```

Output:

```text
10
```

### Exercise 02 — Answer Summary

| Code | Error type | Reason |
|---|---|---|
| **A** | Lexical (expected classification) | String literal is not terminated |
| **B** | Semantic (expected classification) | An uninitialized local variable is read |
| **C** | Semantic | An incompatible string literal is assigned to an integer |
| **D** | Semantic (expected classification) | Integer division by zero |
| **E** | Syntactic and semantic | Missing expression after `==`; `y` is undeclared |
| **G** | Syntactic | Missing semicolon after `int x = 10` |

**Note on classification:** These are the expected introductory classifications. In real C compilers, some issues may be reported as warnings, constraint violations, or syntax diagnostics depending on the issue and implementation. In particular, use of an uninitialized variable and division by zero are not necessarily diagnosed as compilation errors.

---

## How to Distinguish the Three Error Types

When solving a question, check the code in this order.

### 1. Lexical analysis — Are the tokens valid?

Look for:
- Invalid characters in the language.
- Unterminated string literals.
- Text that cannot be recognized as a valid token.

**Example:**

```c
char *str = "Hello;
```

The string literal is not terminated.

### 2. Syntax analysis — Is the structure correct?

Look for:
- Missing semicolons.
- Missing expressions.
- Unbalanced parentheses or braces.
- Statements that do not follow the grammar.

**Examples:**

```c
int x = 10
```

Missing semicolon.

```c
if (x == ) {}
```

Missing expression after `==`.

### 3. Semantic analysis — Does the code make sense according to the language rules?

Look for:
- Undeclared variables.
- Incompatible types.
- Invalid use of variables.
- Operations that are invalid or have undefined behavior.

**Examples:**

```c
int num = "Text";
```

Incompatible types.

```c
printf("%d", y);
```

If `y` has not been declared, this is an undeclared-identifier error.

### Quick memory aid

- **Lexical:** Is each token valid?
- **Syntactic:** Is the code's structure correct?
- **Semantic:** Are the code's meaning and language rules valid?
