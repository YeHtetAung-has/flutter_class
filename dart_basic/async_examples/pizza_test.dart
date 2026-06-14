Future<void> pizzaOrder() async {
  print('Pizza order...');

  Future.delayed(Duration(seconds: 2), () {
    print('Pizza Ready');
    print('Enjoy your pizza!');
  });

  print('Drink Coffee.');
}
