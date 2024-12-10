import 'dart:async';

import 'package:data/features/auth/model/refresh_token.dart';
import 'package:data/features/auth/request/refresh_token_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:dio/dio.dart';
import 'package:domain/common/network/exceptions/refresh_token_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class RefreshTokenInterceptor extends Interceptor {
  final Dio dio;
  final IUserLocal userLocal;
  final IAPIService apiService;
  List<Map<dynamic, dynamic>> failedRequests = [];
  bool isRefreshing = false;

  RefreshTokenInterceptor(
    this.dio,
    this.userLocal,
    this.apiService,
  );

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      if (!isRefreshing) {
        isRefreshing = true;
        await refreshToken(err, handler, err.requestOptions.baseUrl);
      } else {
        failedRequests.add({'err': err, 'handler': handler});
      }
    } else {
      return handler.next(err);
    }
  }

  FutureOr refreshToken(
    DioException err,
    ErrorInterceptorHandler handler,
    String baseUrl,
  ) async {
    var targetType = RefreshTokenRequest(
      token: userLocal.getAccessToken,
      refreshToken: userLocal.getRefreshToken,
    );
    var refreshTokenResult = await apiService.fetchData<RefreshTokenModel>(
      targetType,
      data: RefreshTokenModel(),
    );
    var refreshToken = refreshTokenResult.asSuccess();
    String newToken = refreshToken?.data?.token ?? "";
    if (refreshToken?.statusCode == 401) {
      throw RefreshTokenException();
    }
    dio.options.headers.addAll({"Authorization": "Bearer $newToken"});
    userLocal.setAccessToken(refreshToken?.data?.token ?? "");
    userLocal.setRefreshToken(refreshToken?.data?.refreshToken ?? "");
    isRefreshing = false;
    failedRequests.add({'err': err, 'handler': handler});
    retryRequests(newToken, baseUrl);
  }

  Future retryRequests(String token, String baseURI) async {
    Dio retryDio = Dio(
      BaseOptions(
        baseUrl: baseURI,
      ),
    );
    for (var i = 0; i < failedRequests.length; i++) {
      RequestOptions requestOptions =
          failedRequests[i]['err'].requestOptions as RequestOptions;
      requestOptions.headers = {
        'Authorization': 'Bearer $token',
      };
      await retryDio.fetch(requestOptions).then(
            failedRequests[i]['handler'].resolve,
            onError: (error) =>
                failedRequests[i]['handler'].reject(error as DioException),
          );
    }
    isRefreshing = false;
    failedRequests = [];
  }
}
