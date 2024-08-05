class CategoryItem {
  final String name;
  final String imageUrl;

  const CategoryItem(this.name, this.imageUrl);

  // Convert the class instance to a JSON map
  Map<String, dynamic> toJson() => {
    'name': name,
    'imageUrl': imageUrl,
  };

  // Convert a JSON map back to the class instance
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      json['name'] as String,
      json['imageUrl'] as String,
    );
  }

  // List of all items
  static const List<CategoryItem> allItems = [
    CategoryItem('fruits', 'lib/assets/icons/fruits-icon.svg'),
    CategoryItem('vegetables', 'lib/assets/icons/vegetables-icon.svg'),
    CategoryItem('mushroom', 'lib/assets/icons/mushrooms-icon.svg'),
    CategoryItem('dairy', 'lib/assets/icons/dairy-icon.svg'),
    CategoryItem('bread', 'lib/assets/icons/bread-icon.svg'),
    CategoryItem('rice', 'lib/assets/icons/rice-icon.svg'),
  ];
}