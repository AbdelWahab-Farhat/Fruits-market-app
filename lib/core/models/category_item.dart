import 'package:fresh_fruits/core/models/item.dart';
import 'package:uuid/uuid.dart';

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
  static List<Item> itemList = [
    // Fruits
    Item(
        ID: const Uuid().v8(),
        name: 'Apple',
        imageURL: 'https://static.vecteezy.com/system/resources/previews/030/682/970/large_2x/apples-high-quality-4k-hdr-free-photo.jpg',
        category: allItems[0],
        price: 1.2,
        rate: 4.8,
        reviews: 120),
    Item(
        ID: const Uuid().v8(),
        name: 'Banana',
        imageURL: 'https://static.vecteezy.com/system/resources/previews/030/683/209/large_2x/bananas-high-quality-4k-hdr-free-photo.jpg',
        category: allItems[0],
        price: 0.8,
        rate: 4.7,
        reviews: 95),
    Item(
        ID: const Uuid().v8(),
        name: 'Orange',
        imageURL: 'https://static.vecteezy.com/system/resources/previews/030/671/747/non_2x/orange-background-high-quality-free-photo.jpg',
        category: allItems[0],
        price: 1.0,
        rate: 4.5,
        reviews: 80),

    // Vegetables
    Item(
        ID: const Uuid().v8(),
        name: 'Carrot',
        imageURL: 'https://png.pngtree.com/thumb_back/fw800/background/20230811/pngtree-healthy-raw-carrots-image_13040473.jpg',
        category: allItems[1],
        price: 0.5,
        rate: 4.6,
        reviews: 150),
    Item(
        ID: const Uuid().v8(),
        name: 'Broccoli',
        imageURL: 'https://image.made-in-china.com/2f0j00ezPGVTfSjErR/High-Quality-Fresh-Broccoli-IQF-Broccoli-Frozen-Broccoli.webp',
        category: allItems[1],
        price: 1.5,
        rate: 4.7,
        reviews: 85),
    Item(
        ID: const Uuid().v8(),
        name: 'Spinach',
        imageURL: 'https://www.photos-public-domain.com/wp-content/uploads/2012/03/spinach.jpg',
        category: allItems[1],
        price: 0.9,
        rate: 4.4,
        reviews: 60),

    // Mushroom
    Item(
        ID: const Uuid().v8(),
        name: 'Button Mushroom',
        imageURL: 'https://www.shutterstock.com/image-photo/high-quality-french-cave-organic-600nw-2434399131.jpg',
        category: allItems[2],
        price: 2.0,
        rate: 4.8,
        reviews: 45),
    Item(
        ID: const Uuid().v8(),
        name: 'Shiitake Mushroom',
        imageURL: 'https://grocycle.com/wp-content/uploads/2021/01/dreamstime_m_10638987.jpg',
        category: allItems[2],
        price: 3.0,
        rate: 4.9,
        reviews: 30),
    Item(
        ID: const Uuid().v8(),
        name: 'Oyster Mushroom',
        imageURL: 'https://cdn.dotpe.in/longtail/store-items/7193447/t1yVemzM.jpeg',
        category: allItems[2],
        price: 2.5,
        rate: 4.7,
        reviews: 40),

    // Dairy
    Item(
        ID: const Uuid().v8(),
        name: 'Milk',
        imageURL: 'https://bcdairy.ca/wp-content/uploads/2021/08/dairy-products-747.jpg',
        category: allItems[3],
        price: 1.3,
        rate: 4.6,
        reviews: 110),
    Item(
        ID: const Uuid().v8(),
        name: 'Cheese',
        imageURL: 'https://images.squarespace-cdn.com/content/v1/62e7a92f066fa3730dcd4604/2687a11c-be68-459f-b9ab-a1d4faf301df/v2-709n4-hlfmz.jpg',
        category: allItems[3],
        price: 2.5,
        rate: 4.8,
        reviews: 70),
    Item(
        ID: const Uuid().v8(),
        name: 'Yogurt',
        imageURL: 'https://goodeggs4.imgix.net/930e87d3-da3b-487b-84fd-a772284c78c8.jpg?w=840&h=525&fm=jpg&q=80&fit=crop',
        category: allItems[3],
        price: 0.9,
        rate: 4.5,
        reviews: 90),

    // Bread
    Item(
        ID: const Uuid().v8(),
        name: 'Whole Wheat Bread',
        imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-qzyE7KF1kM_GGDsAAwLS78dkoWMRtAW3gA&s',
        category: allItems[4],
        price: 1.0,
        rate: 4.7,
        reviews: 130),
    Item(
        ID: const Uuid().v8(),
        name: 'Baguette',
        imageURL: 'https://i0.wp.com/happymonkbaking.com/wp-content/uploads/2021/04/baguettes.png?fit=611%2C606&ssl=1',
        category: allItems[4],
        price: 1.2,
        rate: 4.6,
        reviews: 75),

    // Rice
    Item(
        ID: const Uuid().v8(),
        name: 'Basmati Rice',
        imageURL: 'https://m.media-amazon.com/images/I/81rolu0+kcL.jpg',
        category: allItems[5],
        price: 1.8,
        rate: 4.8,
        reviews: 100),
  ];
}
