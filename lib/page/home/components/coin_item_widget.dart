import 'package:my_balance/page/widgets/label_widget.dart';
import 'package:my_balance/shared/models/coin_model.dart';
import 'package:flutter/material.dart';
import 'package:my_balance/utils/constants/constants.dart';
import 'package:my_balance/utils/helper/currency_formatter_helper.dart';

class CoinItemWidget extends StatelessWidget {
  final CoinModel? list;

  const CoinItemWidget({
    super.key,
    this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Card(
        color: Constants.cardBackgroundColor,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/icons/${list?.code}.png',
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(width: 8),
                  LabelWidget(
                    label: '${list?.code}',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: 8),
              LabelWidget(
                label: 'Current value: ${CurrencyFormatterHelper.convertFormatFraction(list!.ask!)}',
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
