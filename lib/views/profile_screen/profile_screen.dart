import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/profile_screen/edit_profile_screen.dart';
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
          TextButton(onPressed: () {}, child: normalText(text: logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: Image.asset(imgProduct)
                  .box
                  .roundedFull
                  .clip(Clip.antiAlias)
                  .make(),
              title: boldText(text: "Vendor name"),
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
        ),
      ),
    );
  }
}
