class BankAccount {
  String? _accountNumber;
  double? _balance;
  String? _accountType;
  String? _ownerName;
  String? _bankName;

  BankAccount(
    this._accountNumber,
    this._balance,
    this._accountType,
    this._ownerName,
    this._bankName,
  );

  BankAccount.empty();

  String get accountNumber => _accountNumber ?? '';
  double get balance => _balance ?? 0.0;
  String get ownerName => _ownerName ?? '';
  String get bankName => _bankName ?? '';
  String get accountType => _accountType ?? '';

  void set balance(double newBalance) {
    if (newBalance >= 0) {
      _balance = newBalance;
    } else {
      print('Balance cannot be negative.');
    }
  }

  void set accountType(String newType) {
    if (newType.isNotEmpty) {
      _accountType = newType;
    } else {
      print('Account type cannot be empty.');
    }
  }

  void set ownerName(String newName) {
    if (newName.isNotEmpty) {
      _ownerName = newName;
    } else {
      print('Owner name cannot be empty.');
    }
  }

  void set bankName(String newBankName) {
    if (newBankName.isNotEmpty) {
      _bankName = newBankName;
    } else {
      print('Bank name cannot be empty.');
    }
  }

  void set accountNumber(String newAccountNumber) {
    if (newAccountNumber.isNotEmpty) {
      _accountNumber = newAccountNumber;
    } else {
      print('Account number cannot be empty.');
    }
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance = (_balance ?? 0.0) + amount;
      print(
        'Deposited \$${amount.toStringAsFixed(2)}. New balance: \$${(_balance ?? 0.0).toStringAsFixed(2)}',
      );
    } else {
      print('Deposit amount must be positive.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0.0) {
      if (amount <= (_balance ?? 0.0)) {
        _balance = (_balance ?? 0.0) - amount;
        print(
          'Withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${(_balance ?? 0.0).toStringAsFixed(2)}',
        );
      } else {
        print(
          'Insufficient funds. Current balance: \$${(_balance ?? 0.0).toStringAsFixed(2)}',
        );
      }
    } else {
      print('Withdrawal amount must be positive.');
    }
  }

  void displayAccountInfo() {
    print('Account Number: $_accountNumber');
    //print('Balance: \$${(_balance ?? 0.0).toStringAsFixed(2)}');
    print('Balance: \$${balance.toStringAsFixed(2)}');
    print('Account Type: $_accountType');
    print('Owner Name: $_ownerName');
    print('Bank Name: $_bankName');
  }
}
