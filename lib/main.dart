import 'dart:async';
// import 'dart:html';
// im 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'gameLogic.dart';
import 'gameUI.dart';
import 'offsets.dart';
import 'dart:io' as io;
// TODO: adding animations,
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Board Games',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home:
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 0),
        '/game': (context) => MyHomePage(title: 1)
      },
      //  MyHomePage(title: 'PaVy Board Game'),
    );
  }
}

String name;
io.WebSocket clientSocket;

class FirstPage extends State<MyHomePage> {

  @override
  void initState() {
  func1();
  // print(pibCoordinates);
    io.NetworkInterface.list().then(
    (on){
      print(on);
    }
  // )
  );
    name = "name${Random(50).nextInt(255)}";
    io.WebSocket.connect("ws://192.168.1.213:8167").then((socket) {
      //  Socket.connect("localhost", 8088).then((sock){
      clientSocket = socket;
      // print(clientSocket.readyState == io.WebSocket.open);
      
    });
    super.initState();
  }

  var tc1 = TextEditingController(text: "key");
  final host = ValueNotifier(true), join = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      baseSize=Offset((constraints.maxWidth~/70)*70.0,(constraints.maxWidth~/70)*70.0);

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 50),
              ),
              Text("$name"),
              Padding(
                padding: EdgeInsets.only(right: 50),
              ),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: host,
            builder: (context, val, widg) {
              if (val) {
return 
row(
  "Host",key,
   () {
                        key = Random().nextInt(65536).toString();
                        if (clientSocket.readyState == io.WebSocket.open) {

        clientSocket.add("$key&$name");
      } else {
        print("unable to connect and send");
      }
      host.value=!host.value;
                      }
  );
              } else {
                return 
row("Play",key,(){
                       Navigator.of(context).pushNamed("/game");
                      });

               
              }
            },
          ),
          ValueListenableBuilder(
            
            valueListenable: join,
            builder: (context, val, widg) {
              if (val) {
                return Row(
                  children: [
                    Placeholder(fallbackWidth:baseSize.dx/2 ,fallbackHeight: 30,),
                    RaisedButton(
                      child: Text("Join"),
                      onPressed: () {
                         if (clientSocket.readyState == io.WebSocket.open) {

        clientSocket.add("${tc1.value}&$name");
      } else {
        print("unable to connect and send");
      }
                        join.value = !join.value;
                      },
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    SizedBox(
                      width: baseSize.dx/2,
                      child: 
                     TextField(
                      controller: tc1,
                      decoration: InputDecoration.collapsed(hintText: "key"),
                    )),
                    RaisedButton(
                      child: Text("Play"),
                      onPressed: () {
Navigator.of(context).pushNamed('/game');
                      },
                    ),
                   
                  ],
                );
              }
            },
          ),
        ],
      );
    }));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final int title;

  @override
  createState() {
    switch (title) {
      case 1:
        return _MyHomePageState();
      case 0:
      default:
        return FirstPage();
    }
  }
}

ValueNotifier<bool> playerSwap;

class _MyHomePageState extends State<MyHomePage> {
  final wValue = ["TBD"];
  @override
  void initState() {

    playerSwap = ValueNotifier(false);
    for (int i = 0; i < 4; i++) {
      players[i] = List(4)..fillRange(0, 4, cSquares[i]);
    }
gameProgress();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        // title: Text(widget.title),
        // ),
        body: LayoutBuilder(builder: (context, constraints) {
      baseSize=Offset((constraints.maxWidth~/70)*70.0,(constraints.maxWidth~/70)*70.0);
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: (constraints.maxHeight - baseSize.dx) / 6),),

              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    width: (baseSize.dx) / 3,
                    color: Colors.green,
                    height: (constraints.maxHeight-baseSize.dx) / 3,
                    child: Text("player2"),
                  ),
                ),
                Container(child:
                  Text("PaVy"),
                    width: (constraints.maxHeight-baseSize.dx) / 3,                          
                    height: (constraints.maxHeight-baseSize.dx) / 3,
                        ),
                /*
                ValueListenableBuilder(
                    valueListenable: wi1,
                    
                    builder: (context, value, widg) {
                      // wi1.value = true;
                      if (value) {
                        return GestureDetector(
                          child:
                        Container(
                    width: (constraints.maxHeight-baseSize.dx) / 3,
                    height: (constraints.maxHeight-baseSize.dx) / 3,

                            child: Text("TBD"),),
                            onTapDown: (details) {
                              wi1.value = !wi1.value;

                            });
                      } else {
                        return Container(
                    width: (constraints.maxHeight-baseSize.dx) / 3,                          
                    height: (constraints.maxHeight-baseSize.dx) / 3,
                        );
                      }
                    }),*/
                
               
                Card(
                  child: Container(
                    color: Colors.blue,
    width: (baseSize.dx) / 3,
                    height: (constraints.maxHeight-baseSize.dx) / 3,
                    child: Text("player3"),
                  ),
                ),
              ],
            ),
            //Padding(padding: EdgeInsets.only(top: (constraints.maxHeight - baseSize.dx) / 12),),

            GestureDetector(
                onDoubleTap: () {},
                onTapDown: tapDown,
                child:
               
                 Container(
                  width: baseSize.dx,
                  height: baseSize.dy,
                  child: CustomPaint(
                    // foregroundPainter: ,
                    painter: BGPaint(),
                    child: 
                     ValueListenableBuilder<bool>(
                        valueListenable: playerSwap,
                        builder: (
                          context,
                          value,
                          widget,                        ) {
                          return                          
                     CustomPaint(painter: Pawns(),);}),))),
            //Padding(padding: EdgeInsets.only(top: (constraints.maxHeight - baseSize.dx) / 12),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    child: Container(
                  // width: baseSize.dx / 3,
                  width: baseSize.dx / 3,

                  height: (constraints.maxHeight - baseSize.dx) / 3,
                  color: Colors.red,
                  child: Column(
                    children:[
                  Text("$name"),
                    // ButtonBar(children: [Icon(Icons.bolt),Icon(Icons.add_box_rounded),Icon(Icons.fireplace)])
                    ]
                  )
                )),
               
                ValueListenableBuilder(
                    valueListenable: di1,
                    // child: Text("$diceValue"),
                  //  child: 
                    builder: (context, value, widg) {
                      if (value) {
                        return 
                        GestureDetector(     
                                              
                            child:  Container(
                    child:CustomPaint(painter: Dices(diceValue,di1.value?Colors.green:Colors.red)),
                          width: (constraints.maxHeight - baseSize.dx) / 3,
                          height: (constraints.maxHeight - baseSize.dx) / 3,
                        ),
                            onTapDown: (details) {
                              diceValue = Random().nextInt(1) + 5;
                              clientSocket.add('*$name#'+diceValue.toString());
                              di1.value = !di1.value;
                              count=0;
                              touch=Offset.zero;
path=Offset.zero;
                            });
                      } else {
                        return Container(
                    child:CustomPaint(painter: Dices(diceValue,di1.value?Colors.green:Colors.red)),
                          width: (constraints.maxHeight - baseSize.dx) / 3,
                          height: (constraints.maxHeight - baseSize.dx) / 3,
                        );
                        
                    
                      }
                    }),
               
                Card(
                  child: Container(
                    width: (baseSize.dx) / 3,
                    height: (constraints.maxHeight - baseSize.dx) / 3,
                    color: Colors.yellow,
                    child: Text("player4"),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }));
  }
}
