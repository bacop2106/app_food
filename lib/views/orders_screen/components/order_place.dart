import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/widgets/text_style.dart';

Widget orderPlaceDetails(title1, title2,d1,d2){
  return  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text:"$title1",color: purpleColor ),
            boldText(text: "$d1",color: red)
            // "$title1".text.fontFamily(bold).size(16).make(),
            // "$d1".text.color(redColor).make()
          ],
        ),
        SizedBox(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text:"$title2",color: purpleColor ),
              boldText(text: "$d2",color: fontGrey)
              // "$title2".text.fontFamily(bold).size(16).make(),
              // "$d2".text.make()
            ],
          ),
        )
      ],
    ),
  );
}