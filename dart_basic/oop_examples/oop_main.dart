import 'bankAcc.dart';
import 'student.dart';

void main() {
  var student1 = Student('Alice', 20, 'Computer Science', [
    'CS101',
    'CS102',
    'CS103',
  ]);

  student1.displayInfo();

  // var account01 = BankAccount(
  //   '123456789',
  //   1000.0,
  //   'Savings',
  //   'John Doe',
  //   'Bank of America',
  // );
  // account01.displayAccountInfo();

  var account02 = BankAccount.empty();
  account02.accountNumber = '987654321';
  account02.balance = -2;
  account02.accountType = 'Current';
  account02.ownerName = 'Jane Smith';
  account02.bankName = 'Chase Bank';

  //print(account02.balance);

  account02.displayAccountInfo();

  print('${account02.accountType}');
}
