import 'package:dio/dio.dart';
import 'package:gallery/app/di/init_di.dart';
import 'package:gallery/app/domain/app_api.dart';
import 'package:gallery/feature/auth/state/auth_cubit.dart';

class AuthInterceptor extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = locator.get<AuthCubit>().state.whenOrNull(
          authorized: (tokens) => tokens.accessToken,
        );
    if (accessToken == null) {
      super.onRequest(options, handler);
    } else {
      final headers = options.headers;
      headers['Authorization'] = 'Bearer $accessToken';
      super.onRequest(options.copyWith(headers: headers), handler);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        await locator.get<AuthCubit>().refreshToken();
        final response = await locator.get<AppApi>().fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (_) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
}
