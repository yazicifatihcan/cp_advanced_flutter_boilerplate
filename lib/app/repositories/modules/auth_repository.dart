import 'package:flutter_base_project/app/data/response_models/all_characters_response_model.dart';

import '../../../core/http_client/dio_service.dart';
import '../../data/local_models/domain/base_http_model.dart';
import '../../main/values/constants/http_url.dart';
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


