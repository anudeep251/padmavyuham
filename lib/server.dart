
// import 'dart:html';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:typed_data';
// sock.add(io.Datagram("hi there!".codeUnits,io.InternetAddress.loopbackIPv4,8167));
  /*  
  var copyData={};
  Timer.periodic(Duration(seconds: 1), (timer){
userData.forEach((k,v){
  if(copyData[k].length!=userData[k].length){
sock.add(userData[k].last);
  }
});
 });*/
 callback(timer){
   String localVar="";
   if(!ignoreCall){
     for(int i=0;i<counter.length;i++){
       localVar+=counter[i]+'-';
     }
    //  userData[counter[0]].add("${}");
   }
 }
 Map<String,List<String>> play={};
 List<String>counter=[];
 bool ignoreCall=false;
func1(WebSocket sock)async{  


  String name;
sock.listen((data){
  if(data.contains("&")){
    if(!play.containsKey(data.split("&")[0])){
    play[data.split("&")[0]]=[]..add(data.split("&")[1]);
    }else{
    play[data.split("&")[0]].add(data.split("&")[1]);
if(play[data.split("&")[0]].length==4){
Timer.periodic(Duration(seconds: 7), callback);
    }
    }
name=data.split("&")[1];
    print(name);
    userData[name]=sock;
    // sockets.add(sock);
sock.add("#$name-name216-name215-name214");
  }else if(data.startsWith('*')){  
    counter.addAll(data.substring(1).split('#'));
    // print(counter);
  ignoreCall=false;  
  }else if(data.contains("-")){
ignoreCall=true;
  //  print("data:");
// var read=stdin.readLineSync();
for(int i=1;i<4;i++){
sock.add("${names[i]}${data.substring(names[0].length)}");
}
// sockets.forEach((sock){
// sock.extensions
// sock.add(data);
// });
  }

 
});
}

Map<String,WebSocket> userData={};
// List<WebSocket>sockets=List();
main()async{

   var list=await NetworkInterface.list();

  // list.first.addresses.first
   
  // /// io.ConnectionTask
  HttpServer.bind(list.first.addresses.first, 8167).then((conn){

    print("listening on ${conn.address}:${conn.port}");
conn.listen((req)async{

    // print(req.connectionInfo.remoteAddress);

  WebSocketTransformer.upgrade(req).then((sock){
func1(sock);
// sock.add("hello dart html!");
  });
  });
  });}
List<String>names=['name221','name216','name215','name214'];

  
