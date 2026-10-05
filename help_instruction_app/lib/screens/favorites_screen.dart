import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:help_instruction_app/models/meals_model.dart';
import 'package:help_instruction_app/providers/favorites_provider.dart';
import 'package:help_instruction_app/screens/meals_details_screen.dart';
import 'package:help_instruction_app/widgets/item_trait.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MealsModel> favoritesMeals = ref.watch(favoritesMealsProvider);
    return Scaffold(
      appBar: AppBar( 
        title: const Text(
          'My Favorites',
          style: TextStyle( 
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: favoritesMeals.isEmpty? Center(
        child: Text('No favorite meals found.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
      ): ListView.builder(
        itemCount: favoritesMeals.length,
        itemBuilder: (context, index){
          return Card(
            clipBehavior: Clip.hardEdge,
            elevation: 2,
            child: Stack(
              children: [ 
                 InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailsScreen(mealsDetails: favoritesMeals[index])));
                  },
                  child: Container( 
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(favoritesMeals[index].imageUrl),
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
                        Text(favoritesMeals[index].title, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ItemTrait(title: favoritesMeals[index].affordability.name, featureIcon: Icons.attach_money),
                            SizedBox(width: 8,),
                            ItemTrait(title: favoritesMeals[index].complexity.name, featureIcon: Icons.timer),
                            SizedBox(width: 8,),
                            ItemTrait(title: favoritesMeals[index].duration.toString() + ' min', featureIcon: Icons.access_time),
                          ],
                        ),],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}