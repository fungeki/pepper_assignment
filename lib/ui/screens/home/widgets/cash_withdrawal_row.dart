import 'package:assignment_pepper/domain/entities/home_operations/basic_operation_model.dart';
import 'package:assignment_pepper/domain/entities/home_operations/operation_cash_withdrawal_model.dart';
import 'package:flutter/material.dart';

class CashWithdrawalRow extends StatelessWidget {
  const CashWithdrawalRow({super.key, required this.operation, required this.onTap});

  final OperationCashWithdrawalModel operation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final amount =
        operation.amount % 1 == 0 ? operation.amount.toInt() : operation.amount;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${amount}\$",
              style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(operation.source),
                Text(operation.address),
              ],
            )
          ],
        ),
      ),
    );
  }
}
