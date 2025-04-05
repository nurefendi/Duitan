import 'package:duitan/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TransactionProvider>(
        builder: (context, transactionProvider, child) {
          final transactions = transactionProvider.transactions;

          if (transactions.isEmpty) {
            return Center(
              child: Text("Belum ada transaksi."),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 5),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return Card(
                child: ListTile(
                  title: Text(transaction.category),
                  subtitle: Text(transaction.description),
                  trailing: Text(
                    "${transaction.type == "income" ? "+" : "-"} Rp ${transaction.amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: transaction.type == "income"
                          ? Colors.green
                          : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () => showModalBottomSheet(context: context, builder: (context) => build(context),),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
