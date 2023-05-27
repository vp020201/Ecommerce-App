import 'package:ecommerce_app/consts/consts.dart';

Widget applogoWidget() {
  return Image.asset(icAppLogo)
      .box
      .white
      .size(100, 100)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
