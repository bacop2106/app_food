import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

AppBar appbarWidget(title){
  return AppBar(
    backgroundColor: white,
    automaticallyImplyLeading: false,
    title: boldText(text: title, color: darkGrey, size: 20.0),
    actions: [
      Center(
        child: normalText(
            text:
            intl.DateFormat('EEE,MMM d, ' 'yy').format(DateTime.now()),
            color: purpleColor),
      ),
      10.widthBox
    ],
  );
}
