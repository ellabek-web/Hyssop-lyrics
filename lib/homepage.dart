import 'dart:convert';

import 'package:flutter/material.dart';
import 'appdrawer.dart';
import 'widgets/song_list.dart';
import 'config/theme.dart';

import 'package:flutter/services.dart' as rootBundle;


class MyHomePage extends StatefulWidget {
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {







  List data=[];
  List filteredData=[];

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
                    trailing: IconButton(
                      alignment: Alignment.centerLeft,
                              icon: Icon(
                                Icons.favorite_border,
                                size: 30.0,
                                color: Colors.brown[900],
                              
                              ),
                              onPressed: () {
                                //   _onDeleteItemPressed(index);
                              },
                            ),
                  ),
                );
              },
            ),
          ),
               ],
             ),





              Icon(Icons.directions_transit),            
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
