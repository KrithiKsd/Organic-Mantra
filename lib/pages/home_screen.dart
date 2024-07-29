import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopmate/models/MyProducts.dart';
import 'package:shopmate/pages/details_screen.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({super.key});

  State<HomeScreen> createState()=> _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{

  int isSelected= 0;

  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      const Text("Products",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProductCategory(index: 0, name:"All Products"),
            _buildProductCategory(index: 1, name:"Vegetables"),
            _buildProductCategory(index: 2, name:"Fruits"),
          ]

        ),
       /* Container(
          margin: EdgeInsets.only(top: 20),
        ),*/
        const SizedBox(height: 20),
        Expanded(
            child:  isSelected==0
                ? _buildAllProducts()
                : isSelected == 1
                ? _buildVegetables()
                : _buildVFruits(),
        ),

      ],
    )
    );

  }


  _buildProductCategory({required int index, required String name})=>
      GestureDetector(
          onTap: ()=> setState(() => isSelected = index),
          child:
      Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.only(top:10, right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected== index? Colors.lightGreen: Colors.grey,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
      )
      );
  

  _buildAllProducts() =>  // Adjust the top margin value as needed
    GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (100 / 140),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        scrollDirection: Axis.vertical,
        itemCount: MyProducts.allProducts.length,
        itemBuilder: (context, index) {
          final allProducts = MyProducts.allProducts[index];
          return
          GestureDetector(
            onTap: ()=> Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsScreen(product: allProducts)
            ),
            ),
            child: ProductCard(product: allProducts),
          );
        },
  );


  _buildVegetables()=>  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.vegList.length,
      itemBuilder: (context, index) {
        final vegetables = MyProducts.vegList[index];
        return 
          GestureDetector(
            onTap: ()=> Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsScreen(product: vegetables)
                )
            ),
            child: ProductCard(product: vegetables),
          );
          
      },
  );


  _buildVFruits()=>
    GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.fruitList.length,
      itemBuilder: (context, index) {
        final fruits = MyProducts.fruitList[index];
        return GestureDetector(
          onTap: ()=>Navigator.push((context),
              MaterialPageRoute(builder: (context) => DetailsScreen(product: fruits)
              )
          ),
          child: ProductCard(product: fruits),
        );
      },
  );

}