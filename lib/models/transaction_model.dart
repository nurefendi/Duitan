class TransactionModel {
  int? id;
  double amount;
  String category;
  String type;
  String description;
  String transactionDate;

  TransactionModel({
    this.id,
    required this.amount,
    required this.category,
    required this.type,
    required this.description,
    required this.transactionDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'category': category,
      'type': type,
      'description': description,
      'transaction_date': transactionDate,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      amount: map['amount'],
      category: map['category'],
      type: map['type'],
      description: map['description'],
      transactionDate: map['transaction_date'],
    );
  }
}
