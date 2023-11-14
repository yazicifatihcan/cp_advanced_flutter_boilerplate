import 'package:flutter_base_project/app/common/base_view/controller/base_controller.dart';
import 'package:flutter_base_project/app/common/extensions/domain_extension.dart';

class ExampleController extends BaseControllerInterface {


  @override
  Future<void> onReady() async{
    await onReadyGeneric(()async{
      await getAllCharacters();
    });
  }


  Future<void> getAllCharacters()async{
     await appRepository.authRepository.getAllCharacters().getAllData();
  }




}