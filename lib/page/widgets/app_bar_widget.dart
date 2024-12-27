import 'package:flutter/material.dart';
import 'package:my_balance/utils/constants/constants.dart';

import 'label_widget.dart';

AppBar appBarWidget(
  context, {
  required String title,
  double? elevation,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Constants.primaryBackground,
    elevation: elevation,
    title: LabelWidget(
      label: title,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    actions: actions,
  );
}
