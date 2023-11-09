import 'dart:convert';
import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:iti_23_g2/ecommerce/helper/error_status.dart';

///Header management interceptor
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: add header to each request {
    //  options.headers["Authorization"] = " $value",

    options.headers["Accept"] = "application/json";
    super.onRequest(options, handler);
  }
}

///Log interceptor settings
class LoggingInterceptor extends Interceptor {
  DateTime? startTime;
  DateTime? endTime;

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    startTime = DateTime.now();
    dev.log("----------Request Start---------");
    dev.log(" path :" + options.path);

    // if(options.path.contains(Api.getCountriesListApiCall)){
    //   options.baseUrl=Api.nartaqiBaseUrl;
    // }

    ///print full path request
    if (options.queryParameters.isEmpty) {
      if (options.path.contains(options.baseUrl)) {
        dev.log("RequestUrl:" + options.path);
      } else {
        dev.log("RequestUrl:" + options.baseUrl + options.path);
      }
    } else {
      ///If queryParameters is not empty, splice into a complete URl
      dev.log("RequestUrl:" +
          options.baseUrl +
          options.path +
          "?" +
          Transformer.urlEncodeMap(options.queryParameters));
    }

    dev.log("RequestMethod:" + options.method);
    dev.log("RequestHeaders:" + options.headers.toString());
    dev.log("RequestContentType:" + options.contentType.toString());
    dev.log(
        "RequestDataOptions:${options.data is FormData ? (options.data as FormData).fields.toString() : options.data.toString()}");

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    endTime = DateTime.now();
    //Request duration
    final int duration = endTime!.difference(startTime!).inMilliseconds;
    dev.log("----------End Request $duration millisecond---------");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    dev.log("--------------Error-----------");
    dev.log(err.message ?? "");
    super.onError(err, handler);
  }
}

//parsing data
class AdapterInterceptor extends Interceptor {
  static const String defaultError = "\"NOT_FOUND\"";
  static const String notFoundError = "Something Wrong Happened";

  static const String failureFormat = "{\"code\":%d,\"message\":\"%s\"}";
  static const String successFormat =
      "{\"code\":0,\"data\":%s,\"message\":\"\"}";

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    final Response mResponse = adapterData(response);
    return super.onResponse(mResponse, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      adapterData(err.response!);
    }
    return super.onError(err, handler);
  }

  Response adapterData(Response response) {
    String? result;
    String content = response.data == null ? "" : response.data.toString();
    if (response.statusCode == ErrorStatus.success) {
      if (content.isEmpty) {
        content = defaultError;
      }
      response.statusCode = ErrorStatus.success;
    } else {
      response.statusCode = ErrorStatus.success;
    }
    if (response.statusCode == ErrorStatus.success) {
      dev.log("ResponseCode:${response.statusCode}");
      dev.log("response:${response.data}");
    } else {
      dev.log("ResponseCode:${response.statusCode}");
      dev.log("response:${response.data}");
    }
    dev.log(json.decode(result ?? ""));
    response.data = result;
    return response;
  }
}
