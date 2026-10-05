import 'package:flutter_riverpod/legacy.dart';
import 'package:help_instruction_app/models/meals_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesMealsNotifier extends StateNotifier<List<MealsModel>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleMealFavouriteStatues(MealsModel meal) {
    bool isMealExist = state.contains(meal);
    if(isMealExist) 
    {
      state = state.where((element) => element.id != meal.id).toList();
      return false; 
    } 
    else 
    {
      state = [...state, meal];
      return true;
    }
  }  
}

final favoritesMealsProvider = StateNotifierProvider<FavoritesMealsNotifier, List<MealsModel>>((ref) {
  return FavoritesMealsNotifier();
});