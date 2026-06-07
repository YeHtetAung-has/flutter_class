//import 'dart:math';

void listFunc01() {
  List<dynamic> data = [1, 'developer', 0.3, true];

  data.remove(1);

  data.forEach((element) {
    print(element);
  });
}

void listFunc02() {
  List<int> numbers = [1, 32, 14, 4, 12];
  numbers.forEach((number) {
    print(number);
  });

  numbers.sort((a, b) {
    // return b.compareTo(a);
    return b.bitLength.compareTo(a.bitLength);
  });

  numbers.forEach((number) {
    print(number);
  });

  numbers.add(100);

  numbers.insert(2, 50);

  numbers.forEach((number) {
    print(number);
  });

  numbers.remove(100);

  numbers.forEach((number) {
    print(number);
  });
}
