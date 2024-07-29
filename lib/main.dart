import 'package:flutter/material.dart';
import 'package:shopmate/pages/cart_details.dart';
import 'package:shopmate/pages/favorite_screen.dart';
import 'package:shopmate/pages/home_screen.dart';
import 'package:shopmate/pages/profile_screen.dart';
import 'package:provider/provider.dart';
import 'package:shopmate/providers/cart_provider.dart';
import 'package:shopmate/providers/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int currentIndex=0;
  List screens= [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Organic Mantra"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=> Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> const CartScreen())
          ),
              icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value){
          setState(() {
            currentIndex= value;
          });
        },
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.black,
        items: const[
          BottomNavigationBarItem(
              label:"Home",
              icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label:"Favorite",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label:"Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
