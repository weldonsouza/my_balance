import 'package:my_balance/page/widgets/label_widget.dart';
import 'package:my_balance/utils/constants/constants.dart';
import 'package:my_balance/utils/helper/currency_formatter_helper.dart';
import 'package:flutter/material.dart';

class CardTitleWidget extends StatelessWidget {
  final double balance;

  const CardTitleWidget({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Card(
        color: Constants.cardBackgroundColor,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelWidget(
                label: 'Balance',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              LabelWidget(
                label: 'R\$ ${CurrencyFormatterHelper.convertFormatFraction(balance)}',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
