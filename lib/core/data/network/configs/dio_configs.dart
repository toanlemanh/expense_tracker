import 'package:dio/dio.dart';
import 'package:expense_tracker/core/data/network/constants/network_constants.dart';

abstract class DioConfigs {
   static final baseOptions = BaseOptions(
    baseUrl: NetworkConstants.baseUrl,
    connectTimeout: Duration(milliseconds:NetworkConstants.connectionTimeout) , // 15 seconds
    receiveTimeout: Duration(milliseconds: NetworkConstants.receiveTimeout), // 30 seconds
    followRedirects: false,
    validateStatus: (status) => status! < 500,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );


}