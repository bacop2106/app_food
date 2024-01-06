import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/product_screen/component/product_dropdown.dart';
import 'package:foodappseller/views/product_screen/component/product_images.dart';
import 'package:foodappseller/views/widgets/custom_textfield.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          TextButton(
              onPressed: () {}, child: boldText(text: save, color: white))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextField(hint: "eg. com", label: "Product name"),
              10.heightBox,
              customTextField(
                  hint: "eg. com", label: "Description", isDesc: true),
              10.heightBox,
              customTextField(hint: "eg. com", label: "Price"),
              10.heightBox,
              customTextField(hint: "eg. com", label: "Price"),
              10.heightBox,
              customTextField(hint: "eg. com", label: "Quantity"),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              productDropdown(),
              10.heightBox,
              const Divider(),
              normalText(text: "Choose product images"),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    3, (index) => productImages(label: "${index + 1}")),
              ),
              5.heightBox,
              normalText(
                  text: "First image will be display image", color: lightGrey),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
