import 'package:data/features/auth/model/token.dart';
import 'package:data/features/auth/request/login_request.dart';
import 'package:data/network/base_api.dart';
import 'package:data/network/base_response.dart';
import 'package:data/network/i_base_api.dart';
import 'package:dio/dio.dart';
import 'package:domain/common/network/exceptions/general_exception.dart';
import 'package:domain/common/network/exceptions/json_parsing_exception.dart';
import 'package:domain/common/refresh_token_exception_handler.dart';
import 'package:domain/common/result.dart';
import 'package:domain/locale_storage/i_user_local.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_service_test.mocks.dart';


@GenerateMocks([IAPIService, Dio, IUserLocal, IRefreshTokenExceptionHandler])
void main() {
  group("api service test", () {
    late MockDio dioMock;
    late MockIUserLocal userLocalMock;
    late BaseApi baseApi;
    late MockIRefreshTokenExceptionHandler refreshTokenExceptionHandler;
    setUp(() {
      refreshTokenExceptionHandler = MockIRefreshTokenExceptionHandler();
      userLocalMock = MockIUserLocal();
      dioMock = MockDio();
      baseApi = BaseApi(dioMock, refreshTokenExceptionHandler);
      when(userLocalMock.getAccessToken).thenAnswer((_) => "accessToken");
      when(userLocalMock.getLocale).thenAnswer((_) => "ar");
    });
    test("fetch data returns valid response", () async {
      when(dioMock.fetch(any)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          statusCode: 500,
          data: {
            "data": {
              "accessToken": "accessToken",
              "refreshToken": "refreshToken",
              "isAdmin": false,
              "status": "status",
            },
          },
        ),
      );
      var result = await baseApi.fetchData<TokenModel>(
        LoginRequest(
          email: "email",
          password: "password",
          fcmToken: "fcmToken",
        ),
        data: TokenModel(),
      );
      expect(result.asSuccess(), isA<BaseResponse<TokenModel?>>());
      expect(result.asSuccess()?.data?.token, "accessToken");
      expect(result.asSuccess()?.data?.refreshToken, "refreshToken");
      expect(result.asSuccess()?.data?.isAdmin, false);
      expect(result.asSuccess()?.data?.status, "status");
    });
    test("test request headers", () async {
      final expectedHeaders = {
        "Authorization": "Bearer ${userLocalMock.getAccessToken}",
        "Accept-Language": userLocalMock.getLocale,
        "Accept": "application/json",
      };

      final requestOptions = RequestOptions(
        path: '/test',
        headers: expectedHeaders,
      );

      when(dioMock.fetch(any)).thenAnswer(
        (_) async => Response(
          requestOptions: requestOptions,
          statusCode: 200,
        ),
      );

      // Act
      await dioMock.fetch(requestOptions);
      verify(dioMock.fetch(argThat(
        predicate<RequestOptions>((request) {
          final headers = request.headers;
          return headers["Authorization"] == expectedHeaders["Authorization"] &&
              headers["Accept-Language"] ==
                  expectedHeaders["Accept-Language"] &&
              headers["Accept"] == expectedHeaders["Accept"];
        }),
      ))).called(1);
    });
    test("test invalid json object", () async {
      when(dioMock.fetch(any)).thenThrow(const FormatException("Invalid JSON"));

      final result = await baseApi.fetchData<TokenModel>(
        LoginRequest(
          email: "email",
          password: "password",
          fcmToken: "fcmToken",
        ),
        data: TokenModel(),
      );
      expect(result.asFailure(), isA<JsonParsingException>());
      expect(result.asFailure(), isA<JsonParsingException>());
    });
    test("type error json property", () async {
      when(dioMock.fetch(any)).thenAnswer((_) async {
        return Response(
          requestOptions: RequestOptions(),
          data: {
            "data": "ayman",
          },
        );
      });
      var result = await baseApi.fetchData<TokenModel>(
        LoginRequest(
          email: "email",
          password: "password",
          fcmToken: "fcmToken",
        ),
        data: TokenModel(),
      );
      expect(result.asFailure(), isA<GeneralException>());
    });
  });
}
