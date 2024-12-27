import 'package:flutter/material.dart';
import 'package:my_balance/page/widgets/label_widget.dart';
import 'package:my_balance/utils/constants/constants.dart';

class IsLoadingWidget extends StatelessWidget {
  const IsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Constants.transparent,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Constants.primaryBackground.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),
            LabelWidget(
              label: 'Aguarde...',
              textStyle: TextStyle(
                color: Constants.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
