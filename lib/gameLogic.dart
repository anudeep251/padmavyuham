import 'dart:async' as asyn;
import 'dart:convert';
// import 'dart:html';
import 'offsets.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';
import 'gameUI.dart';
import 'dart:async';
import 'dart:io';
var touch = Offset.zero, path = Offset.zero;

// String name;
List<String> names = List(4);
String key;
Future<void> gameProgress() async {
  List<String> data;
  clientSocket.listen((u8list) {
    data = u8list.split("-");
    if (u8list.startsWith("#")) {
      names = u8list.substring(1).split("-");
      if (names.indexOf(name) != 0) {
        names = names.sublist(names.indexOf(name)) +
            names.sublist(0, names.indexOf(name));
      } else {
        di1.value = true;
      }
    } else {
      switch (names.indexOf(data[0])) {
        case 0:
          randomSel = int.parse(data[1]);
          randomPath = data[2];
          diceValue = int.parse(data[3]);
          di1.value = false;
          logic2(randomSel, randomPath);
          break;
        case 1:
          // gameTransition(int.parse(data[1]), 1,int.parse(data[2]));
          // gameTransition(int.parse(data[1]), 1,Offset(double.parse(data[2]), double.parse(data[3])));
          
          break;

        case 2:
          gameTransition(int.parse(data[1]), 2,int.parse(data[2]));

          // gameTransition(int.parse(data[1]), 2,Offset(double.parse(data[2]), double.parse(data[3])));
          break;
        case 3:
          // gameTransition(int.parse(data[1]), 3,int.parse(data[2]));
          // gameTransition(int.parse(data[1]), 3,Offset(double.parse(data[2]), double.parse(data[3])));
          di1.value = true;
          break;
        default:
          di1.value = true;

          // print([names, data[0]]);
          break;
      }
    }
  });
}

var gFlag = false, bFlag = false, yFlag = false;
List<List<bool>> isRewardPath;
List<bool> isInnerLoop = List(4);
int diceValue = 0;

gameTransition(int i, int pl, int value) {
  if (value < 24) {
    players[pl][i] =fCoordinates[value-6*(pl)<0?24+value-6*(pl):value-6*pl];
  } else if (24<=value && value<40){
 players[pl][i] =fCoordinates[value-24-4*(pl)<0?16+value-4*(pl):value-4*(pl)];
}else if (value>=40 && value<48) {
  var val=value-39 + (2 * pl) <= imCoordinates.length?value-39+(2*pl):(value-39+(2*pl))%8;
    players[pl][i] = imCoordinates[val];
}else if(value==48){
players[pl][i]=  Offset(3.0 * (baseSize.dx ~/ 7), 3.0 * (baseSize.dx ~/ 7));
}
 checkMate(i, pl);
  playerSwap.value = !playerSwap.value;
}

List<double>calc=[];
getPlayer() {
// print(players[0]);
if(players[0].contains(Offset((touch.dx~/(baseSize.dx/7))*(baseSize.dx/7),(touch.dy~/(baseSize.dx/7))*(baseSize.dx/7)))){
return players[0].indexOf(Offset((touch.dx~/(baseSize.dx/7))*(baseSize.dx/7),(touch.dy~/(baseSize.dx/7))*(baseSize.dx/7)));
}else 
if(players[0].contains(Offset((path.dx~/(baseSize.dx/7))*(baseSize.dx/7),(path.dy~/(baseSize.dx/7))*(baseSize.dx/7)))){
return players[0].indexOf(Offset((path.dx~/(baseSize.dx/7))*(baseSize.dx/7),(path.dy~/(baseSize.dx/7))*(baseSize.dx/7)));
var mid=path;
touch=mid;
path=touch;
}else{
 return  func11();
}
  }

int randomSel = 0;
// int counter = 0;
// var fTouch = false, sTouch = false;
final di1 = ValueNotifier(true), wi1 = ValueNotifier(true);
int count=0;
tapDown(TapDownDetails tap) {
  if (count==0) {
    touch = tap.localPosition;
    clientSocket.add("*" + getPlayer().toString());
    count++;
  } else if(count==1){
    path = tap.localPosition;
    count++;
    logic2(getPlayer(), getPath());
  }}
