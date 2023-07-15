import 'package:assignment_pepper/domain/entities/home_operations/operation_charge_model.dart';
import 'package:flutter/material.dart';
class ChargeRow extends StatelessWidget {
  const ChargeRow({super.key, required this.operation, required this.onTap});

  final OperationChargeModel operation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final amount =
    operation.amount % 1 == 0 ? operation.amount.toInt() : operation.amount;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${operation.amount}\$", style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),),
          Row(children: [
            Text(operation.operationDescription,),
            IconButton(onPressed: onTap, icon:Icon( Icons.info)),
          ],)
        ],
      ),
    );
  }
}
