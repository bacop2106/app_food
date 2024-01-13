import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/controllers/order_controller.dart';
import 'package:foodappseller/views/orders_screen/components/order_place.dart';
import 'package:foodappseller/views/widgets/our_button.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetails extends StatefulWidget {
  final dynamic data;

  const OrderDetails({super.key, this.data});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var controller = Get.find<OrdersController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getOrders(widget.data);
    controller.confirmed.value = widget.data['order_confirmed'];
    controller.ondelivery.value = widget.data['order_on_delivery'];
    controller.delivered.value = widget.data['order_delivery'];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
        bottomNavigationBar: Visibility(
          visible: !controller.confirmed.value,
          child: SizedBox(
            height: 60,
            width: context.screenWidth,
            child: ourButton(
                color: green,
                onPress: () {
                  controller.confirmed(true);
                  controller.changeStatus(
                      title: "order_confirmed",
                      status: true,
                      docID: widget.data.id);
                },
                title: "Confirm Order"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Visibility(
                  visible: controller.confirmed.value,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      boldText(
                          text: "Orders Status",
                          color: purpleColor,
                          size: 16.0),
                      SwitchListTile(
                        activeColor: green,
                        value: true,
                        onChanged: (value) {},
                        title: boldText(text: "Placed", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: controller.confirmed.value,
                        onChanged: (value) {
                          controller.confirmed.value = value;
                        },
                        title: boldText(text: "Confirmed", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: controller.ondelivery.value,
                        onChanged: (value) {
                          controller.ondelivery.value = value;
                          controller.changeStatus(
                              title: "order_on_delivery",
                              status: value,
                              docID: widget.data.id);
                        },
                        title: boldText(text: "On Delivery", color: fontGrey),
                      ),
                      SwitchListTile(
                        activeColor: green,
                        value: controller.delivered.value,
                        onChanged: (value) {
                          controller.delivered.value = value;
                          controller.changeStatus(
                              title: "order_delivery",
                              status: value,
                              docID: widget.data.id);
                        },
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
                    orderPlaceDetails(
                        "Order code",
                        "Shipping Method",
                        "${widget.data['order_code']}",
                        "${widget.data['shipping_method']}"),
                    orderPlaceDetails(
                        "Order date",
                        "Payment Method",
                        intl.DateFormat()
                            .add_yMd()
                            .format((widget.data['order-date'].toDate())),
                        "${widget.data['payment_method']}"),
                    orderPlaceDetails("Payment Status", "Delivery Status",
                        "Unpaid", "Order Place"),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(
                                  text: "Shipping Address", color: purpleColor),
                              "${widget.data['order_by_cuty']}".text.make(),
                              "${widget.data['order_by_state']}".text.make(),
                              "${widget.data['order_by_address']}".text.make(),
                              "${widget.data['order_by_phone']}".text.make(),
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
                                boldText(
                                    text: "${widget.data['total_amount']} vnd",
                                    color: red,
                                    size: 16.0),
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
                  physics:  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(widget.data['orders'].length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetails(
                            "${widget.data['orders'][index]['title']}",
                            "${widget.data['orders'][index]['tprice']}",
                            "${widget.data['orders'][index]['qty']} x",
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
      ),
    );
  }
}
