import 'package:flutter/foundation.dart';
import 'package:movie/Models/MovieModel.dart';
import 'package:movie/Services/MovieService.dart';

class Moviesprovider extends ChangeNotifier {

Moviemodel? moviemodel;

getMovieProvider()async{
moviemodel =await Movieservice.GetMoviesService();
notifyListeners();
}

PostBookingProvider(String CustomerName,int movieId,int seatId)async{
 await Movieservice.PostBookingService(CustomerName, movieId, seatId);
 notifyListeners();
 
}

PutCustomerName(int id,String CustomerName )async{
await Movieservice.PutCustomerNameService(id, CustomerName);
notifyListeners();

}

DeleteBookingProvider(int id)async{
await Movieservice.DeleteBookingService(id);
notifyListeners();

}


}