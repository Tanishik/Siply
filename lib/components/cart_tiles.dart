import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:siply/model/smothie_model.dart';
import 'package:siply/providers/smoothie_provider.dart';

class CartTiles extends StatefulWidget {
  final SmoothieModel _smoothieModel;
  const CartTiles({super.key, required this._smoothieModel});

  @override
  State<CartTiles> createState() => _CartTilesState();
}

class _CartTilesState extends State<CartTiles> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SmoothieProvider>(
      builder: (context, value, child) {
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
                    widget._smoothieModel.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(width: 7),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget._smoothieModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                    Text(
                      '\$${widget._smoothieModel.price} x ${widget._smoothieModel.quantity}',
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
                          setState(() {
                            value.decrementQuantity(widget._smoothieModel);
                          });
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
                          setState(() {
                            value.incrementQuantity(widget._smoothieModel);
                          });
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
      },
    );
  }
}
