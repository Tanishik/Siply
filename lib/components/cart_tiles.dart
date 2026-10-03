import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:siply/cubits/smoothie_cubit.dart';
import 'package:siply/model/smothie_model.dart';

class CartTiles extends StatelessWidget {
  final SmoothieModel smoothieModel;
  const CartTiles({super.key, required this.smoothieModel});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SmoothieCubit>();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade100,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 100,
              width: 100,
              child: Image.asset(
                smoothieModel.imagePath,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(width: 7),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  smoothieModel.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

                Text(
                  '\$${smoothieModel.price} x ${smoothieModel.quantity}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),

            Spacer(),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      cubit.decrementQuantity(smoothieModel);
                    },
                    icon: Icon(Icons.remove),
                  ),
                ),

                SizedBox(width: 10),

                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 42, 81, 148),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      cubit.incrementQuantity(smoothieModel);
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
