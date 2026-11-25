
import 'package:flutter/material.dart';
import 'package:movie/Models/MovieModel.dart';
import 'package:movie/Services/MovieService.dart';

class Moviesprovider extends ChangeNotifier {

  Moviemodel? moviemodel;

  Future<void> getMovieProvider() async {
    moviemodel = await Movieservice.GetMoviesService();
    notifyListeners();
  }

   PostBookingProvider(String CustomerName, int movieId, int seatId) async {

    await Movieservice.PostBookingService(CustomerName, movieId, seatId);

    await getMovieProvider();
  }

   PutCustomerName(int id, String CustomerName) async {

    await Movieservice.PutCustomerNameService(
        id, CustomerName);

    await getMovieProvider();
  }

   DeleteBookingProvider(int id) async {

    await Movieservice.DeleteBookingService(id);

    await getMovieProvider();
  }
}
