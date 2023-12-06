
class Food {
    final List<Dish> dishes;

    Food({
        required this.dishes,
    });

    factory Food.fromJson(Map<String, dynamic> json) => Food(
        dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "dishes": List<dynamic>.from(dishes.map((x) => x.toJson())),
    };
}

class Dish {
    final String id;
    final String name;
    final String caloric;
    final String type;
    final String fat;
    final String carbon;
    final String protein;
    final String categoryId;

    Dish({
        required this.id,
        required this.name,
        required this.caloric,
        required this.type,
        required this.fat,
        required this.carbon,
        required this.protein,
        required this.categoryId,
    });

    factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        id: json["id"],
        name: json["name"],
        caloric: json["caloric"],
        type: json["type"],
        fat: json["fat"],
        carbon: json["carbon"],
        protein: json["protein"],
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "caloric": caloric,
        "type": type,
        "fat": fat,
        "carbon": carbon,
        "protein": protein,
        "category_id": categoryId,
    };
}
