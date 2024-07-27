import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  late String location;
  late String time; //the time in the location
  late String flag; //url to an asset flag icon
  late String url; //location url
  late bool isDaytime;


  WorldTime({required this.location,required this.flag, required this.url});
  Future<void> getTime() async{
    try{
      //make the request
      Response response = await get(Uri.parse('https://www.worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);
      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      //print(datetime);
      //print(offset);
      //create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset) ));

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time =DateFormat.jm().format(now);
    }catch(e){
        print('Caught Error:$e');
        time = 'could not get time';
    }


  }
}

//WorldTime instance = WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');

