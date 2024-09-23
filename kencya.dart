class Transaction {
  double amount;
  String category;
  String type;

  Transaction(this.amount, this.category, this.type);
}

class BudgetManager {
  List<Transaction> transactions = [];


  void addTransaction(double amount, String category, String type) {
    transactions.add(Transaction(amount, category, type));
    print("Added $type of \$$amount to $category.");
  }


  double calculateTotal(String type) {
    double total = 0;
    for (var transaction in transactions) {
      if (transaction.type == type) {
        total += transaction.amount;
      }
    }
    return total;
  }


  void getSummary() {
    double totalIncome = calculateTotal('income');
    double totalExpenses = calculateTotal('expense');
    double balance = totalIncome - totalExpenses;

    print("\n--- Budget Summary ---");
    print("Total Income: \$$totalIncome");
    print("Total Expenses: \$$totalExpenses");
    print("Current Balance: \$$balance");
  }
}

void main() {
  BudgetManager manager = BudgetManager();


  manager.addTransaction(5000, 'Salary', 'income');
  manager.addTransaction(200, 'Groceries', 'expense');
  manager.addTransaction(100, 'Transport', 'expense');
  manager.addTransaction(1500, 'Freelance', 'income');
  manager.addTransaction(50, 'Entertainment', 'expense');


  manager.getSummary();
}