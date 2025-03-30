import 'package:flutter/material.dart';
import 'package:duitan/models/transaction_model.dart';
import 'package:duitan/repository/transaction_repository.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactions = [];
  final TransactionRepository _repository = TransactionRepository();

  List<TransactionModel> get transactions => _transactions;

  /// Fetch semua transaksi dari database
  Future<void> fetchTransactions() async {
    _transactions = await _repository.getTransactions();
    notifyListeners();
  }

  /// Tambah transaksi baru
  Future<void> addTransaction(TransactionModel transaction) async {
    await _repository.insertTransaction(transaction);
    fetchTransactions(); // Perbarui UI
  }

  /// Hapus transaksi berdasarkan ID
  Future<void> deleteTransaction(int id) async {
    await _repository.deleteTransaction(id);
    fetchTransactions(); // Perbarui UI
  }
}
