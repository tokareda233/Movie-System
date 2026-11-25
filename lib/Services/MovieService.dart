import 'package:dio/dio.dart';
import 'package:movie/Models/MovieModel.dart';

class Movieservice {

  static Dio dio=Dio();

  static Future<Moviemodel> GetMoviesService()async{
    try{
      Response response =await dio.get("https://apimovie.runasp.net/api/Movies");
      return Moviemodel.fromJson(response.data);
    }catch(e){
      throw Exception(e);
    }
  }

static Future<void> PostBookingService(String CustomerName,int movieId,int seatId)async{
    try{
      Response response =await dio.post("https://apimovie.runasp.net/api/Bookings",
      data: {
        "CustomerName":CustomerName,
        "movieId":movieId,
        "seatId":seatId
      });
      
    }catch(e){
      throw Exception(e);
    }
  }

static Future<void> PutCustomerNameService(int id,String CustomerName)async{
    try{
      Response response =await dio.put("https://apimovie.runasp.net/api/Bookings/$id",
      data: {
        "CustomerName":CustomerName,
      });
      
    }catch(e){
      throw Exception(e);
    }
  }

static Future<void> DeleteBookingService(int id)async{
    try{
      Response response =await dio.delete("https://apimovie.runasp.net/api/Bookings/$id",);
     
      
    }catch(e){
      throw Exception(e);
    }
  }





}