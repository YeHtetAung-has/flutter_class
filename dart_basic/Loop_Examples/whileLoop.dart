void whileLoop() {
  var loop = 0;
  while (loop < 3) {
    print("DEV");
    loop++;
  }
}

void checkLoggInAttempt(String password) {
  var isLoggedIn = false;
  var attempt = 0;

  while (!isLoggedIn) {
    if (password == "12345") {
      print("Logged In Successfully!");
      isLoggedIn = true;
    } else {
      print("Wrong Password");
      attempt++;
    }

    if (attempt == 3) {
      print("Too many attempts. Try again later.");
      break;
    }
  }
}

void printEvenNumbers() {
  var number = 1;
  while (number <= 5) {
    print(number * 2);
    number++;
  }
}
