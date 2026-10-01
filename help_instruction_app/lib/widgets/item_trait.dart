
import 'package:flutter/material.dart';

class ItemTrait extends StatelessWidget{
  final String title;
  final IconData featureIcon;
  const ItemTrait({required this.title, required this.featureIcon, super.key});

  @override
  Widget build(BuildContext constext){
    return 
        Padding(
          padding: EdgeInsetsGeometry.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(featureIcon, size: 23, color: Colors.white,),
              SizedBox(width: 5,),
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),), 
        ],), 
    );
  } 
}