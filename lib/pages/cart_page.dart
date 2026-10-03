import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siply/components/cart_tiles.dart';
import 'package:siply/cubits/smoothie_cubit.dart';
import 'package:siply/cubits/smoothie_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmoothieCubit, SmoothieState>(
      builder: (context, state) {
        final cubit = context.read<SmoothieCubit>();

        if (state.cartList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '∘ ∘ ∘ ( °ヮ° ) ?',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 42, 81, 148),
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.cartList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: CartTiles(smoothieModel: state.cartList[index]),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 42, 81, 148),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TO BE PAID",
                              style: TextStyle(color: Colors.white),
                            ),

                            Text(
                              '\$${cubit.calculateTotal().toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Spacer(),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),

                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 35,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }
}
