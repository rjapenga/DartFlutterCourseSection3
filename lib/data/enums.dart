// The old way stinks as a way to identify screens. Need a way that is not typo sensitive.
// If you call it start-screen not caught until run time.
// Using enums works
enum Screens { startKey, questionsKey, resultsKey }

enum Summary { questionIndex, question, userAnswer, correctAnswer }
