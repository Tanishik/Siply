import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siply/cubits/smoothie_state.dart';
import 'package:siply/model/smothie_model.dart';

class SmoothieCubit extends Cubit<SmoothieState>{
  SmoothieCubit():super(SmoothieState(
    cartList: [], 
    smoothieList: _initialSmoothies));

    static final List<SmoothieModel> _initialSmoothies = [

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


  void addToCart(SmoothieModel smoothie, int selectedQuantity) {
    final currentCart = List<SmoothieModel>.from(state.cartList);
    

    int index = currentCart.indexWhere((item) => item.name == smoothie.name);

    if (index != -1) {
      currentCart[index].quantity += selectedQuantity;
    } else {
      SmoothieModel cartItem = SmoothieModel(
        imagePath: smoothie.imagePath,
        name: smoothie.name,
        price: smoothie.price,
        rating: '',
        description: '',
        quantity: selectedQuantity, // using passed parameter
      );
      currentCart.add(cartItem);
    }

 
    emit(state.copyWith(cartList: currentCart));
  }


  void incrementQuantity(SmoothieModel item) {
    final currentCart = List<SmoothieModel>.from(state.cartList);
    
    item.quantity++;

    emit(state.copyWith(cartList: currentCart));
  }


  void decrementQuantity(SmoothieModel item) {
    final currentCart = List<SmoothieModel>.from(state.cartList);

    if (item.quantity > 1) {
      item.quantity--;
    } else {
      currentCart.remove(item);
    }

    emit(state.copyWith(cartList: currentCart));
  }


  double calculateTotal() {
    double total = 0;
    for (var item in state.cartList) {
      total += item.price * item.quantity;
    }
    return total;
  }
}




