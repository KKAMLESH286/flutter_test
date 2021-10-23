import 'package:get/get.dart';


class CartController extends GetxController {
  var _classes = [].obs;


  void addClass(dynamic classes) {   
      _classes.add(classes); 
print(_classes);
}

void deleteClass(dynamic classes) {   
      _classes.remove(classes); 
print(_classes);
}



get subClass => _classes;
}