class BankAccount {
    String _accountNumber;
    double _balance;
    String _ownerName;
    String _accountType;
    String _currency;
    bool _isActive;

    BankAccount(this._accountNumber, this._balance, this._ownerName, this._accountType, this._currency, this._isActive);

    double get balance => _balance;
    double withdraw (double amount) {
        if (amount <= 0) {
            throw Exception('Amount must be greater than zero!');
        }
        if ( amount > _balance) {
            throw Exception('You do not have enough balance ');
        } else if ( amount <= _balance) {
            _balance -= amount;
        }
        return _balance;
    }

    double credit (double amount) {
        if (amount <= 0) {
            throw Exception('Amount must be greater than zero!');
        }
        _balance += amount;
        return _balance;
    }
    
}

class Bank {
    String _name;
    List<BankAccount> _accounts;

    Bank(this._name) : _accounts = [];

    BankAccount createAccount(int accountId, String accountOwner) {
        if (_accounts.any((account) => account._accountNumber == accountId)) {
            throw Exception('Account with ID $accountId already exists!');
        }
        BankAccount newAccount = BankAccount(
            accountId.toString(),
            0.0,
            accountOwner,
            'Regular',
            'USD',
            true
        );
        _accounts.add(newAccount);
        return newAccount;
    }

}
 
void main() {

  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print('Initial balance: \$${ronanAccount.balance}');

  ronanAccount.credit(100);
  print('After credit: \$${ronanAccount.balance}');

  ronanAccount.withdraw(50);
  print('After withdrawal: \$${ronanAccount.balance}');

  try {
    ronanAccount.withdraw(75);
  } catch (e) {
    print(e);
  }

  try {
    myBank.createAccount(100, 'Hongly');
  } catch (e) {
    print(e);
  }
}
