class Moviemodel {

  List<dynamic>data;
  
  Moviemodel ({required this.data});

  factory Moviemodel.fromJson(Map<String,dynamic>json){
    return Moviemodel(data: json["data"]);
  }
}