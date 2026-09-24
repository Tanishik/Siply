import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siply/components/cart_tiles.dart';
import 'package:siply/providers/smoothie_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SmoothieProvider>(
      builder: (context, value, child) {
        if (value.cartList.isEmpty) {
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
                  itemCount: value.cartList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: CartTiles(smoothieModel: value.cartList[index]),
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
                  child: Expanded(
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
                                '\$${value.calculateTotal().toStringAsFixed(2)}',
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
              ),

              SizedBox(height: 80),
            ],
          ),
        );
      },
    );
  }
}
