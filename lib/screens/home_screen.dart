import 'package:duitan/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:duitan/screens/add_transaction_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TransactionProvider>(
      context,
      listen: false,
    ).fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(height: 100),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Transform.translate(
                          offset: Offset(0, -50),
                          child: Container(
                            width: 300,
                            height: 100,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Sisa saldo",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Divider(
                                  color: Colors.grey[400],
                                  thickness: 1.0,
                                ),
                                Text(
                                  "Rp. 100000",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Consumer<TransactionProvider>(
                            builder: (context, transactionProvider, child) {
                              final transactions =
                                  transactionProvider.transactions;

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
                                          color:
                                              transaction.type == "income"
                                                  ? Colors.green
                                                  : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTransactionScreen()),
          );

          if (result == true) {
            Provider.of<TransactionProvider>(
              context,
              listen: false,
            ).fetchTransactions();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
