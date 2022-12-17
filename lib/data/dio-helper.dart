import 'package:dio/dio.dart';
import 'package:heavytransportship/data/shared-preference.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://transporting-heavyshippment.herokuapp.com/',
        receiveDataWhenStatusError: true,
        headers: {}));
    print('Dio is Created');
  }

  static bool? n;

  static String? s;

  static Future<Response?> postData(
      {required String path,
        required Map<String, dynamic> data,
        Map<String, dynamic>? query}) async {
    await dio?.post(path, data: data, queryParameters: query).then((value) {
      if (value.data['status']) {
        n = true;
        s = value.data['message'];
        CashHelper.saveData(key: 'id', value: value.data['data']['user']['id']);
        CashHelper.saveData(key: 'token', value: value.data['data']['token']);
        print('${CashHelper.getData(key: 'id')}');
        print('${CashHelper.getData(key: 'token')}');
      } else {
        n = false;
        s = 'Email Or Password Is incorrect ';
      }
      print(value.data);
    }).catchError((error) {
      print(error.toString());
    });
  }

  static Future<Response?> getDataInOrder({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    return await dio?.get(path, queryParameters: query).then((value) {
      CashHelper.saveData(key: 'priceOrder', value: value.data['data']);
    });
  }

  static Future<Response?> getDataInTruck({
    required String path,
    required Map<String, dynamic> query,
  }) async {
    return await dio?.get(path, queryParameters: query).then((value) {
      CashHelper.saveData(key: 'priceTruck', value: value.data['data']);
    });
  }

  static Future<Response?> PostDataInOrder(
      {required String path, required Map<String, dynamic> data}) async {
    await dio?.post(path, data: data).then((value) {
      print(value.data);
      print('Success');
    }).catchError((error) {
      print('Failed');
    });
  }

  static Future<Response?> PostDataInTruck({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await dio?.post(path, data: data).then((value) {
      print(value.data);
      print('Success');
    }).catchError((error) {
      print('Failed');
    });
  }

  static Future<Response?> PostDataInPayment({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await dio?.post(path, data: data).then((value) {
      print(value.data);
      print('Success');
    }).catchError((error) {
      print('Failed');
    });
  }
}
