// summary_model.dart
class SummaryData {
  final int expenses;
  final int income;
  final int openingBalance;
  final String maxExpense;
  final int totalTransactionsThisMonth;

  SummaryData({
    this.expenses = 0,
    this.income = 0,
    this.openingBalance = 0,
    this.maxExpense = "",
    this.totalTransactionsThisMonth = 0,
  });

  factory SummaryData.fromJson(Map<String, dynamic> json) {
    return SummaryData(
      expenses: json['data']['expenses'],
      income: json['data']['income'],
      openingBalance: json['data']['openingBalance'],
      maxExpense: json['data']['maxExpense'],
      totalTransactionsThisMonth: json['data']['totalTransactionsThisMonth'],
    );
  }
}

// account_model.dart
class AccountData {
  final int id;
  final String title;
  final String img;
  final int openingBalance;

  AccountData({
    required this.id,
    required this.title,
    required this.img,
    required this.openingBalance,
  });

  factory AccountData.fromJson(Map<String, dynamic> json) {
    return AccountData(
      id: json['id'],
      title: json['title'],
      img: json['img'],
      openingBalance: json['openingBalance'],
    );
  }
}
