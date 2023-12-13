import 'package:flutter_base_project/product/base/controller/base_controller.dart';
import 'package:flutter_base_project/product/service/product_client.dart';

///Controller for Example Screen
class ExampleController extends BaseControllerInterface {
  
  
  @override
  Future<void> onReady() async {
    await onReadyGeneric(() async {
      await _getAllCharacters();
    });
  }


  Future<void> _getAllCharacters()async{
     await ProductClient.instance.authRepository.getAllCharacters();
  }


  
}
