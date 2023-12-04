import '../../../../module/common/lib/src/base_view/controller/base_controller.dart';
import '../../../../module/common/lib/src/extensions/domain_extension.dart';

class ExampleController extends BaseControllerInterface {
  
  
  @override
  Future<void> onReady() async {
    await onReadyGeneric(() async {
      await getAllCharacters();
    });
  }


  Future<void> getAllCharacters()async{
     await appRepository.authRepository.getAllCharacters().getAllData();
  }


  
}
