import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/meal_provider.dart';

enum Filter {
  glutenFree,
  vegan,
  vegetarian,
  lactoseFree,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false,
          Filter.lactoseFree: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider);
  final filters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (filters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    if (filters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    return true;
  }).toList();
});
