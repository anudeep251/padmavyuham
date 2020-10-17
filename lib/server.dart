
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
  // print(Utf8Codec().decode(data));
  // print(data);
  // if(data.first==35 && data.last==35){
//  var onData= Utf8Decoder().convert(data).substring(1,).split("-");
    // userData[onData[1]]=List();
    // port=int.parse(onData[0]);
// name=onData[1];
  // }else{
    // userData[name].add(data);
// ports.forEach((socket){ 
  // if(socket.remotePort!=port){
    // socket.add(data);
  // }
  // }
// );
  // }
 
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
  /*
func3(HttpRequest req)async{
   print(req.uri);

 if(req.uri.path=="/index"){
   req.response.addStream(File("index.html").openRead())..then((onValue){
   req.response.close();

   });
 }
}

func2(HttpServer server)async{

server.listen((req){
  func3(req);
});

}
 // print(req.uri.origin);
    // req.response.add("hello world".codeUnits);
// req.response.close();


  print(WebSocketTransformer.isUpgradeRequest(req));

  /*
    // print(req.headers.host);

// HttpServer httpServer;
ServerSocket.bind("localhost", 8088).then((ss){
// func2(HttpServer.listenOn(ss));
  ss.listen((onData){
    ports.add(onData);
    func1(onData);
    
  });
});

*/
func1(sock);
// sock.add("hello client again!");
// sock.add("hello dart client!");
// sock.add("hello dart client again!");
// print(sock.pro);
  });
  if(req.uri.path=='/text'){
    // req.response.headers.contentType=ContentType.binary;
// req.response.headers./    
    req.response.add("hello world".codeUnits);

req.response.add("wonderful flutter".codeUnits);
// req.response.write("hello");
req.response.close();
  }else{
req.response.add("wonderful flutter".codeUnits);
req.response.close();

  }
  
  if(req.uri.path=='/image'){
    req.response.headers.contentType=ContentType.parse("image/png");

List<int>bytes=[];
    File("img11.png").openRead().listen((onData){
bytes.addAll(onData);
    });
  req.response.add(bytes);
  // .then((onValue){
    // req.response.flush().then((onValue){
  req.response.close();
  }
// req.response.
// );
  // });*/
  
