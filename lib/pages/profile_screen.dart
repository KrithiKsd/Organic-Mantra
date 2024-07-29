import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget{

  const ProfileScreen({super.key});

  State<ProfileScreen> createState()=> _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen>{

  Widget build(BuildContext context){
    return const Scaffold(
      body: Center(child: Text("Profile Screen"),),
    );
  }
}