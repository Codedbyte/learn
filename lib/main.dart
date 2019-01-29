import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'Learn',
    debugShowCheckedModeBanner: false,
    home: Home(),
    theme: ThemeData(
      primaryColor: Color(0xff001b48)
    ),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget button(icon,action){
    return FloatingActionButton(
      backgroundColor: Color(0xff001b48),
      onPressed:() {
        stopActivities(action);
      },
      child: Icon(icon,size: 35),
    );
  }
  Stopwatch _stopwatch = new Stopwatch();
  Timer _timer;
  String elapsed = '';

  stopActivities(activity){
      if (activity == 'start'){
        _stopwatch.start();
        _timer = Timer.periodic(Duration(milliseconds: 100), (Timer timer){
          setTime();
        });
      }else if (activity == 'stop'){
        _stopwatch.stop();
      }else if (activity == 'reset'){
        _stopwatch.reset();
      }
      setTime();
  }
  setTime(){
    var currentTime = _stopwatch.elapsedMilliseconds;
    setState(() {
      elapsed =Duration(milliseconds: currentTime).toString();//=> '00:00:60';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stopwatch'),
        ),
        body: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(elapsed!=''?elapsed:'0:00:00',
                style: TextStyle(
                  color: Color(0xff001b48),
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  button(Icons.play_arrow,'start'),
                  button(Icons.stop,'stop'),
                  button(Icons.refresh,'reset'),
                ],
              )
            ],
          ),
        ));
  }
}
