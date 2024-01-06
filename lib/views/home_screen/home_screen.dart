import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/widgets/appbar_widget.dart';
import 'package:foodappseller/views/widgets/dashboard_button.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(dashboard),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,
                    title: products, count: "80", icon: icProducts),
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
                  3,
                  (index) => ListTile(
                        onTap: () {},
                        leading: Image.asset(
                          imgProduct,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        title: boldText(text: "Product title", color: fontGrey),
                        subtitle: normalText(text: "\$40.0", color: darkGrey),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
