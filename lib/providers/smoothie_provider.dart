import 'package:flutter/foundation.dart';
import 'package:siply/model/smothie_model.dart';

class SmoothieProvider extends ChangeNotifier {
  final List<SmoothieModel> _smoothieList = [
    SmoothieModel(
      imagePath: 'assets/Blueberry_Smoothie.png',
      name: 'Blueberry Smoothie',
      price: 14,
      rating: '4.5',
      description:
          'A vibrant mix of sweet-tangy blueberries and smooth yogurt, loaded with antioxidants to keep you sharp and fueled all day',
    ),

    SmoothieModel(
      imagePath: 'assets/StrawBerry Smoothie.png',
      name: 'Strawberry Smoothie',
      price: 15,
      rating: '4.9',
      description:
          'A refreshing blend of ripe strawberries and rich milk, packed with antioxidants and natural sweetness for the ultimate classic treat',
    ),

    SmoothieModel(
      imagePath: 'assets/Mango_Smoothie.png',
      name: 'Mango smoothie',
      price: 9,
      rating: '3.4',
      description:
          'Made with sweet, juicy mangoes blended to velvety perfection for a sunny, energizing boost packed with Vitamin C',
    ),
  ];

  final List _cartList = [];
  List get smoothieList => _smoothieList;
  List get cartList => _cartList;

  void addToCart(SmoothieModel smoothie, int selectedQuantity) {
    int index = _cartList.indexWhere((item) => item.name == smoothie.name);

    if (index != -1) {
      _cartList[index].quantity += selectedQuantity;
    } else {
      SmoothieModel cartItem = SmoothieModel(
        imagePath: smoothie.imagePath,
        name: smoothie.name,
        price: smoothie.price,
        rating: '',
        description: '',
        quantity: smoothie.quantity,
      );
      _cartList.add(cartItem);
    }
    notifyListeners();
  }

  void incrementQuantity(SmoothieModel item) {
    item.quantity++;
    notifyListeners();
  }

  void decrementQuantity(SmoothieModel item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _cartList.remove(item);
    }
    notifyListeners();
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in _cartList) {
      total += (item.price * item.quantity);
    }
    return total;
  }

  void removeFromCart(SmoothieModel smoothie) {
    if (_cartList.contains(smoothie)) {
      _cartList.remove(smoothie);
    }
    notifyListeners();
  }
}
