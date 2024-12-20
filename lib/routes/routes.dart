import 'package:get/get.dart';
import 'package:shopping_cart/screens/payment/payment.dart';

class RouteName {
  static const String payment = "/payment";
}

class AppRoute {
  static final List<GetPage> routes = [
    GetPage(
      name: RouteName.payment,
      page: () => const PaymentScreen(),
    )
  ];
}
