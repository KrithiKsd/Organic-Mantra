import 'package:flutter/material.dart';
import 'package:shopmate/models/product.dart';
import 'package:shopmate/providers/cart_provider.dart';

import 'package:shopmate/widgets/available_size.dart';

import 'cart_details.dart';

class DetailsScreen extends StatelessWidget{

  final Product product;

  const DetailsScreen({super.key, required this.product});


  @override
  Widget build(BuildContext context){
   final provider = CartProvider.of(context);
    return  Scaffold(
     appBar: AppBar(
       title: const Text("Details"),
       centerTitle: true,
     ),
      body: Column(
        children: [
          const SizedBox(height: 36),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
             children: [Container(
                width: 350,
                height: 220,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.lightGreenAccent,
                ),
                child: Image.asset(product.image,
                    height: 200,
                    fit: BoxFit.scaleDown),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              )
            ),
            child: Column(
              children: [
                Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name.toUpperCase(),
                      style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      '\$' '${product.price}',
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                ]
                ),
                const SizedBox(height: 14),
                Text(product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              const SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                      Text("Available Quantity",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                ),
                const SizedBox(height: 14),
                Row(
                  children: const [
                    AvailableSize(size: "1 lb"),
                    AvailableSize(size: "2 lb"),
                    AvailableSize(size: "3 lb"),
                    AvailableSize(size: "4 lb"),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:const [
                      Text("How do you want your item?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                ),
                const SizedBox(height: 14),
                Row(
                  children: const [
                    AvailableSize(size: "Pickup"),
                    AvailableSize(size: "Delivery"),
                  ],
                ),
              ],
            ),
          )
      ],
      ),
      bottomSheet: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          width: double.infinity,
          height: MediaQuery.of(context).size.height/10,
          decoration: const BoxDecoration(
            color: Colors.lightGreenAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$" "${product.price}",
                style: const TextStyle(
                  fontSize: 34,
                   fontWeight: FontWeight.bold
                ),
              ),
              ElevatedButton.icon(onPressed: (){
                provider.toggleProduct(product);
                Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                const CartScreen(),
                ),
                );
              },
                  icon: const Icon(Icons.send),
                  label: const Text("Add to cart"),
              )
            ],
          ),
        ),
      ),
    );
  }
}