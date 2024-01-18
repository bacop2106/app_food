import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/controllers/products_controller.dart';
import 'package:foodappseller/views/product_screen/component/product_dropdown.dart';
import 'package:foodappseller/views/product_screen/component/product_images.dart';
import 'package:foodappseller/views/widgets/custom_textfield.dart';
import 'package:foodappseller/views/widgets/loading_indicator.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductsController>();
    return Obx(
      () => Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
          ),
          title: boldText(text: "Add Product", color: white, size: 16.0),
          actions: [
            controller.isloading.value
                ? loadingIndicator()
                : TextButton(
                    onPressed: () async {
                      controller.isloading(true);
                      await controller.uploadImages();
                      await controller.uploadProduct(context);
                      Get.back();
                    },
                    child: boldText(text: save, color: white))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextField(
                  hint: "eg. com",
                  label: "Product name",
                  controller: controller.pnameController,
                  onChange: (value) => controller.pnameController.text = value,
                ),
                10.heightBox,
                customTextField(
                  hint: "eg. com",
                  label: "Description",
                  isDesc: true,
                  controller: controller.pdescController,
                  onChange: (value) => controller.pdescController.text = value,
                ),
                10.heightBox,
                customTextField(
                  hint: "eg. com",
                  label: "Price",
                  controller: controller.ppriceController,
                  onChange: (value) => controller.ppriceController.text = value,
                ),
                10.heightBox,
                customTextField(
                  hint: "eg. com",
                  label: "Quantity",
                  controller: controller.pquantityController,
                  onChange: (value) =>
                      controller.pquantityController.text = value,
                ),
                10.heightBox,
                productDropdown("Category", controller.categoryList,
                    controller.categoryvalue, controller),
                10.heightBox,
                const Divider(),
                normalText(text: "Choose product images"),
                10.heightBox,
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                        3,
                        (index) => controller.pImagesList[index] != null
                            ? Image.file(
                                controller.pImagesList[index],
                                width: 100,
                              ).onTap(() {
                                controller.pickImage(index, context);
                              })
                            : productImages(label: "${index + 1}").onTap(() {
                                controller.pickImage(index, context);
                              })),
                  ),
                ),
                5.heightBox,
                normalText(
                    text: "First image will be display image",
                    color: lightGrey),
                10.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
