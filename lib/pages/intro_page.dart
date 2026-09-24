import 'package:flutter/material.dart';

import 'navigation_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(height: 50),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Siply",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100),
                ),
                Row(
                  children: [
                    SizedBox(width: 50),

                    Text(
                      "Taste the Difference",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30),

            SizedBox(height: 400, child: Image.asset("assets/BlueBerry.png")),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Fresh, juicy fruits and smoothies ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),

                Text(
                  "blended to perfection for your daily power boost ",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),

            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 42, 81, 148),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavigationPage(),
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
