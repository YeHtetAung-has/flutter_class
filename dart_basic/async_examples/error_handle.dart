void errorHandleExample(int num1, int num2) {
  try {
    var result = num1 ~/ num2; // Integer division
    print('Result: $result');
  } catch (e, stackTrace) {
    print('Error: $e');
    print('Stack Trace: $stackTrace');
  } finally {
    print('This block will always execute.');
  }
}
