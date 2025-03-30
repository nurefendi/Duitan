class Budget {
  int? id;
  double amount;
  String month;
  String year;

  Budget({
    this.id,
    required this.amount,
    required this.month,
    required this.year,
  });

  // Convert object ke Map untuk disimpan ke database
  Map<String, dynamic> toMap() {
    return {'id': id, 'amount': amount, 'month': month, 'year': year};
  }

  // Convert Map dari database ke object Category
  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      id: map['id'],
      amount: map['amount'],
      month: map['month'],
      year: map['year'],
    );
  }
}
