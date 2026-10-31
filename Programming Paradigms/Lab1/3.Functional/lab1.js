const readline = require("readline");

// The questions
const questions = [
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
];

// Pure function:
// Returns the number of true answers in an array.
const countTrue = (answers) =>
    answers.filter((answer) => answer === true).length;

// Pure function:
// Calculates both scores without changing the answers.
const calculateScores = (answers) => ({
    extrovert: countTrue(answers.slice(0, 5)),
    introvert: countTrue(answers.slice(5, 10))
});

// Pure function:
// Receives scores and returns the result.
const decideResult = ({ extrovert, introvert }) => {
    if (extrovert > introvert) {
        return "Extrovert";
    }

    if (introvert > extrovert) {
        return "Introvert";
    }

    return "Balanced (Ambivert)";
};

// Impure part: keyboard input
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Reads all questions from the user.
const askQuestions = (index, answers) => {
    if (index === questions.length) {
        const scores = calculateScores(answers);
        const result = decideResult(scores);

        console.log();
        console.log(`Extrovert score: ${scores.extrovert}`);
        console.log(`Introvert score: ${scores.introvert}`);
        console.log(`Result: ${result}`);

        rl.close();
        return;
    }

    rl.question(
        `${index + 1}. ${questions[index]} (T/F): `,
        (input) => {
            const answer = input.toUpperCase() === "T";

            // Create a new array instead of modifying answers.
            const newAnswers = [...answers, answer];

            askQuestions(index + 1, newAnswers);
        }
    );
};

// Start with an empty list of answers.
askQuestions(0, []);
