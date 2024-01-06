import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/orders_screen/components/order_place.dart';
import 'package:foodappseller/views/widgets/our_button.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: darkGrey,
          ),
        ),
        title: boldText(text: "Order Details", color: fontGrey, size: 16.0),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        width: context.screenWidth,
        child: ourButton(color: green, onPress: () {}, title: "Confirm Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Visibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(
                        text: "Orders Status", color: purpleColor, size: 16.0),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Placed", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: true,
                      onChanged: (value) {},
                      title: boldText(text: "Confirm", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "On Delivery", color: fontGrey),
                    ),
                    SwitchListTile(
                      activeColor: green,
                      value: false,
                      onChanged: (value) {},
                      title: boldText(text: "Delivered", color: fontGrey),
                    ),
                  ],
                )
                    .box
                    .padding(const EdgeInsets.all(8))
                    .outerShadowMd
                    .border(color: lightGrey)
                    .white
                    .make(),
              ),
              Column(
                children: [
                  orderPlaceDetails("Order code", "Shipping Method",
                      "data['order_code']", "data['shipping_method']"),
                  orderPlaceDetails(
                      "Order date",
                      "Payment Method",
                      DateTime.now(),
                      // intl.DateFormat()
                      //     .add_yMd()
                      //     .format((data['order-date'].toDate())),
                      "data['payment_method']"),
                  orderPlaceDetails("Payment Status", "Delivery Status",
                      "Unpaid", "Order Place"),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            boldText(
                                text: "Shipping Address", color: purpleColor),
                            "{data['order_by_cuty']}".text.make(),
                            "{data['order_by_state']}".text.make(),
                            "{data['order_by_address']}".text.make(),
                            "{data['order_by_phone']}".text.make(),
                            // "${data['order_by_email']}".text.fontFamily(bold).size(14).make(),
                          ],
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(
                                  text: "Total Account", color: purpleColor),
                              boldText(text: "\$3000", color: red, size: 16.0),
                              // "Total Account"
                              //     .text
                              //     .size(16)
                              //     .fontFamily(bold)
                              //     .make(),
                              // "${data['total_amount']}"
                              //     .text
                              //     .size(16)
                              //     .color(redColor)
                              //     .fontFamily(bold)
                              //     .make()
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ).box.outerShadowMd.border(color: lightGrey).white.make(),
              const Divider(),
              10.heightBox,
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(4, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      orderPlaceDetails(
                          "data['orders'][index]['title']",
                          "data['orders'][index]['tprice']",
                          "{data['orders'][index]['qty']} x",
                          "Total amount"),
                      const Divider(),
                    ],
                  );
                }).toList(),
              ).box.outerShadowMd.white.make(),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
