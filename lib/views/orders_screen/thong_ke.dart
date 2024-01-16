import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/controllers/order_controller.dart';
import 'package:foodappseller/thong_ke/theo_ngay.dart';
import 'package:foodappseller/thong_ke/theo_thang.dart';
import 'package:foodappseller/views/orders_screen/order_detail.dart';
import 'package:foodappseller/views/orders_screen/order_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../../services/store_sirvices.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/loading_indicator.dart';

class ThongKeScreen extends StatelessWidget {
  const ThongKeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrdersController());
    return Scaffold(
      appBar: appbarWidget("Thống kê"),
      body: StreamBuilder(
          stream: StoreServices.getOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else {
              var data = snapshot.data!.docs;
              controller.caculate(data);
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Doanh số".text.size(20).make(),
                        data.length.toString().text.size(20).make(),
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.all(12))
                        .width(context.screenWidth - 60)
                        .roundedSM
                        .make(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Doanh thu".text.size(20).make(),
                        "${controller.totalP.value}".numCurrency.text.make(),
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.all(12))
                        .width(context.screenWidth - 60)
                        .roundedSM
                        .make(),
                    Divider(),
                    "THỐNG KÊ CHI TIẾT".text.size(20).make(),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Theo ngày".text.size(20).make(),
                      ],
                    )
                        .box
                        .color(darkGrey)
                        .padding(const EdgeInsets.all(12))
                        .width(context.screenWidth - 60)
                        .roundedSM
                        .make()
                        .onTap(() {
                      Get.to(() => TheoNgayScreen());
                    }),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Theo tháng".text.size(20).make(),
                      ],
                    )
                        .box
                        .color(darkGrey)
                        .padding(const EdgeInsets.all(12))
                        .width(context.screenWidth - 60)
                        .roundedSM
                        .make()
                        .onTap(() {
                      Get.to(() => TheoThangScreen());
                    }),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Theo năm".text.size(20).make(),
                      ],
                    )
                        .box
                        .color(darkGrey)
                        .padding(const EdgeInsets.all(12))
                        .width(context.screenWidth - 60)
                        .roundedSM
                        .make()
                        .onTap(() {}),
                  ]),
                ),
              );
            }
          }),
    );
  }
}
