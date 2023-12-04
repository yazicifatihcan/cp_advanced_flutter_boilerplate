import '../../../../module/models/lib/src/response_models/all_characters_response_model.dart';

import '../../../../module/core/lib/src/http_client/dio_service.dart';
import '../../../../module/models/lib/src/local_models/domain/base_http_model.dart';
import '../../../../module/resources/lib/src/constants/http_url.dart';
import '../base_repository.dart';

class AuthRepository extends BaseRepository {
  AuthRepository({required super.dio});



  Future<BaseHttpModel<AllCharactersResponseModel?>> getAllCharacters() async {
    return await baseRequest<AllCharactersResponseModel>(
      responseModel: AllCharactersResponseModel(),
      httpUrl: HttpUrl.getAllCharacters,
      method: DioHttpMethod.GET,
    );
  }





}


