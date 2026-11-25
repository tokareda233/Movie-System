import 'package:flutter/material.dart';
import 'package:movie/Providers/MoviesProvider.dart';
import 'package:movie/Views/MovieDetails.dart';
import 'package:provider/provider.dart';

class Movies extends StatelessWidget {
  const Movies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,

      ),
      body:Consumer<Moviesprovider>(
        builder:(context, value, child) {
        if(value.moviemodel==null){
          value.getMovieProvider();
          return Center(child: CircularProgressIndicator(),);
        }else{
          
          return ListView.builder(
            itemCount: value.moviemodel!.data.length,
            itemBuilder: (context, index) => GestureDetector(
              
               onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Moviedetails(
                  ImageUrl:value.moviemodel!.data[index]["poster"],
                  seats:value.moviemodel!.data[index]["seats"],
                  Title:value.moviemodel!.data[index]["name"] ,
                  showDate:value.moviemodel!.data[index]["showDate"] ,
                  showTime: value.moviemodel!.data[index]["showTime"],
                  movieId: value.moviemodel!.data[index]["id"],
                  
                 
                  ),));
               },

              child: Card(
              elevation: 3,
              child: ListTile(
                leading: Image.network(value.moviemodel!.data[index]["poster"],cacheHeight: 200,),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(value.moviemodel!.data[index]["name"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       Icon(Icons.calendar_month,size: 15,),
                       SizedBox(width: 3),
                       Text(value.moviemodel!.data[index]["showDate"])
                      ],
                    ),
              
                     SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                       Icon(Icons.timelapse,size: 15),
                       SizedBox(width: 3),
                       Text(value.moviemodel!.data[index]["showTime"])
                      ],
                    ),
              
                  ],
                ),
              ),
              
              ),
            ),);
        }
      }, )
    );
  }
}

