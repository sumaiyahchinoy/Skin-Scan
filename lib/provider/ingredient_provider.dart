import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:skin_scan/entities/ingredient_entities.dart';
import '../models/ingredient_model.dart';

class IngredientProvider extends ChangeNotifier {

  List<Ingredient> ingredientList = [];

  Future getIngredientInfo(String findIngredient) async {
    String modifiedIngredient = titleCase(findIngredient);

    String collectionName = findIngredient.substring(0,1).toLowerCase() + "_ingredient";

    await FirebaseFirestore.instance
        .collection(collectionName)
        .limit(1)
        .where('name', whereIn: [findIngredient.toLowerCase(),findIngredient.toUpperCase(),modifiedIngredient.trim(),findIngredient])
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        IngredientModel ingredientModel =
        IngredientModel.fromJson(doc.data() as Map<String, dynamic>);
        Ingredient ingredient = Ingredient(
            ingredientName: ingredientModel.ingredientName,
            ingredientRating: ingredientModel.ingredientRating,
            ingredientCategory: ingredientModel.ingredientCategory,
            ingredientDescription: ingredientModel.ingredientDescription
        );
        ingredientList.add(ingredient);
      });
    });
    notifyListeners();
  }

  String titleCase(String ingredient){
    String changeIngredient = "";
    List<String> arr = ingredient.split(" ");
    for(var word in arr){

      if(word.length>2){
        changeIngredient = changeIngredient + word.substring(0,1).toUpperCase();
        changeIngredient = changeIngredient + word.substring(1) + " " ;
      }
    }
    return changeIngredient;
  }

}