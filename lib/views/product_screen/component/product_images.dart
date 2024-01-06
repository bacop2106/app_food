import 'package:foodappseller/consts/consts.dart';

Widget productImages({required label, onPress}) {
  return "$label"
      .text
      .makeCentered()
      .box
      .color(lightGrey)
      .size(100, 100)
      .roundedSM
      .make();
}
