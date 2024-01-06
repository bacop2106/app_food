import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/widgets/text_style.dart';

Widget productDropdown() {
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      hint: normalText(text: "Choose category", color: fontGrey),
      value: null,
      isExpanded: true,
      items: [],
      onChanged: (value) {},
    ),
  )
      .box
      .white
      .padding(const EdgeInsets.symmetric(horizontal: 4))
      .roundedSM
      .make();
}
