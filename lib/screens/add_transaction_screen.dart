import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/transaction_model.dart';
import 'package:duitan/providers/transaction_provider.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'Makan & Minum';
  String _selectedType = 'expense';

  Future<void> _saveTransaction() async {
    final transaction = TransactionModel(
      amount: double.parse(_amountController.text),
      category: _selectedCategory,
      type: _selectedType,
      description: _descriptionController.text,
      transactionDate: DateTime.now().toIso8601String(),
    );
    
    await Provider.of<TransactionProvider>(context, listen: false)
        .addTransaction(transaction);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Transaksi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Jumlah'),
            ),
            DropdownButton<String>(
              value: _selectedCategory,
              items: ['Makan & Minum', 'Transportasi', 'Gaji', 'Bonus']
                  .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                  .toList(),
              onChanged: (value) => setState(() => _selectedCategory = value!),
            ),
            DropdownButton<String>(
              value: _selectedType,
              items: ['income', 'expense']
                  .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (value) => setState(() => _selectedType = value!),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveTransaction,
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
