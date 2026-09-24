import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:siply/model/smothie_model.dart';
import 'package:siply/providers/smoothie_provider.dart';

class SmoothieDetailsPage extends StatefulWidget {
  final SmoothieModel _smoothieModel;
  const SmoothieDetailsPage({super.key, required this._smoothieModel});

  @override
  State<SmoothieDetailsPage> createState() => _SmoothieDetailsPageState();
}

int _quantity = 1;

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(
        "Added To Cart!",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
    ),
  );
}

class _SmoothieDetailsPageState extends State<SmoothieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    int subTotal = widget._smoothieModel.price * widget._smoothieModel.quantity;

    return Consumer<SmoothieProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 230,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero,
                  ),
                  color: Colors.white,
                ),
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),

                Image.asset(widget._smoothieModel.imagePath, height: 400),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget._smoothieModel.name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber),

                          Text(
                            widget._smoothieModel.rating,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
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

                      Text(
                        widget._smoothieModel.quantity.toString(),
                        style: TextStyle(fontSize: 30),
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

                      Spacer(),

                      Text('\$$subTotal.00', style: TextStyle(fontSize: 30)),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    widget._smoothieModel.description,
                    style: TextStyle(fontSize: 15),
                  ),
                ),

                Spacer(),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SlideAction(
                    elevation: 0,
                    borderRadius: 50,
                    // ignore: body_might_complete_normally_nullable
                    onSubmit: () {
                      value.addToCart(widget._smoothieModel, _quantity);
                      
                      setState(() {
                        widget._smoothieModel.quantity = 1;
                      });

                      showAlertDialog(context);
                    },
                    outerColor: const Color.fromARGB(255, 42, 81, 148),
                    text: 'Add to Cart',
                    sliderButtonIconSize: 25,
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
