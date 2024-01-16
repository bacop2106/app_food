import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/services/store_sirvices.dart';
import 'package:foodappseller/views/orders_screen/order_detail.dart';
import 'package:foodappseller/views/widgets/loading_indicator.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../views/widgets/appbar_widget.dart';

class TheoNgayScreen extends StatelessWidget {
  const TheoNgayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget("Thống kê theo ngày"),
      body: StreamBuilder(
          stream: StoreServices.getOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
              var data = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: List.generate(
                        data.length,
                        (index) => ListTile(
                              onTap: () {
                                Get.to(() => OrderDetails(data: data[index]));
                              },
                              tileColor: textfieldGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              title: boldText(
                                  text: "${data[index]['order_code']}",
                                  color: fontGrey),
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
                                          text: intl.DateFormat()
                                              .add_yMd()
                                              .format((data[index]['order-date']
                                                  .toDate())),
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
                                  text: "${data[index]['total_amount']} vnd",
                                  color: purpleColor,
                                  size: 16.0),
                            )
                                .box
                                .margin(const EdgeInsets.only(bottom: 5))
                                .make()),
                  ),
                ),
              );
            }
          }),
    );
  }
}
