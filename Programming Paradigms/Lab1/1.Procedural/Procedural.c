#include <stdio.h>
#include <stdbool.h>

#define NUM_QUESTIONS 10

// Stores the user's 10 answers.
// This is global state, accessible by any function.
bool answers[NUM_QUESTIONS];

// The 10 questions
const char *questions[NUM_QUESTIONS] = {
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

// Counts the number of true answers in a given range.
int count_true(int start, int end)
{
    int count = 0;

    for (int i = start; i <= end; i++)
    {
        if (answers[i])
        {
            count++;
        }
    }

    return count;
}

// Applies the decision rule.
void determine_personality(void)
{
    int extrovert_score = count_true(0, 4);
    int introvert_score = count_true(5, 9);

    printf("\nExtrovert score: %d\n", extrovert_score);
    printf("Introvert score: %d\n", introvert_score);

    if (extrovert_score > introvert_score)
    {
        printf("Result: Extrovert\n");
    }
    else if (introvert_score > extrovert_score)
    {
        printf("Result: Introvert\n");
    }
    else
    {
        printf("Result: Balanced (Ambivert)\n");
    }
}

int main(void)
{
    char input;

    printf("=== Extrovert / Introvert Quiz ===\n\n");

    for (int i = 0; i < NUM_QUESTIONS; i++)
    {
        printf("%d. %s (T/F): ", i + 1, questions[i]);
        scanf(" %c", &input);

        if (input == 'T' || input == 't')
        {
            answers[i] = true;
        }
        else
        {
            answers[i] = false;
        }
    }

    determine_personality();

    return 0;
}
