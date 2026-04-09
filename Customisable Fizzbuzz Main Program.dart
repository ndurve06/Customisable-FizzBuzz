// dart fizzbuzz.dart

import 'dart:io';

void main() {
  bool playGame = true;
  while (playGame) {
    print("Welcome to FizzBuzz!");
    String mode = gameMode();
    if (mode == "ex") {
      print("Game ended");
      playGame = false;
    } else if (mode == "cl") {
      classicGame();
    } else if (mode == "cu") {
      customSettings();
    }
  }
}

String gameMode() {
  while (true) {
    print(
      "Select classic, 'cl', custom, 'cu' to play FizzBuzz or 'ex' to exit",
    );
    String? mode = (stdin.readLineSync() ?? " ").toLowerCase();
    if (mode == "cl" || mode == "cu" || mode == "ex") {
      return mode;
    } else {
      print("Invalid mode, try again.");
    }
  }
}

int getNum() {
  print("How many numbers (1 to 100): ");
  while (true) {
    try {
      String? numInput = stdin.readLineSync();
      int num = int.parse(numInput!);

      if (num >= 1 && num <= 100) {
        return num;
      } else {
        print("Please enter a number between 1 and 100");
      }
    } catch (e) {
      print("Please enter a number.");
    }
  }
}

int getFactor() {
  while (true) {
    try {
      String? numInput = stdin.readLineSync();
      int num = int.parse(numInput!);

      if (num >= 1) {
        return num;
      } else {
        print("Please enter number greater than 1");
      }
    } catch (e) {
      print("Please enter a number.");
    }
  }
}

int checkFactor(factor1) {
  while (true) {
    print("Second factor");
    int factor2 = getFactor();
    if (factor1 == factor2) {
      print("Numbers can't be the same, enter the second factor");
    } else {
      return factor2;
    }
  }
}

String getWord() {
  print("You will need to select custom strings, for exampe Sun and Flower");
  print("First string:");
  String word = (stdin.readLineSync() ?? " ").toLowerCase();
  return word;
}

String checkWord(String word1) {
  while (true) {
    print("Second string: ");
    String word2 = (stdin.readLineSync() ?? " ").toLowerCase();
    if (word1 == word2) {
      print("Strings can't be the same, enter the only the second string");
    } else {
      return word2;
    }
  }
}

String capitalise(String word) {
  String titleWord = word[0].toUpperCase() + word.substring(1).toLowerCase();
  return titleWord;
}

void classicGame() {
  int counter = getNum();
  for (int i = 1; i <= counter; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print("FizzBuzz");
    } else if (i % 3 == 0) {
      print("Fizz");
    } else if (i % 5 == 0) {
      print("Buzz");
    } else {
      print(i);
    }
  }
}

void customGame(titleWord1, titleWord2, factor1, factor2, counter) {
  for (int i = 1; i <= counter; i++) {
    if (i % factor1 == 0 && i % factor2 == 0) {
      print("$titleWord1$titleWord2");
    } else if (i % factor1 == 0) {
      print(titleWord1);
    } else if (i % factor2 == 0) {
      print(titleWord2);
    } else {
      print(i);
    }
  }
}

void customSettings() {
  String word1 = getWord();
  String word2 = checkWord(word1);
  String titleWord1 = capitalise(word1);
  String titleWord2 = capitalise(word2);
  print("You will need to enter 2 factors like 3 and 5 and can't be repeated");
  print("Enter factor:");
  int factor1 = getFactor();
  int factor2 = checkFactor(factor1);
  int counter = getNum();
  customGame(titleWord1, titleWord2, factor1, factor2, counter);
}
