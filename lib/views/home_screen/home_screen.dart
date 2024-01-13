import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/services/store_sirvices.dart';
import 'package:foodappseller/views/product_screen/product_detail.dart';
import 'package:foodappseller/views/widgets/appbar_widget.dart';
import 'package:foodappseller/views/widgets/dashboard_button.dart';
import 'package:foodappseller/views/widgets/loading_indicator.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(dashboard),
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,
                          title: products, count: data.length.toString(), icon: icProducts),
                      dashboardButton(context,
                          title: orders, count: "15", icon: icOrders),
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,
                          title: rating, count: "80", icon: icStar),
                      dashboardButton(context,
                          title: totalSales, count: "15", icon: icOrders),
                    ],
                  ),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  boldText(text: popular, color: fontGrey, size: 20.0),
                  20.heightBox,
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                        5,
                            (index) =>
                            ListTile(
                              onTap: () {
                                Get.to(() => ProductDetail(data: data[index],));
                              },
                              leading: Image.network(
                                data[index]['p_imgs'][0],
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                              title: boldText(
                                  text: "${data[index]['p_name']}",
                                  color: fontGrey),
                              subtitle:
                              normalText(text: "${data[index]['p_price']} vnd",
                                  color: darkGrey),
                            )),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
