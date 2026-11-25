import 'package:flutter/material.dart';
import 'package:movie/Providers/MoviesProvider.dart';
import 'package:movie/Views/BookSeat.dart';
import 'package:movie/Views/BookingDetails.dart';
import 'package:provider/provider.dart';

class Moviedetails extends StatelessWidget {
  String ImageUrl;
  String Title;
  String showDate;
  String showTime;
  List<dynamic>seats;
  int movieId;
// dynamic movie;
  Moviedetails({super.key,required this.ImageUrl,required this.Title,required this.showDate,required this.showTime,required this.seats,required this.movieId,});
//Moviedetails({super.key,required this.movie});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Mineccraft",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
    ),
    body: Consumer<Moviesprovider>(
      builder: (context, value, child) => 
       Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: ListTile(
                    leading: Container(
                      width: 70,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image.network(ImageUrl,cacheHeight: 200,fit: BoxFit.fill,)
                      ),
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           Icon(Icons.calendar_month,size: 15,color: Colors.red,),
                           SizedBox(width: 3),
                           Text(showDate)
                          ],
                        ),
                  
                         SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           Icon(Icons.timelapse,size: 15,color: Colors.red,),
                           SizedBox(width: 3),
                           Text(showTime)
                          ],
                        ),
                  
                      ],
                    ),
                  ),
            ),
      
            SizedBox(height: 8,),
            Text("Select Your Seat",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5), 
              itemCount: seats.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  if(seats[index]["status"]=="Available"){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Bookseat(
                    ImageUrl: ImageUrl, SeatName: seats[index]["seatNumber"], Title: Title, showDate: showDate, showTime: showTime,movieId: movieId,
                    seatId: seats[index]["seatId"],),));
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Bookingdetails(
                    customerName:seats[index]["customerName"] ,ImageUrl: ImageUrl, SeatName: seats[index]["seatNumber"], Title: Title, showDate: showDate, showTime: showTime,
                    bookingId:seats[index]["bookingId"] ,
                    
                    ),));
                  }
                },
                child: Card(
                  child: Center(child: Text(seats[index]["seatNumber"],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  color:seats[index]["status"]=="Booked"?Colors.red:Colors.amber ,
                ),
              ),
              ),
            )
          ],
        ),
      ),
    ),

    );
  }
}