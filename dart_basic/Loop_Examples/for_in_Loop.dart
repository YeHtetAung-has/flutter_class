/*
 * For In Loop
 * The for in loop is used to iterate over the elements of a collection, such as a list or a set. It allows you to access each element directly without needing to use an index.
 */

void forinLoop() {
  List<dynamic> testList = ['apple', 12, 'orange', 10];
  testList[0] = 'banana';
  for (dynamic data in testList) {
    print(data);
  }
}

void forinLoopWithSet() {
  Set<String> testSet = {'Flutter', 'Dart', 'Programming'};
  testSet.add('Language');
  // testSet[0] = 'Framework'; // This will cause an error because sets do not support indexing
  for (String data in testSet) {
    print(data);
  }
}
