//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime()async{
    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child:SpinKitWave(
          color:Colors.black,
          size : 50.0,
        ),
      ),
    );
  }
}
