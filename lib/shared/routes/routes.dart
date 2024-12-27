import 'package:my_balance/page/home/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    HomePage.routeName: (BuildContext context) => const HomePage(),
  };
}