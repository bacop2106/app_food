import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/product_screen/add_product.dart';
import 'package:foodappseller/views/product_screen/product_detail.dart';
import 'package:foodappseller/views/widgets/appbar_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import '../widgets/text_style.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          Get.to(const AddProduct());
        },
        child: const Icon(Icons.add),
      ),
      appBar: appbarWidget(products),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
                20,
                (index) => Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(const ProductDetail());
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
                            normalText(text: "\$40.0", color: darkGrey),
                            10.widthBox,
                            boldText(text: "Featured", color: green)
                          ],
                        ),
                        trailing: VxPopupMenu(
                          menuBuilder: () => Column(
                            children: List.generate(
                              popupMenuTtles.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Icon(popupMenuIconsList[index]),
                                    5.widthBox,
                                    normalText(
                                        text: popupMenuTtles[index],
                                        color: darkGrey)
                                  ],
                                ).onTap(() {}),
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
      ),
    );
  }
}
