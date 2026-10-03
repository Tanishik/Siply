import 'package:siply/model/smothie_model.dart';

class SmoothieState {
  final List<SmoothieModel> smoothieList;
  final List<SmoothieModel>cartList;

  SmoothieState({
    required this.cartList,
    required this.smoothieList
  });

  SmoothieState copyWith({
    List<SmoothieModel>? smoothieList,
    List<SmoothieModel>? cartList
  }){
    return SmoothieState(
      cartList: cartList ?? this.cartList, 
      smoothieList: smoothieList ?? this.smoothieList
    );
  }
}