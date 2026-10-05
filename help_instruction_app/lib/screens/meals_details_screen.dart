import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:help_instruction_app/models/meals_model.dart';
import 'package:help_instruction_app/providers/favorites_provider.dart';


class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({required this.mealsDetails, super.key});
  final MealsModel mealsDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    final List<MealsModel> favoritesMeals = ref.watch(favoritesMealsProvider);

    bool isFavorite = favoritesMeals.contains(mealsDetails);

    return Scaffold(
      appBar: AppBar( 
        title: Text(
          mealsDetails.title,
          style: TextStyle( 
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              // Handle favorite button press
              ref.read(favoritesMealsProvider.notifier).toggleMealFavouriteStatues(mealsDetails);


              // Show a snackbar to indicate the change
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(isFavorite ? 'Removed from favorites' : 'Added to favorites'),
                  duration: Duration(seconds: 2),
                  //behavior: SnackBarBehavior.floating,
                  backgroundColor: isFavorite ? Colors.red[800]: Colors.green[800], 
                ),
              );
            },

            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.redAccent : Colors.white,),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(mealsDetails.imageUrl, fit: BoxFit.cover,),
            ),
            Container(
              padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text('Ingredients', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pinkAccent),),
                  SizedBox(height: 10,),
                  // Ingredients List
                  for(var ingredient in mealsDetails.ingredients) 
                    Row( 
                      children: [  
                        Icon(Icons.circle, size: 8, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text(ingredient, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),), 
                      ],), 
                  SizedBox(height: 10,),
                  Text('Steps', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pinkAccent),),
                  SizedBox(height: 10,),
                  // Steps List
                  for(var index = 0; index < mealsDetails.steps.length; index++)
                  Row( 
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [  
                    Text('${index + 1}.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),), 
                        SizedBox(width: 5,),
                    Expanded(
                      child: Text(mealsDetails.steps[index], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                    ),
                      ],), 
                ],
              ),
            ), 
          ],
        ),
      ), 
      );
  }
}