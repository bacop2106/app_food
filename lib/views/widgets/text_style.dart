import 'package:foodappseller/consts/consts.dart';

Widget normalText({text, color = Colors.white,size = 14.0}){
  return "$text".text.color(color).make();
}

Widget boldText({text, color = Colors.white,size = 16.0}){
  return "$text".text.bold.color(color).size(size).make();
}