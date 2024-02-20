import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.removeExpense});
  final void Function(Expense expense) removeExpense;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              background: Container(
                color: Theme.of(context).colorScheme.error,
                margin: EdgeInsets.symmetric(
                    horizontal:
                        Theme.of(context).cardTheme.margin!.horizontal / 2,
                    vertical: Theme.of(context).cardTheme.margin!.vertical / 2),
                child: const Text(
                  'Delete this expense.',
                ),
              ),
              key: ValueKey(expenses[index]),
              onDismissed: (direction) {
                print(Theme.of(context).cardTheme.margin!.horizontal);
                removeExpense(
                  expenses[index],
                );
              },
              child: ExpenseItem(
                expenses[index],
              ),
            ));
  }
}
