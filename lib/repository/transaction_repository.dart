import 'package:duitan/db/database_helper.dart';
import 'package:duitan/models/transaction_model.dart';

class TransactionRepository {
  final dbHelper = DatabaseHelper.instance;

  Future<int> insertTransaction(TransactionModel transaction) async {
    final db = await dbHelper.database;
    return await db.insert('transactions', transaction.toMap());
  }

  Future<List<TransactionModel>> getTransactions() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('transactions');
    return maps.map((map) => TransactionModel.fromMap(map)).toList();
  }

  Future<int> deleteTransaction(int id) async {
    final db = await dbHelper.database;
    return await db.delete('transactions', where: 'id = ?', whereArgs: [id]);
  }
}
