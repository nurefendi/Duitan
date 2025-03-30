class Category {
  int? id;
  String name;
  String type; // "income" atau "expense"

  Category({this.id, required this.name, required this.type});

  // Convert object ke Map untuk disimpan ke database
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }

  // Convert Map dari database ke object Category
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      type: map['type'],
    );
  }
}
