//singleton dio client
import 'package:dio/dio.dart';
import 'package:expense_tracker/core/data/network/configs/dio_configs.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late final Dio _dio;
  get dio => _dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() {
    _dio = Dio(DioConfigs.baseOptions);
  }
	
	// #add interceptors
	void addInterceptors(Iterable<Interceptor> interceptors){
		_dio.interceptors.addAll(interceptors);
	}
}


