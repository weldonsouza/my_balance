import 'package:my_balance/shared/controllers/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider(create: (_) => HomeController()),
];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [];
