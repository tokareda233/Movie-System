import 'package:flutter/material.dart';
import 'package:movie/Providers/MoviesProvider.dart';
import 'package:provider/provider.dart';

class Bookseat extends StatelessWidget {
  String ImageUrl;
  String Title;
  String showDate;
  String showTime;
  String SeatName;
  int movieId;
  int seatId;
  TextEditingController textController=TextEditingController();
   Bookseat({super.key,required this.ImageUrl,required this.SeatName,required this.Title,required this.showDate,required this.showTime,required this.movieId,required this.seatId});

  @override
  Widget build(BuildContext context) {
    Moviesprovider providerObj=Provider.of<Moviesprovider>(context);
    return Scaffold(
   appBar: AppBar(
      title: Text("Book Seat",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
    ),

     body: Padding(
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

                      Text("Seat: ${SeatName}",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                
                    ],
                  ),
                ),
          ),

          SizedBox(height: 30,),
          Text("Enter Your Name",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          TextField(
            controller: textController,
            decoration:InputDecoration(
              label: Text("Full Name"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ) ,
          ),

         SizedBox(height: 350,),
          Row(mainAxisSize: MainAxisSize.min,
            children: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel",style: TextStyle(color: Colors.deepPurpleAccent),)),
          SizedBox(width: 5,),
           ElevatedButton(onPressed: ()async{
           await providerObj.PostBookingProvider(textController.text, movieId, seatId);
            textController.clear();
            Navigator.pop(context,true);
           
          }, child: Text("Confirm",style: TextStyle(color: Colors.deepPurpleAccent,),),style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 226, 222, 222)),),
                    
                    ],)

         
         
          

        ],
       ),
     ),

    );
  }
}