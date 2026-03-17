import 'dart:convert';
import 'package:crafty_bay/feature/screen/controller/AuthController/authController.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final String? errorSms;
  final Map<String, dynamic>? responsesData;
  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
     this.errorSms,
     this.responsesData,
  });
}
class NetworkCaller{
  var logger = Logger();
  AuthController authController =Get.find();
  //get request
   Future<NetworkResponse> getRequest({required String url, Map<String,dynamic>?header})async{
    try{

      Map<String,String> header ={"token":authController.token ?? ""};
      Uri uri = Uri.parse(url);
      _logRequest(url,header: header);
      Response response =await get(uri,headers: header);
      _logResponses(url, response);
      if(response.statusCode >= 200 && response.statusCode < 300){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: true,responsesData: jsonDecode(response.body));
      }else if(response.statusCode == 401){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: false,errorSms: "Unauthorize user");
      }
      else{
        return NetworkResponse(statusCode: response.statusCode, isSuccess:false,errorSms: "Something wrong");
      }
    }catch(e){
      return NetworkResponse(statusCode: -1, isSuccess: false,errorSms: e.toString());
    }
  }
//post request
   Future<NetworkResponse> postRequest({required String url, Map<String,dynamic>?items})async{
    try{
      Map<String,String> header ={
        "Content-Type": "application/json",
      };
      Uri uri = Uri.parse(url);
      _logRequest(url,header:header);
      Response response =await post(uri,headers:header,body:jsonEncode(items));
      _logResponses(url, response);
      if(response.statusCode >= 200 && response.statusCode < 300){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: true,responsesData: response.body.isNotEmpty ? jsonDecode(response.body):null);
      }else if(response.statusCode == 401){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: false,errorSms: "Unauthorize user");
      }
      else{
        return NetworkResponse(statusCode: response.statusCode, isSuccess:false,errorSms: "error ${response.statusCode}");
      }
    }catch(e){
      return NetworkResponse(statusCode: -1, isSuccess: false,errorSms: e.toString());
    }
  }
  //patch request
   Future<NetworkResponse> patchRequest({required String url, Map<String,dynamic>?items})async{
    try{
      Map<String,String> header ={
        "Content-Type": "application/json",
      };
      Uri uri = Uri.parse(url);
      _logRequest(url,header:header);
      Response response =await patch(uri,headers: header,body: jsonEncode(items));
      _logResponses(url, response);
      if(response.statusCode >= 200 && response.statusCode < 300){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: true,responsesData: response.body.isNotEmpty ? jsonDecode(response.body):null);
      }else if(response.statusCode == 401){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: false,errorSms: "Unauthorize user");
      }
      else{
        return NetworkResponse(statusCode: response.statusCode, isSuccess:false,errorSms: "error ${response.statusCode}");
      }
    }catch(e){
      return NetworkResponse(statusCode: -1, isSuccess: false,errorSms: e.toString());
    }
  }
  //put request
   Future<NetworkResponse> putRequest({required String url, Map<String,dynamic>?items})async{
    try{
      Map<String,String> header ={
        "Content-Type": "application/json",
      };
      Uri uri = Uri.parse(url);
      _logRequest(url,header:header);
      Response response =await put(uri,headers: header,body: jsonEncode(items));
      _logResponses(url, response);
      if(response.statusCode >= 200 && response.statusCode < 300){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: true,responsesData: response.body.isNotEmpty ? jsonDecode(response.body):null);
      }else if(response.statusCode == 401){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: false,errorSms: "Unauthorize user");
      }
      else{
        return NetworkResponse(statusCode: response.statusCode, isSuccess:false,errorSms: "error ${response.statusCode}");
      }
    }catch(e){
      return NetworkResponse(statusCode: -1, isSuccess: false,errorSms: e.toString());
    }
  }
  //delete request
   Future<NetworkResponse> deleteRequest({required String url, Map<String,dynamic>?items})async{
    try{
      Map<String,String> header ={
        "Content-Type": "application/json",
      };
      Uri uri = Uri.parse(url);
      _logRequest(url,header:header);
      Response response =await delete(uri,headers: header,body: jsonEncode(items));
      _logResponses(url, response);
      if(response.statusCode >= 200 && response.statusCode < 300){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: true,responsesData: response.body.isNotEmpty ? jsonDecode(response.body):null);
      }else if(response.statusCode == 401){
        return NetworkResponse(statusCode: response.statusCode, isSuccess: false,errorSms: "Unauthorize user");
      }
      else{
        return NetworkResponse(statusCode: response.statusCode, isSuccess:false,errorSms: "error ${response.statusCode}");
      }
    }catch(e){
      return NetworkResponse(statusCode: -1, isSuccess: false,errorSms: e.toString());
    }
  }


void _logRequest(String url,{ Map<String,dynamic>? header,Map<String,dynamic>? responseBody}){
    logger.i("Url = $url,\n header => $header,\nresponseBody =>$responseBody}");
}
void _logResponses(String url , Response response){
     logger.i("$url\nstatusCode =>${response.statusCode},\nresponse=>${response}\n,responseBody=>${response.body}");
}
}
