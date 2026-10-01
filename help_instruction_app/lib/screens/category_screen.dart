import 'package:flutter/material.dart';
import 'package:help_instruction_app/data/category_data.dart';
import 'package:help_instruction_app/screens/meals_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text(
          'Category',
          style: TextStyle( 
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
        children:  
         List.generate(categories.length, (index){
              return  InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MealScreen(category: categories[index])));
                },
                child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(colors: [
                    categories[index].color.withOpacity(0.55),
                    categories[index].color.withOpacity(0.9),
                  ], 
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                  )
                ), 
                child: Text(categories[index].title, style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              );
         })  
         ,),
      
    );
  }
}
