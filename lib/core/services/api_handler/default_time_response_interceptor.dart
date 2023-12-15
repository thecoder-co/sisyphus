// ignore_for_file: strict_raw_type
// coverage:ignore-file
import 'package:dio/dio.dart';
import 'talker.dart';

///This Interceptor is used check the response time from the server for each request
class TimeResponseInterceptor extends Interceptor {
  late Stopwatch stopwatch;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    stopwatch = Stopwatch()..start();

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    talker.log(
        '\x1B[34mResponse time 😇 : ${stopwatch.elapsed.inSeconds}\x1B[0m');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    talker.log(
        '\x1B[34mError Response time 😇 : ${stopwatch.elapsed.inSeconds}\x1B[0m');
    super.onError(err, handler);
  }
}