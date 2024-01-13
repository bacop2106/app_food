import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/controllers/products_controller.dart';
import 'package:foodappseller/services/store_sirvices.dart';
import 'package:foodappseller/views/product_screen/add_product.dart';
import 'package:foodappseller/views/product_screen/product_detail.dart';
import 'package:foodappseller/views/widgets/appbar_widget.dart';
import 'package:foodappseller/views/widgets/loading_indicator.dart';
import 'package:get/get.dart';
import '../widgets/text_style.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductsController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () async {
          await controller.getCategory();
          controller.populateCaategoryList();
          Get.to(const AddProduct());
        },
        child: const Icon(Icons.add),
      ),
      appBar: appbarWidget(products),
      body: StreamBuilder(
        stream: StoreServices.getProducts(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      (index) => Card(
                            child: ListTile(
                              onTap: () {
                                Get.to(ProductDetail(data: data[index]));
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
                              subtitle: Row(
                                children: [
                                  normalText(
                                      text: "${data[index]['p_price']} vnd",
                                      color: darkGrey),
                                ],
                              ),
                              trailing: VxPopupMenu(
                                menuBuilder: () => Column(
                                  children: List.generate(
                                    popupMenuTtles.length,
                                    (i) => Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Icon(popupMenuIconsList[i]),
                                          5.widthBox,
                                          normalText(
                                              text: popupMenuTtles[i],
                                              color: darkGrey)
                                        ],
                                      ).onTap(() {
                                        switch (i){
                                          case 0:
                                            break;
                                          case 1:
                                            break;
                                          case 2:
                                            controller.removeProduct(data[index].id);
                                            VxToast.show(context, msg: "Product remote");
                                            break;
                                          default:
                                        }
                                      }),
                                    ),
                                  ),
                                ).box.white.roundedSM.width(200).make(),
                                clickType: VxClickType.singleClick,
                                child: const Icon(Icons.more_vert_rounded),
                              ),
                            ),
                          )),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildProductItem(dynamic data) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.to(ProductDetail(data: data));
        },
        leading: Image.asset(
          imgProduct,
          width: 100,
          height: 100,
          fit: BoxFit.fill,
        ),
        title: boldText(text: "Product title", color: fontGrey),
        subtitle: Row(
          children: [
            normalText(text: "", color: darkGrey),
            10.widthBox,
            boldText(text: "Featured", color: green)
          ],
        ),
        trailing: _buildPopupMenu(),
      ),
    );
  }

  Widget _buildPopupMenu() {
    return VxPopupMenu(
      menuBuilder: () => Column(
        children: List.generate(
          popupMenuTtles.length,
          (index) => Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(popupMenuIconsList[index]),
                5.widthBox,
                normalText(text: popupMenuTtles[index], color: darkGrey)
              ],
            ).onTap(() {}),
          ),
        ),
      ).box.white.roundedSM.width(200).make(),
      clickType: VxClickType.singleClick,
      child: const Icon(Icons.more_vert_rounded),
    );
  }
}
