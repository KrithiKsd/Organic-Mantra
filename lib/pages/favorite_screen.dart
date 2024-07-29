import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopmate/providers/favorite_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget{

  const FavoriteScreen({super.key});

  State<FavoriteScreen> createState()=> _FavoriteScreenState();

}

class _FavoriteScreenState extends State<FavoriteScreen>{

  @override
  Widget build(BuildContext context){
    final provider= FavoriteProvider.of(context);
    final finalList = provider.favorites;

    return  Scaffold(
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: const [
              Text(
                "Favorites",
              style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold),
              ),
            ],
          ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index){
                return Padding(padding: EdgeInsets.all(10.0),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(onPressed: (context){
                        finalList.removeAt(index);
                        setState(() {

                        });
                      },
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(finalList[index].name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle: Text(
                      finalList[index].description,
                      overflow: TextOverflow.ellipsis,
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(finalList[index].image),
                      backgroundColor: Colors.lightGreen.shade100,
                    ),
                    trailing: Text(
                      '\$${finalList[index].price}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    tileColor: Colors.grey.shade200,
                  ),
                ),
                );
              },
              ),
          ),
        ],
      )
    );
  }
}