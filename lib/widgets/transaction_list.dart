import 'package:duitan/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionListScreen extends StatelessWidget {
  const TransactionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Transaksi")),
      body: Consumer<TransactionProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.transactions.length,
            itemBuilder: (context, index) {
              final transaction = provider.transactions[index];
              return ListTile(
                title: Text(transaction.type),
                subtitle: Text(transaction.amount.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    provider.deleteTransaction(transaction.id!);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
