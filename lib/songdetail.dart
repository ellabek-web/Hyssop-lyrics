import 'package:flutter/material.dart';
import 'package:hyssop_lyrics/config/font_provider.dart';
import 'package:provider/provider.dart';

class SongDetail extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  

  final List<dynamic>  filteredData;
  final String title;
  
  
   SongDetail(  {required this.filteredData,required this.title});
  
  @override
  State<SongDetail> createState() => _SongDetailState( filteredData,title);
}

class _SongDetailState extends State<SongDetail> {
   final List<dynamic>  filteredData;
   final String title;

   _SongDetailState( this.filteredData,this.title);
   
   
  //    double _counter = 20;
  //   _updateCounter() => setState(() {
  //   _counter++;
  // });
  // _decressCounter() => setState(() {
  //   _counter--;
  // });
   
   

  

  @override
  Widget build(BuildContext context) {
    var item= filteredData.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(title) ,
      ),
      body:ListView.builder(
        itemCount: item,
        itemBuilder: (BuildContext context, index) {
          return Center(child: Consumer<FontModel>(builder: (context,data, child){
            return
           Text(filteredData[index],
             style: TextStyle(
              color:Theme.of(context).primaryColor ,
              fontSize:  data.fontSize
             ),);}));
          }
         ),

         floatingActionButton:Padding(
           padding: const EdgeInsets.only(left: 30),
           child:Consumer<FontModel>(builder: (context,data, child){
            return
           
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
             children: [
               FloatingActionButton(
                backgroundColor: Colors.green,
                 foregroundColor: Colors.black,
                 onPressed: () {
                  data.increaseFont();
                 },
                 child: Icon(Icons.add),
         
               ),
               FloatingActionButton(
                 backgroundColor: Colors.green,
                 foregroundColor: Colors.black,
                 onPressed: () {
                     data.decreaseFont();
                 },
                 child: Icon(Icons.remove),)
             ]);
           }
           ),
         ),
      


         );
    
  }
}
 