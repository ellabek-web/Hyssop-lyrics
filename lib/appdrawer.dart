import 'package:flutter/material.dart';
import 'config/thememodel.dart';
import 'config/theme.dart';
import 'package:provider/provider.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
         width: size.width*0.8,

      child: ListView(children: [
        DrawerHeader(
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hyssop ',
                    style: Theme.of(context).textTheme.titleLarge,  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed:(){
                      context.read<ThemeModel>().toggleTheme();
                            },
                       icon:Icon(Icons.mode_night) ),
                  )
                ],
              )
            ],
          )
         ),
         ListTile(
         title: Text('text',
                style: Theme.of(context).textTheme.titleLarge,
         ),
         onTap: (){
          Navigator.pop(context);
         }

         
         ),
         ListTile(
         title: Text('text',
                 style: Theme.of(context).textTheme.titleLarge,
         ),
         onTap: (){
          Navigator.pop(context);
         }

         
         )
      ],),);
  }
}