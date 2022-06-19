import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider_tutorial/provider/favorite_provider.dart';
import 'package:state_management_provider_tutorial/screens/favorite/detail_screen.dart';

class MyFavItemList extends StatefulWidget {
  const MyFavItemList({Key? key}) : super(key: key);

  @override
  State<MyFavItemList> createState() => _MyFavItemListState();
}

class _MyFavItemListState extends State<MyFavItemList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteItemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My fav list"),
      ),
      body: ListView.builder(
          itemCount: provider.selectedItem.length,
          itemBuilder: (context, index) {
            // writing the type of widget will provide you access to functions of that classType
            return Consumer<FavoriteItemProvider>(
              builder: (context, value, child) {
                return ListTile(
                  title: Text('Fav Item $index'),
                  onTap: () {
                    //adding the index of the file on tap to the list
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(data: index)));
                    // if (value.selectedItem.contains(index)) {
                    //   value.removeItems(index);
                    // }
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
