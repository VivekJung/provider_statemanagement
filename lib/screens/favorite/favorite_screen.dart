import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_tutorial/provider/favorite_provider.dart';
import 'package:state_management_provider_tutorial/screens/favorite/my_fav.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    log('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite app'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavItemList()));
              },
              icon: const Icon(Icons.list))
        ],
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            // writing the type of widget will provide you access to functions of that classType
            return Consumer<FavoriteItemProvider>(
              builder: (context, value, child) {
                return ListTile(
                  title: Text('Item $index'),
                  onTap: () {
                    //adding the index of the file on tap to the list
                    if (value.selectedItem.contains(index)) {
                      value.removeItems(index);
                    } else {
                      value.addItems(index);
                    }
                  },
                  trailing: Icon(
                      // checking if the selected item is in list or not and then
                      // changing the icon.
                      value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                  iconColor: Colors.blue,
                );
              },
            );
          }),
    );
  }
}
