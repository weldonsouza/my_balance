import 'package:my_balance/page/home/components/card_title_widget.dart';
import 'package:my_balance/page/home/components/list_card_pockets_wdiget.dart';
import 'package:my_balance/page/widgets/visibility_is_loanding_widget.dart';
import 'package:my_balance/shared/controllers/home_controller.dart';
import 'package:my_balance/utils/constants/constants_routes_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String get routeName => ConstantsRoutesNames.homePage;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).getCoins();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

    return VisibilityIsLoadingWidget(
      titleAppBar: 'My Balance',
      visible: homeController.isLoading,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitleWidget(
            balance: homeController.balance,
          ),
          ListCardPocketsWidget(
            listCoins: homeController.listCoins,
          ),
        ],
      ),
    );
  }
}
