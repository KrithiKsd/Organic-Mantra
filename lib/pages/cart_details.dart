import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shopmate/providers/cart_provider.dart';

class CartScreen extends StatefulWidget{

  const CartScreen({super.key});

  State<CartScreen> createState()=> _CartScreenState();

}

class _CartScreenState extends State<CartScreen>{

  @override
  Widget build(BuildContext context){
    final provider=CartProvider.of(context);
    final finalList = provider.cart;

    _buildProductQuality(IconData icon, int index){
      return GestureDetector(
        onTap: () {
          setState(() {
            icon== Icons.add ? provider.incrementQuantity(index)
                : provider.decrementQuantity(index);
          });
        },

        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.lightGreenAccent,
          ),
          child: Icon(
            icon,
            size: 20,
          ),
        )
      );
    }

    return  Scaffold(
      appBar: AppBar(
        title: const Text('My cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context, index){
                return Padding(padding: const EdgeInsets.all(5.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(onPressed: (context){
                          finalList.removeAt(index);
                          setState(() {});
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
                      trailing: Column(
                        children: [
                          _buildProductQuality(Icons.add, index),
                          Text(
                            '${finalList[index].quantity}',
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          _buildProductQuality(Icons.remove, index),
                        ],
                      ),
                      tileColor: Colors.grey.shade200,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${provider.getTotalPrice().toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}