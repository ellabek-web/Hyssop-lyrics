import "dart:collection";

import "package:flutter/material.dart";

class FontModel extends ChangeNotifier {
 double _fontSize = 16.0;

  @override
  double get fontSize => _fontSize;

 void increaseFont(){
if(fontSize <= 21){
  _fontSize++;
   notifyListeners();
}


}
void decreaseFont(){
  if(fontSize >= 15){
    _fontSize--;
     notifyListeners();
  }
}

}