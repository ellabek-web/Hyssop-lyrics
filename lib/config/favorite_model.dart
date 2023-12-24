
import 'dart:collection';

import 'package:flutter/material.dart';




class FavoriteModel extends ChangeNotifier {

final List _favorite=  [];


//  List<bool> _isFavorited = List.filled(48, false);


// final Icon fav_col = Icon (Icons.favorite_border,
//                             size: 30.0,
//                             color: Color.fromARGB(255, 237, 5, 16),);


// final Icon fav_col2 = Icon (Icons.favorite_border,
//                             size: 30.0,
//                            color: const Color.fromARGB(255, 33, 32, 31),);

// late Icon th_color=fav_col2;                     

UnmodifiableListView<dynamic> get favorite => UnmodifiableListView(_favorite);

void  addFavorite(dynamic favorite){
if (_favorite.contains(favorite)){
  _favorite.remove(favorite);
} else{
  _favorite.add(favorite);
}
  
  notifyListeners();
}

void removeFavorite(dynamic favorite){

  _favorite.remove(favorite);
  notifyListeners();
}


}