import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appdrawer.dart';
import 'widgets/song_list.dart';
import 'config/theme.dart';
import 'songdetail.dart';
import 'config/favorite_model.dart';

import 'package:flutter/services.dart' as rootBundle;


class MyHomePage extends StatefulWidget {
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {







  List data=[];
  List filteredData=[];
  List isfavorite=[];
  

  @override
  void initState() { 
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final String jsonString = await rootBundle.rootBundle.loadString('assets/songlist.json');
    final data = await json.decode(jsonString);
    setState(() {
      this.data = data;
      this.filteredData = data;
    });
  }
  

  @override
  Widget build(BuildContext context) {
   Size size= MediaQuery.of(context).size;
   return  DefaultTabController(
        length: 2,
        child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
              tabs: [
                Tab(
                 text: 'Hyysop',
                 ),
                Tab(
                  text: 'Favorites',
                ),
                
              ],
            ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(" Hyysop Lyrics",

      
          
                   ),
        ),
      ),
      body: TabBarView(
            children: [
             Column(
               children: [
                 Padding(
              padding: const EdgeInsets.all(0),
                child: Card(

              child: Container(
                child: TextField(
                 textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Barbaadi...',
                    
                    
                  ),
                  onChanged: (text) {
                    text = text.toLowerCase();
                    setState(() {
                      filteredData = data.where((item) {
                        var itemTitle = item['title'].toLowerCase();
                        return itemTitle.contains(text);
                      }).toList();
                    });
                  },
                ),
              ),
            ),
              ),
                 Expanded(
            child: ListView.builder(
              itemCount: filteredData == null ? 0 : filteredData.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(filteredData[index]['title'],
                     style: Theme.of(context).textTheme.titleMedium,),

                    subtitle: Text(filteredData[index]['title'],
                    style: Theme.of(context).textTheme.titleSmall,),
                    trailing: Consumer<FavoriteModel>(builder: (context,data, child){

                     

                      
                    
                   return  IconButton(
                       
                       onPressed: () {
                                data.addFavorite(index); 
                                
                              },
                       alignment: Alignment.centerLeft,
                              icon: Icon (
                                data.favorite.contains(index)?  Icons.favorite : Icons.favorite_border,
                                color: Colors.red,
                             
                            ));}),
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> SongDetail(filteredData: filteredData[index]['song'],title: filteredData[index]['title'])));
                          },
                      
                  ),
                );
              },
            ),
          ),
               ],
             ),




           //for favorite tap




           Consumer<FavoriteModel>(builder: (context,data, child){
            return ListView.builder(
              itemCount: data.favorite == null ? 0 : data.favorite.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(

                     title: Text(filteredData[data.favorite[index]]['title'],
                     style: Theme.of(context).textTheme.titleMedium,),

                     subtitle: Text(filteredData[data.favorite[index]]['title'],
                     style: Theme.of(context).textTheme.titleSmall,),

                    
                      trailing:  IconButton(
                      alignment: Alignment.centerLeft,
                              icon: Icon(
                                Icons.favorite,
                                size: 30.0,
                                color: Colors.red,
                              
                              ),
                              onPressed: () {
                                data.removeFavorite(index);   
                              },
                            ),


                    // title: Text(data.favorite[index]['title'],
                    //  style: Theme.of(context).textTheme.titleMedium,),

                    // subtitle: Text(data.favorite[index]['title'],
                    // style: Theme.of(context).textTheme.titleSmall,),
                    
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> SongDetail(filteredData: filteredData[index]['song'],title: filteredData[index]['title'])));
                          },
                      
                  ),
                );
              },
            );}
          ),


                         
            ],
          ),
      drawer: appDrawer(size: size)
        
    )
    );
   

  }


  // Future<List<SongList>>ReadJsonData() async{
  //    final jsondata = await rootBundle.rootBundle.loadString('assets/songlist.json');
  //    final list = json.decode(jsondata) as List<dynamic>;
 
  //    return list.map((e) => SongList.fromJson(e)).toList();
  // }
   
}
