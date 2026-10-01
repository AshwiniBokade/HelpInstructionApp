import 'package:flutter/material.dart';
import 'package:help_instruction_app/data/meals_data.dart';
import 'package:help_instruction_app/models/category_model.dart';
import 'package:help_instruction_app/models/meals_model.dart';
import 'package:help_instruction_app/screens/meals_details_screen.dart';
import 'package:help_instruction_app/widgets/item_trait.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({required this.category, super.key});
  final CategoryModel category;


  @override
  Widget build(BuildContext context) {
    List<MealsModel> mealsList = meals.where((meal) => meal.categories.contains(category.id)).toList(); 
    return Scaffold(
      appBar: AppBar( 
        title: Text(
          category.title,
          style: TextStyle( 
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: mealsList.length,
        itemBuilder: (context, index){
          return Card(
            clipBehavior: Clip.hardEdge,
            elevation: 2,
            child: Stack(
              children: [ 
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailsScreen(mealsDetails: mealsList[index])));
                  },
                  child: Container( 
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(mealsList[index].imageUrl),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(mealsList[index].title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ItemTrait(title: mealsList[index].affordability.name, featureIcon: Icons.attach_money),
                            SizedBox(width: 8,),
                            ItemTrait(title: mealsList[index].complexity.name, featureIcon: Icons.timer),
                            SizedBox(width: 8,),
                            ItemTrait(title: mealsList[index].duration.toString() + ' min', featureIcon: Icons.access_time),
                          ],
                        ),],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ) 
    );
  }
}