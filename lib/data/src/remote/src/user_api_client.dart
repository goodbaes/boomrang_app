import 'package:dio/dio.dart' hide Headers;
import 'package:boomerang/data/data.dart';
import 'package:boomerang/data/src/remote/src/headers_key.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

part 'user_api_client.g.dart';

@RestApi()
abstract class UserApiClient {
  factory UserApiClient(Dio dio) = _UserApiClient;

  @POST('/user/send_code/')
  Future<void> sendCode(@Body() PhoneDTO dto);

  @POST('/user/login/')
  Future<TokenDTO> login(@Body() LoginDTO dto);

  @POST('/user/refresh/')
  Future<TokenDTO> refreshToken(
    @Body() TokenDTO dto, {
    @DioOptions() Options? options,
  });

  @GET('/user/me/')
  @Headers(HeadersKey.authorizationHeaderMap)
  Future<UserDTO> getUser();

  @PATCH('/user/{id}/')
  @Headers(HeadersKey.authorizationHeaderMap)
  Future<UserUpdateDTO> updateUser(
    @Path() String id,
    @Body() UserUpdateDTO dto,
  );
}
