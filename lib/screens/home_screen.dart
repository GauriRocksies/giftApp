import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: const Color(0xFFE1F0F4),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //const SizedBox(height: 10),

          // const Text(
          //   "HOME",
          //   style: TextStyle(
          //     fontSize: 14,
          //     color: Colors.black45,
          //     letterSpacing: 1,
          //   ),
          // ),
          // const SizedBox(height: 20),
          Container(
            height: screenHeight * 0.65,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              //color: const Color(0xFF79DCF2),
              borderRadius: BorderRadius.circular(100),
            ),

            child: buildImage("assets/doodle1.jpg"),
          ),
          const SizedBox(height: 30),
          const Text(
            "I know I know I am too good to be real",
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
          const Spacer(),

          Align(
            alignment: Alignment.bottomRight,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/store');
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1,
                    vertical: 32,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFF037F8C),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Click me for your gift",
                        style: TextStyle(
                          color: Color(0xFFF28627),
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.card_giftcard,
                        color: Color(0xFFF28627),
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildImage(String path) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(50), // match your container radius
    child: SizedBox(
      height: 300,
      width: double.infinity,
      child: Image.asset(path, fit: BoxFit.cover),
    ),
  );
}
