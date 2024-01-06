import 'package:foodappseller/consts/consts.dart';
import 'package:foodappseller/views/widgets/custom_textfield.dart';
import '../widgets/text_style.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: editProfile, size: 16.0),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              imgProduct,
              width: 150,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            20.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: white),
              onPressed: () {},
              child: normalText(text: changeImages, color: fontGrey),
            ),
            10.heightBox,
            const Divider(),
            customTextField(label: name, hint: "eg. Hoang Bac"),
            10.heightBox,
            customTextField(label: password, hint: passwordHint),
            10.heightBox,
            customTextField(label: confirmPass, hint: passwordHint),
          ],
        ),
      ),
    );
  }
}
