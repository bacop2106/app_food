import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/services/store_sirvices.dart';
import 'package:foodappseller/views/widgets/loading_indicator.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../views/widgets/appbar_widget.dart';

class TheoNgayScreen extends StatelessWidget {
  const TheoNgayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxList totalAmount = [].obs;
    RxList emailorder = [].obs;
    RxList dateorder = [].obs;
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
              DateTime dateTime = DateTime.now();
              late var formattedDate;
              return Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await showDatePicker(
                            context: context,
                            initialDate: dateTime,
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2030),
                          ).then((selectedDate) {
                            totalAmount.clear();
                            if (selectedDate != null) {
                              dateTime = selectedDate;
                              formattedDate = intl.DateFormat('M/d/yyyy')
                                  .format(selectedDate);
                              for (var element in data) {
                                if (intl.DateFormat().add_yMd().format(
                                        (element['order-date'].toDate())) ==
                                    formattedDate.toString()) {
                                  print('giá: ${element['total_amount']}');
                                  print('giá: ${element['order_by_email']}');
                                  print('ngay: ${formattedDate.toString()}');
                                  totalAmount.add(element['total_amount']);
                                  emailorder.add(element['order_by_email']);
                                  dateorder.add(element['order-date']);
                                }
                              }
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: double.infinity,
                          color: Colors.red,
                          child: const Text(
                            "Chọn ngày",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      20.heightBox,
                      20.heightBox,
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "Doanh số:".text.size(20).make(),
                            totalAmount.length.toString().text.size(20).make(),
                          ],
                        )
                            .box
                            .padding(const EdgeInsets.all(12))
                            .width(context.screenWidth - 60)
                            .roundedSM
                            .make(),
                      ),
                      "Chi tiết: "
                          .text
                          .size(20)
                          .fontWeight(FontWeight.bold)
                          .make(),
                      20.heightBox,
                      Obx(
                        () => Column(
                          children: List.generate(
                              totalAmount.length,
                              (index) => ListTile(
                                    tileColor: textfieldGrey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    title: boldText(
                                        text: "${emailorder[index]}",
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
                                                text: formattedDate.toString(),
                                                color: fontGrey),
                                          ],
                                        ),
                                      ],
                                    ),
                                    trailing: boldText(
                                        text: "${totalAmount[index]} vnd",
                                        color: purpleColor,
                                        size: 16.0),
                                  )
                                      .box
                                      .margin(const EdgeInsets.only(bottom: 10))
                                      .make()),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
