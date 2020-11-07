
import"dart:ui";

import 'gameLogic.dart';

int jnum=0;
List<Map<int,Offset>>
 pibCoordinates=List(3),
//  =List(3);..fillRange(0, 3,<int,Offset>{}),
 pfCoordinates=List(3),
//  =List(3)..fillRange(0, 3,<int,Offset>{}),
  pifCoordinates=List(3);
  // =List(3)..fillRange(0, 3,<int,Offset>{});
 Offset baseSize=Offset(210 ,210);
List<Offset>cSquares=List(4)..setAll(0,[fCoordinates[0],fCoordinates[6],fCoordinates[12],fCoordinates[18]]),
gSquares=List(4)..setAll(0,[imCoordinates[2],imCoordinates[4],imCoordinates[6],imCoordinates[8]]);

Map<int,Offset>
 fCoordinates = {
  0: Offset(0.0 * (baseSize.dx / 7), 6.0 * (baseSize.dx / 7)),
  1: Offset(0.0 * (baseSize.dx / 7), 5.0 * (baseSize.dx / 7)),
  2: Offset(0.0 * (baseSize.dx / 7), 4.0 * (baseSize.dx / 7)),
  3: Offset(0.0 * (baseSize.dx / 7), 3.0 * (baseSize.dx / 7)),
  4: Offset(0.0 * (baseSize.dx / 7), 2.0 * (baseSize.dx / 7)),
  5: Offset(0.0 * (baseSize.dx / 7), 1.0 * (baseSize.dx / 7)),
  6: Offset(0.0 * (baseSize.dx / 7), 0.0 * (baseSize.dx / 7)),
  7: Offset(1.0 * (baseSize.dx / 7), 0.0 * (baseSize.dx / 7)),
  8: Offset(2.0 * (baseSize.dx / 7), 0.0 * (baseSize.dx / 7)),
  9: Offset(3.0 * (baseSize.dx / 7), 0.0 * (baseSize.dx / 7)),
  10: Offset(4.0 * (baseSize.dx / 7), 0.0 * (baseSize.dx / 7)),
  11: Offset(5.0 * (baseSize.dx / 7), 0.0 * (baseSize.dx / 7)),
  12: Offset(6.0 * (baseSize.dx / 7), 0.0 * (baseSize.dx / 7)),
  13: Offset(6.0 * (baseSize.dx / 7), 1.0 * (baseSize.dx / 7)),
  14: Offset(6.0 * (baseSize.dx / 7), 2.0 * (baseSize.dx / 7)),
  15: Offset(6.0 * (baseSize.dx / 7), 3.0 * (baseSize.dx / 7)),
  16: Offset(6.0 * (baseSize.dx / 7), 4.0 * (baseSize.dx / 7)),
  17: Offset(6.0 * (baseSize.dx / 7), 5.0 * (baseSize.dx / 7)),
  18: Offset(6.0 * (baseSize.dx / 7), 6.0 * (baseSize.dx / 7)),
  19: Offset(5.0 * (baseSize.dx / 7), 6.0 * (baseSize.dx / 7)),
  20: Offset(4.0 * (baseSize.dx / 7), 6.0 * (baseSize.dx / 7)),
  21: Offset(3.0 * (baseSize.dx / 7), 6.0 * (baseSize.dx / 7)),
  22: Offset(2.0 * (baseSize.dx / 7), 6.0 * (baseSize.dx / 7)),
  23: Offset(1.0 * (baseSize.dx / 7), 6.0 * (baseSize.dx / 7)),
  24: Offset(1.0 * (baseSize.dx / 7), 5.0 * (baseSize.dx / 7)),
  25: Offset(1.0 * (baseSize.dx / 7), 4.0 * (baseSize.dx / 7)),
  26: Offset(1.0 * (baseSize.dx / 7), 3.0 * (baseSize.dx / 7)),
  27: Offset(1.0 * (baseSize.dx / 7), 2.0 * (baseSize.dx / 7)),
  28: Offset(1.0 * (baseSize.dx / 7), 1.0 * (baseSize.dx / 7)),
  29: Offset(2.0 * (baseSize.dx / 7), 1.0 * (baseSize.dx / 7)),
  30: Offset(3.0 * (baseSize.dx / 7), 1.0 * (baseSize.dx / 7)),
  31: Offset(4.0 * (baseSize.dx / 7), 1.0 * (baseSize.dx / 7)),
  32: Offset(5.0 * (baseSize.dx / 7), 1.0 * (baseSize.dx / 7)),
  33: Offset(5.0 * (baseSize.dx / 7), 2.0 * (baseSize.dx / 7)),
  34: Offset(5.0 * (baseSize.dx / 7), 3.0 * (baseSize.dx / 7)),
  35: Offset(5.0 * (baseSize.dx / 7), 4.0 * (baseSize.dx / 7)),
  36: Offset(5.0 * (baseSize.dx / 7), 5.0 * (baseSize.dx / 7)),
  37: Offset(4.0 * (baseSize.dx / 7), 5.0 * (baseSize.dx / 7)),
  38: Offset(3.0 * (baseSize.dx / 7), 5.0 * (baseSize.dx / 7)),
  39: Offset(2.0 * (baseSize.dx / 7), 5.0 * (baseSize.dx / 7)),  },
