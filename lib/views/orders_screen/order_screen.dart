import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/orders_screen/order_detail.dart';
import 'package:foodappseller/views/widgets/appbar_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../widgets/text_style.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(orders),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                5,
                (index) => ListTile(
                      onTap: () {
                        Get.to(() => const OrderDetails());
                      },
                      tileColor: textfieldGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      title: boldText(text: "0377750975", color: fontGrey),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: fontGrey,
                              ),
                              10.widthBox,
                              normalText(
                                  text: intl.DateFormat.yMd()
                                      .add_jm()
                                      .format(DateTime.now()),
                                  color: fontGrey),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.payment,
                                color: fontGrey,
                              ),
                              10.heightBox,
                              normalText(text: unpaid, color: red)
                            ],
                          )
                        ],
                      ),
                      trailing: boldText(
                          text: "\$4000", color: purpleColor, size: 18.0),
                    ).box.margin(const EdgeInsets.only(bottom: 5)).make()),
          ),
        ),
      ),
    );
  }
}
