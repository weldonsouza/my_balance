import 'package:flutter/material.dart';
import 'package:my_balance/page/widgets/app_bar_widget.dart';
import 'package:my_balance/page/widgets/is_loading_widget.dart';
import 'package:my_balance/utils/constants/constants.dart';

class VisibilityIsLoadingWidget extends StatelessWidget {
  final String titleAppBar;
  final bool visible;
  final Widget widget;
  final List<Widget>? actions;

  const VisibilityIsLoadingWidget({
    super.key,
    required this.titleAppBar,
    this.visible = false,
    required this.widget,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Constants.primaryBackground,
          appBar: appBarWidget(
            context,
            title: titleAppBar,
            elevation: 0,
            actions: actions,
          ),
          body: widget,
        ),
        Visibility(
          visible: visible,
          child: const IsLoadingWidget(),
        ),
      ],
    );
  }
}
