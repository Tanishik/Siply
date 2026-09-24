class SmoothieModel {
  final String name;
  final String  imagePath;
  final int price;
  final String rating;
  final String description;
  int quantity;

  SmoothieModel({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
    this.quantity = 1
  });

}