func11(){
  s(b){
for(int i=0;i<players[0].length;i++){
if(b.containsValue(players[0][i])){
  return i;
}}
  }
  if(players[0].contains(cSquares[0])){
return players[0].indexOf(cSquares[0]);
  }else{
    switch(getPath()){
      case 'fw':
      case 'bw':
return s(bCoordinates);
      break;
      case 'iFw':
      case 'iBw':
return s(ifCoordinates);
      break;
      default:
      // return ;
    }
  }
}
func12(){
  if(bCoordinates.containsValue(players[0][getPlayer()])){
    return 'fw';
  }else{
    return 'iFw';
  }
}
List calcPl=[];
getPath() {
  
// var a=  [1,7,13,19,5,11,17,23,27,31,35,39,25,29,33,37];
var a=[1,5,27,25,7,11,31,29,13,17,35,33,19,23,39,37];

var b=[];
for(int i in a){
  b.add(fCoordinates[i]);
}
if(b.contains(Offset((path.dx~/(baseSize.dx/7))*(baseSize.dx/7),(path.dy~/(baseSize.dx/7))*(baseSize.dx/7)))){
return ["fw","bw","iBw","iFw"][b.indexOf(Offset((path.dx~/(baseSize.dx/7))*(baseSize.dx/7),(path.dy~/(baseSize.dx/7))*(baseSize.dx/7)))%4];
// }else if(
// b.contains(Offset((touch.dx~/(baseSize.dx/7))*(baseSize.dx/7),(touch.dy~/(baseSize.dx/7))*(baseSize.dx/7)))){
// return ["fw","bw","iBw","iFw"][b.indexOf(Offset((touch.dx~/(baseSize.dx/7))*(baseSize.dx/7),(touch.dy~/(baseSize.dx/7))*(baseSize.dx/7)))%4];
}else{
  return func12();
}

 
  }
  


String randomPath;

checkMate(int idx, int pl) {

      if( players[pl][idx]== Offset(3.0 * (baseSize.dx ~/ 7), 3.0 * (baseSize.dx ~/ 7)))
  {
    
  }else{
  if (!gSquares.contains(players[pl][idx]) ||
      !cSquares.contains(players[pl][idx]) 
      ) {
      players.forEach((player){if(player!=players[pl]){
        if(player.contains(players[pl][idx])){
player[player.indexOf(players[pl][idx])] =cSquares[players.indexOf(player)];
if(players.indexOf(player)==0){
 isInnerLoop[player.indexOf(players[pl][idx])] = false;
      isRewardPath[0].fillRange(0, 3, false);
      fPlayer[player.indexOf(players[pl][idx])]=0;
      bPlayer[player.indexOf(players[pl][idx])]=0;}}
}});
        }}}

