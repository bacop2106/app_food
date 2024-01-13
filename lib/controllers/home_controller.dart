import 'package:foodappseller/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUsername();
  }
  var navIndex = 0.obs;
  var username='';
  
  getUsername()async{
    var n = await firestore.collection(vendorsCollection).where('id').get().then((value){
      if(value.docs.isNotEmpty){
        return value.docs.single['user_name'];
      }
    });
    username = n;
  }
}