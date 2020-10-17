import 'dart:ui';

import 'package:flutter/material.dart';
// import 'gameLogic.dart';
import 'offsets.dart';
var players=List<List<Offset>>(4);


class Dices extends CustomPainter{
  final value;
final color;
  Dices(this.value,this.color);
  @override
  void paint(Canvas canvas, Size size) {
canvas.drawRect(Rect.fromCenter(center:Offset(size.width/2,size.height/2),width: size.width,height: size.width),
 Paint()..color=Colors.black87);
canvas.drawCircle(Offset(size.width/2,size.height/2), size.width/2, Paint()..color=color);
canvas.drawParagraph((ParagraphBuilder(ParagraphStyle(textAlign: TextAlign.center,
fontSize: size.width/3))..addText("$value")).build()
..layout(ParagraphConstraints(width: size.width/3)),Offset(size.width/3,size.height/3));
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return false;
  }
}
class Pawns extends CustomPainter{
  final colors=[[Colors.black87,Colors.black87,Colors.black87,Colors.black87,],[Colors.red,Colors.green,Colors.blue,Colors.yellow]];
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return false;
  }
  @override
  void paint(Canvas canvas, Size size) {
    for(int j=1;j<3;j++){
for(int i=3;i>=0;i--){
canvas.drawCircle(players[i][0].translate(size.width/(28),3*size.width/(28)), size.width/(28*j), Paint()..color=colors[j-1][i]);
canvas.drawCircle(players[i][1].translate(3*size.width/(28),3*size.width/(28)), size.width/(28*j), Paint()..color=colors[j-1][i]);
canvas.drawCircle(players[i][2].translate(3*size.width/(28),size.width/(28)), size.width/(28*j), Paint()..color=colors[j-1][i]);
canvas.drawCircle(players[i][3].translate(size.width/(28),size.width/(28)), size.width/(28*j), Paint()..color=colors[j-1][i]);
}
  }}
}
class BGPaint extends CustomPainter {
@override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
  return false;
  }
@override
  void paint(Canvas canvas,Size size) {
    for(int i=0;i<fCoordinates.length;i++){
      switch(i){
      case 0:
canvas.drawRect(Rect.fromCenter(width:size.width/7,height:size.height/7,center: fCoordinates[i].translate(size.width/14,size.height/14)), 
Paint()..color=Colors.red..style=PaintingStyle.fill);
break;
case 23:
case 7:
case 29:
case 39:
canvas.drawPath(Path()..addPolygon([ fCoordinates[i].translate(size.width/14,0),
fCoordinates[i].translate(size.width/14,size.height/7),
fCoordinates[i].translate(size.width/7,size.height/14)], true), Paint()..color=Colors.black87);

break;
case 6:        
canvas.drawRect(Rect.fromCenter(width:size.width/7,height:size.height/7,center: fCoordinates[i].translate(size.width/14,size.height/14)),
 Paint()..color=Colors.green..style=PaintingStyle.fill);
break;
case 12:      
canvas.drawRect(Rect.fromCenter(width:size.width/7,height:size.height/7,center: fCoordinates[i].translate(size.width/14,size.height/14)),
 Paint()..color=Colors.blue..style=PaintingStyle.fill);
break;
case 11:
case 19:
case 31:
case 37:
canvas.drawPath(Path()..addPolygon([ 
fCoordinates[i].translate(size.width/14,0),
fCoordinates[i].translate(size.width/14,size.height/7),
fCoordinates[i].translate(0,size.height/14)], true), Paint()..color=Colors.black87);

break;

case 18:
canvas.drawRect(Rect.fromCenter(width:size.width/7,height:size.height/7,center: fCoordinates[i].translate(size.width/14,size.height/14)), Paint()..color=Colors.yellow..style=PaintingStyle.fill);
break;
case 5:
case 13:
case 27:
case 33:
canvas.drawPath(Path()..addPolygon([ 
fCoordinates[i].translate(0,size.height/14),
fCoordinates[i].translate(size.width/14,size.height/7),
fCoordinates[i].translate(size.width/7,size.height/14)], true), Paint()..color=Colors.black87);
break;
case 17:
case 1:
case 25:
case 35:
canvas.drawPath(Path()..addPolygon([ 
fCoordinates[i].translate(0,size.height/14),
fCoordinates[i].translate(size.width/14,0),
fCoordinates[i].translate(size.width/7,size.height/14)], true), Paint()..color=Colors.black87);
break;
      }
 canvas.drawRect(Rect.fromCenter(width:size.width/7,height:size.height/7,center: fCoordinates[i].translate(size.width/14,size.height/14)),
 Paint()..color=Colors.black87..style=PaintingStyle.stroke);

    for(int i=1;i<=imCoordinates.length;i++){
      if([2,4,6,8].contains(i)){

      
canvas.drawRect(Rect.fromCenter(width:size.width/7,height:size.height/7,center: imCoordinates[i].translate(size.width/14,size.height/14)), 
Paint()..color=Colors.purple..style=PaintingStyle.fill);}
canvas.drawRect(Rect.fromCenter(width:size.width/7,height:size.height/7,center: imCoordinates[i].translate(size.width/14,size.height/14)), 
Paint()..color=Colors.black87..style=PaintingStyle.stroke);
    
    }
    
}

}
}
typedef Func1=void Function();
row(String txt,String k,Func1 func, ){
  return  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" key: $k"),
                    RaisedButton(
                      child: Text(txt),
                      onPressed: func
                     ,
                    ),
                    
                  ],
                );
}