ifCoordinates={},bCoordinates={}


,ibCoordinates={},
imCoordinates={
  1:Offset(2.0*(baseSize.dx / 7),4.0*(baseSize.dx / 7)),
  2:Offset(2.0*(baseSize.dx / 7),3.0*(baseSize.dx / 7)),
  3:Offset(2.0*(baseSize.dx / 7),2.0*(baseSize.dx / 7)),
  4:Offset(3.0*(baseSize.dx / 7),2.0*(baseSize.dx / 7)),
  5:Offset(4.0*(baseSize.dx / 7),4.0*(baseSize.dx / 7)),
  6:Offset(4.0*(baseSize.dx / 7),3.0*(baseSize.dx / 7)) , 
  7:Offset(4.0*(baseSize.dx / 7),2.0*(baseSize.dx / 7)),
  8:Offset(3.0*(baseSize.dx / 7),4.0*(baseSize.dx / 7)),

  };

List<int> fPlayer = List(4),
    bPlayer = List(4);
func1(){
 pibCoordinates=List(3)..setAll(0,[<int,Offset>{},<int,Offset>{},<int,Offset>{}]);
 pfCoordinates=List(3)..setAll(0,[<int,Offset>{},<int,Offset>{},<int,Offset>{}]);
  pifCoordinates=List(3)..setAll(0,[<int,Offset>{},<int,Offset>{},<int,Offset>{}]);



fPlayer.fillRange(0, 4, 0);
bPlayer.fillRange(0, 4,0);
isInnerLoop.fillRange(0, 4, false);
isRewardPath= List(4)..fillRange(0, 4, List(3)..fillRange(0, 3, false));
  fCoordinates
..forEach((k,v){
  if(0<k && k<24){
 bCoordinates[24-k]=v; }
 else if(k==0 || k==24){
   bCoordinates[k]=v;
 }
 })

..forEach((k,v){
  if(k>=24 && k<40){
    ifCoordinates[k-23]=v;
  }
});
ifCoordinates..forEach((k,v){
  if(k>1 && k<=16){
    ibCoordinates[18-k]=v;}
else if(k==1){
ibCoordinates[k]=v;
    }});

fCoordinates.forEach((k,v){
    // val1.setAll(0,<int>[k-6<0?24+k-6:k-6,k-12<0?24+k-12:k-12,k-18<0?24+k-18:k-18]);
    for(int i=0;i<3;i++){
  if(k<24){
pfCoordinates[i][k]=fCoordinates[k-6*(i+1)<0?24+k-6*(i+1):k-6*(i+1)];
}
  else if(k>=24 && k<40){
// val1.setAll(0,[k-28<0?16+k-4:k-4,k-32<0?16+k-8:k-8,k-36<0?16+k-12:k-12]);
// for(int i=0;i<3;i++){
pifCoordinates[i][k-23]=fCoordinates[k-24-4*(i+1)<0?16+k-4*(i+1):k-4*(i+1)];
}
  }
});

pifCoordinates.forEach((val){

   val..forEach((k,v){
if(k>1 && k<=16){
pibCoordinates[jnum][18-k]=v;
}else if(k==1){
pibCoordinates[jnum][k]=v;
}
 });
 jnum++;
 });

}
var deaths=List(4)..fillRange(0,4,0);
