import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ProductDetail extends StatelessWidget {
  final dynamic data;

  const ProductDetail({super.key, this.data});

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
        title: boldText(text: "${data['p_name']}", color: fontGrey, size: 16.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                autoPlay: true,
                height: 350,
                itemCount: data['p_imgs'].length,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                itemBuilder: (context, index) {
                  return Image.network(
                    data['p_imgs'][index],
                    width: double.infinity,
                    fit: BoxFit.fill,
                  );
                }),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(
                      text: "${data['p_name']}", color: fontGrey, size: 16.0),
                  // title!.text.size(16).fontFamily(bold).make(),
                  10.heightBox,
                  Row(
                    children: [
                      boldText(
                          text: "${data['p_category']}",
                          color: fontGrey,
                          size: 16.0),
                      10.widthBox,
                      // normalText(
                      //     text: "${data['p_subcategory']}",
                      //     color: fontGrey,
                      //     size: 16.0)
                    ],
                  ),
                  VxRating(
                    // value: double.parse(data['p_rating']),
                    value: 3.0,
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                  ),
                  10.heightBox,
                  boldText(
                      text: "${data['p_price']}vnd", color: red, size: 18.0),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: boldText(text: "Quantity", color: fontGrey),
                          ),
                          normalText(
                              text: "${data['p_quantity']} items",
                              color: fontGrey)
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                    ],
                  ).box.white.padding(const EdgeInsets.all(8)).shadowSm.make(),
                  10.heightBox,
                  boldText(text: "Description", color: fontGrey),
                  10.heightBox,
                  normalText(text: "${data['p_desc']}", color: fontGrey)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
