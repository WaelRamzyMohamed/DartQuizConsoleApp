// GDSC Dart & Flutter Course
// December 18, 2021
// Wael Ramzy Mohamed
// Quiz Console App

import 'dart:developer';
import 'dart:io';

void main() async {
  // Define the user score when answer the question.
  int score = 0;
  // Create the Quiz's questions using the Question class.
  List<Question> questions = [
    Question(
        answers: ['القاهرة', 'المنوفية', 'بنها', 'الاسكندرية'],
        point: 10,
        question: "ما هى عاصمة مصر؟"),
    Question(
        answers: ['1300', '1700', '1100'],
        point: 30,
        question: "متى ولد الاسكندر الاكبر؟"),
    Question(
        answers: ['2019', '2020', '2018', '2016', '1999'],
        point: 50,
        question: "في أي عام ظهرت جائحة كرونا؟")
  ];
  // Print the Questions on the console.
  for (Question question in questions) {
    // Print the question.
    print(question.question);
    // Print the answers with the numbers.
    for (int i = 0; i < question.answers.length; i++) {
      print("${i + 1} - ${question.answers[i]}");
    }
    // Get user input
    String userAnswer = question.answers[getUserChoise(question.answers.length)];
    print(userAnswer);
    if (userAnswer == question.rightAnswer) {
      score += question.point;
      print(
          "- Right answer, You get ${question.point}. and your score is ${score}.\n");
    } else {
      score -= question.point;
      print(
          "- Wrong answer, You lose ${question.point}. and your score is ${score}.\n");
    }
  }
  print(
      "\n *** Your final score is: ${score} points. ***\n Thanks for playing with us. :)");
}

// Question class.
class Question {
  late int point;
  late String question;
  late List<String> answers;
  late String rightAnswer;
  Question(
      {required this.answers, required this.point, required this.question}) {
    rightAnswer = answers[0];
    answers.shuffle();
  }
}

int getUserChoise(int listLength) {
  String? choise = stdin.readLineSync()!;
  while (choise == "" || int.tryParse(choise!) == null) {
    print("Invalied input, Please enter a valied choise.");
    choise = stdin.readLineSync()!;
  }
  while (int.parse(choise!) <= 0 || int.parse(choise!) > listLength) {
    print("Invalied input, Please enter a valied choise.");
    choise = stdin.readLineSync()!;
  }
  return int.parse(choise!) - 1;
}
