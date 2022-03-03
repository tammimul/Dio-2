
import 'package:dio/dio.dart';

class network{
  var dio = Dio();
  final baseUrl = 'https://reqres.in/';

  network(){
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
    ));
  }

  Future<Response> getReq(String endPoint)async{
    Response response;

    try{
     response = await dio.get(endPoint);
    } on DioError catch(e){
      throw Exception(e.message);
    }
    return response;
  }



  //interceptors

  initializeInterceptors(){
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError e, handler){
        print(e.message);
        },
      onResponse: (response,handler){
        print(response.data);
      },
        onRequest:(option ,hadnler){
        print('${option.method}${option.path}');

    }

    ));
  }


}




