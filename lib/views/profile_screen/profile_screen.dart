import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/controllers/auth_controller.dart';
import 'package:foodappseller/services/store_sirvices.dart';
import 'package:foodappseller/views/auth_screen/login_screen.dart';
import 'package:foodappseller/views/profile_screen/edit_profile_screen.dart';
import 'package:foodappseller/views/widgets/loading_indicator.dart';
import 'package:foodappseller/views/widgets/text_style.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const EditProfileScreen());
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              )),
          TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutMethod(context);
                Get.offAll(() => const LoginScreen());
              },
              child: normalText(text: logout))
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.getProfile(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator();
          } else {
            // var data = snapshot.data!.docs[0];
            return Column(
              children: [
                ListTile(
                  leading: Image.asset(imgProduct)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  title: boldText(text: "Hoang Bac"),
                  subtitle: normalText(text: "admin@gmail.com"),
                ),
                const Divider(),
                10.heightBox,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(
                        profilesButtonIcons.length,
                        (index) => ListTile(
                              leading: Icon(
                                profilesButtonIcons[index],
                                color: white,
                              ),
                              title: normalText(text: profilesButton[index]),
                            )),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
