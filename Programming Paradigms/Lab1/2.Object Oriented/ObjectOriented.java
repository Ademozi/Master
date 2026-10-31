import java.util.Scanner;

class PersonalityQuiz {

    // Private state: cannot be accessed directly from outside the class
    private boolean[] answers = new boolean[10];

    // The questions belong to the object
    private String[] questions = {
        "I enjoy going to parties with lots of people.",
        "I find it easy to start conversations with strangers.",
        "I feel comfortable being the center of attention.",
        "I prefer working in a group rather than alone.",
        "I feel more energized after spending time with other people.",
        "I feel more energized after spending time alone.",
        "I prefer listening over talking in group discussions.",
        "I need quiet time to recharge after socializing.",
        "I prefer a quiet night in over a big social event.",
        "I think carefully before speaking in a group."
    };

    // Public method to record one answer
    public void recordAnswer(int questionNumber, boolean answer) {
        answers[questionNumber] = answer;
    }

    // Public method to ask all questions
    public void askQuestions(Scanner scanner) {

        for (int i = 0; i < questions.length; i++) {

            System.out.print(
                (i + 1) + ". " + questions[i] + " (T/F): "
            );

            char input = scanner.next().charAt(0);

            if (input == 'T' || input == 't') {
                recordAnswer(i, true);
            } else {
                recordAnswer(i, false);
            }
        }
    }

    // Counts true answers in a range
    private int countTrue(int start, int end) {

        int count = 0;

        for (int i = start; i <= end; i++) {
            if (answers[i]) {
                count++;
            }
        }

        return count;
    }

    // Public method to decide and display the result
    public void decideResult() {

        int extrovertScore = countTrue(0, 4);
        int introvertScore = countTrue(5, 9);

        System.out.println();
        System.out.println("Extrovert score: " + extrovertScore);
        System.out.println("Introvert score: " + introvertScore);

        if (extrovertScore > introvertScore) {
            System.out.println("Result: Extrovert");
        } else if (introvertScore > extrovertScore) {
            System.out.println("Result: Introvert");
        } else {
            System.out.println("Result: Balanced (Ambivert)");
        }
    }
}

public class ObjectOriented {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);

        // Create a PersonalityQuiz object
        PersonalityQuiz quiz = new PersonalityQuiz();

        // Ask the object to handle the questions
        quiz.askQuestions(scanner);

        // Ask the object to calculate the result
        quiz.decideResult();

        scanner.close();
    }
}
