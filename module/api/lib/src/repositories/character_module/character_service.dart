import 'package:api/src/index.dart';
import 'package:api/src/repositories/character_module/endpoint/characters_path.dart';



class AuthRepository extends BaseClient {
  final DioClient dioClient;

  AuthRepository({
    required this.dioClient,
  }) : super(dio: dioClient);

  Future<BaseHttpModel<AllCharactersResponseModel?>> getAllCharacters() async {
    return await baseRequest<AllCharactersResponseModel>(
      responseModel: AllCharactersResponseModel(),
      httpUrl: CharacterServicePath.characters.value,
      method: DioHttpMethod.GET,
    );
  }
}


