import 'package:my_balance/page/home/components/coin_item_widget.dart';
import 'package:my_balance/page/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:my_balance/shared/models/coin_model.dart';

class ListCardPocketsWidget extends StatelessWidget {
  final List<CoinModel>? listCoins;

  const ListCardPocketsWidget({
    super.key,
    this.listCoins,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 16),
          child: LabelWidget(
            label: 'Pockets',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsetsDirectional.fromSTEB(16, 16, 8, 8),
            itemCount: listCoins!.length,
            itemBuilder: (context, index) {
              return CoinItemWidget(
                list: listCoins![index],
              );
            },
          ),
        ),
      ],
    );
  }
}