logic2(int idx, String dir) {
// print([idx,dir]);
  // fPlayer[idx]=fPlayer[idx]<24?24:fPlayer[idx];
  inline(List<int>bp, List<int>fp,Map<int,Offset> bc,fc) {
    if (dir == 'iBw') {
      players[0][idx] = bc[diceValue];
      bPlayer[idx] = diceValue;
    } else {
      players[0][idx] = fc[diceValue];
      fPlayer[idx] = diceValue;
    }
    checkMate(idx, 0);
  }

  regularPath() {
    
    switchPath(Map<int, Offset> fC, Map<int, Offset> bC, List<int> fP,
        List<int> bP, int max, int min) {
      if (bP[idx] - diceValue >= min) {
        bP[idx] -= diceValue;
        players[0][idx] = bC[bP[idx]];

      } else if (bP[idx] > min && bP[idx] - diceValue < min) {
        fP[idx] = -bP[idx] + diceValue + min;
        players[0][idx] = fC[fP[idx]];
        bP[idx] = 0;
      } else if (fP[idx] + diceValue <= max) {
        fP[idx] += diceValue;
        players[0][idx] = fC[fP[idx]];
      }
      if (!cSquares.contains(players[0][idx])) {
        checkMate(idx, 0);
      }
    }

    residue(Map<int, Offset> fC, Map<int, Offset> bC, int max, int min) {

          smallFunc(int val,fCc,bCc,fPc,bPc,maxc,minc){
if (fPlayer[idx] + diceValue > 16 &&
          (isInnerLoop[idx] || isRewardPath[idx].contains(true))) {
        players[0][idx] = imCoordinates[fPlayer[idx] + diceValue - val];
        isInnerLoop[idx]=false;
      } else if (bPlayer[idx] + diceValue > 16 &&
          (isInnerLoop[idx] || isRewardPath[idx].contains(true))) {
        players[0][idx] = imCoordinates[bPlayer[idx] + diceValue - val];
        isInnerLoop[idx]=false;
      } else{
          switchPath(fCc, bCc, fPc, bPc, maxc, minc);}
          }
          anotherSmallFunc(value){
 if(dir=="iFw"){
          fPlayer[idx] = value;
          bPlayer[idx]=0;
          players[0][idx] = fC[fPlayer[idx]];

          }else{
            bPlayer[idx] = value;
            fPlayer[idx]=0;
          players[0][idx] = bC[bPlayer[idx]];

          }
          isInnerLoop[idx] = true;
          }
      if (fPlayer[idx] + diceValue >= 24 ||
          isInnerLoop[idx] ||
          isRewardPath[idx].contains(true) ||
          bPlayer[idx] + diceValue >= 24) {
        if (fPlayer[idx] + diceValue >= 24) {
         anotherSmallFunc(fPlayer[idx]+diceValue-23);
        } else if (bPlayer[idx] + diceValue >= 24) {
        anotherSmallFunc(bPlayer[idx]+diceValue-23);
        }
      else if(dir=='iFw') {
smallFunc(16,fC,bC,fPlayer,bPlayer,max,min);
        }else if(dir=='iBw'){
smallFunc(16,bC,fC,bPlayer,fPlayer,max,min);
        }
      else {
      }
    }}

    switch (dir.substring(0,1)) {
      case 'f':
        switchPath(fCoordinates, bCoordinates, fPlayer, bPlayer, 23, 0);
        break;
      case 'b':
        switchPath(bCoordinates, fCoordinates, bPlayer, fPlayer, 23, 0);
        break;
      case 'i':
        if (isRewardPath[idx].contains(true)) {
          residue(
            pifCoordinates[isRewardPath[idx].indexOf(true)],
            pibCoordinates[isRewardPath[idx].indexOf(true)],
            16,
            1,
          );
        } else {
          residue(ifCoordinates, ibCoordinates, 16, 1);
        }
        break;
      default:
        break;
    }
  }

  if (gSquares.contains(players[0][idx]) && (diceValue == 1 || diceValue == 3 || diceValue == 5)) {
    players[0][idx] =
        Offset(3.0 * (baseSize.dx ~/ 7), 3.0 * (baseSize.dx ~/ 7));
  } else if (imCoordinates.values.toList().contains(players[0][idx])) {
    switch (dir) {
      case 'fw':
      case 'iFw':
        players[0][idx] = imCoordinates[
            ((imCoordinates.values.toList().indexOf(players[0][idx]) +
                            1 +
                            diceValue) %
                        8) ==
                    0
                ? 8
                : (imCoordinates.values.toList().indexOf(players[0][idx]) +
                        1 +
                        diceValue) %
                    8];
        checkMate(idx, 0);
        break;
      case 'bw':
      case 'iBw':
        players[0][idx] =
            imCoordinates.values.toList().indexOf(players[0][idx]) +
                        1 -
                        diceValue >
                    1
                ? imCoordinates[
                    (imCoordinates.values.toList().indexOf(players[0][idx]) +
                        1 -
                        diceValue)]
                : imCoordinates[
                    imCoordinates.values.toList().indexOf(players[0][idx]) +
                        1 -
                        diceValue +
                        8];
        checkMate(idx, 0);
        break;
      default:
        print("error1");
    }
  } else if (cSquares.sublist(1).contains(players[0][idx]) && dir.startsWith('i')) {
    switch (cSquares.indexOf(players[0][idx])) {
      case 1:
        if (!gFlag) {
          gFlag = true;
          inline(bPlayer, fPlayer, pibCoordinates[0],pifCoordinates[0]);
          isRewardPath[idx][0] = true;
        }
        break;
      case 2:
        if (!bFlag) {
          bFlag = true;
          inline(bPlayer, fPlayer, pibCoordinates[1],pifCoordinates[1]);
          isRewardPath[idx][1] = true;
        }
        break;
      case 3:
        if (!yFlag) {
          yFlag = true;
          isRewardPath[idx][2] = true;
          inline(bPlayer, fPlayer, pibCoordinates[2],pifCoordinates[2]);
        }
        break;
      default:
        print("error");
        break;
    }
  } else {
    regularPath();
  }

  playerSwap.value = !playerSwap.value;

  if(fCoordinates.containsValue(players[0][idx])){
clientSocket.add("$name-$idx-${
  fCoordinates.values.toList().indexOf(players[0][idx])}");

  }else if(imCoordinates.containsValue(players[0][idx])){
clientSocket.add("$name-$idx-${40+
  imCoordinates.values.toList().indexOf(players[0][idx])}");
  }else if(
        players[0][idx]==Offset(3.0 * (baseSize.dx ~/ 7), 3.0 * (baseSize.dx ~/ 7))
  ){
  clientSocket.add("$name-$idx-48");
  }
}
