import 'package:flutter/material.dart';
import 'package:movie/Providers/MoviesProvider.dart';
import 'package:provider/provider.dart';

class Bookingdetails extends StatelessWidget {
  String ImageUrl;
  String Title;
  String showDate;
  String showTime;
  String SeatName;
  int bookingId;
  String customerName;
  
  late final TextEditingController textController;
   Bookingdetails({super.key,required this.customerName,required this.ImageUrl,required this.SeatName,required this.Title,required this.showDate,required this.showTime,required this.bookingId}){
      
      textController = TextEditingController(text: customerName);
   }
 
  

  @override
  Widget build(BuildContext context) {
    Moviesprovider providerObj=Provider.of<Moviesprovider>(context);
    return Scaffold(
   appBar: AppBar(
      title: Text("Booking Details",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
    ),

     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Card(
            elevation: 3,
            child: ListTile(
                  
                  leading: Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                   ),
                   clipBehavior: Clip.antiAlias,
                  child: Image.network(ImageUrl,fit: BoxFit.cover,),
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
          Text("Booked By",style: TextStyle(fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          TextField(
            controller: textController,
            
            decoration:InputDecoration(
              label: Text("Customer Name"),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              )
            ) ,
          ),

         Spacer(),
          ElevatedButton(onPressed: ()async{
            await providerObj.DeleteBookingProvider(bookingId);
           
            Navigator.pop(context, true);
          }, child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.delete,color: Colors.red,),
              SizedBox(width: 4,),
              Text("Cancel Booking",style: TextStyle(color: Colors.red),)
            ],
          ),
          style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 40)),
          ),
          SizedBox(height: 9,),
           ElevatedButton(onPressed: ()async{
           await providerObj.PutCustomerName(bookingId, textController.text);
            
            Navigator.pop(context);
          }, child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit,color: Colors.white,),
              SizedBox(width: 4,),
              Text("Edit Booking",style: TextStyle(color: Colors.white),)
            ],
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent,minimumSize: Size(double.infinity, 40)),
          ),
         
         
          

        ],
       ),
     ),

    );
  }
}