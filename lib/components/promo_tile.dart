import 'package:flutter/material.dart';

class PromoTile extends StatelessWidget {
  const PromoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(50),
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100, child: Image.asset('assets/Strawberry.png')),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "PURE FLAVOR ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 42, 81, 148),
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text("IN EVERY SIP", style: TextStyle(fontSize: 15)),
                ),

                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
