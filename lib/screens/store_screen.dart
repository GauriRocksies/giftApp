import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFEABA),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          //padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //const SizedBox(height: 20),

              //back button and header title
              Row(
                children: [
                  //const Spacer(),
                  Container(
                    height: 120,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Color(0xFFF28627),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(300),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 16,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.pop(context, '/');
                            },
                          ),
                        ),

                        Text(
                          " YOUR GIFT STORE",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "More Coming (if you behave)",
                style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 40),

              //grid buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 25,
                  children: [
                    builGiftCard(
                      context,
                      "Open me if it's your BIRTHDAY!",
                      const Color(0xFF037F8C),
                      Color(0xFFFFEABA),
                      () {
                        Navigator.pushNamed(context, '/bday');
                      },
                    ),

                    builGiftCard(
                      context,
                      "Open me when the world feels heavy!",
                      const Color(0xFF037F8C),
                      Color(0xFFFFEABA),
                      () {
                        Navigator.pushNamed(context, '/motivation');
                      },
                    ),
                    builGiftCard(
                      context,
                      "Open me if you are sad :(",
                      const Color(0xFF79DCF2),
                      Color(0xFF07565F),
                      () {
                        Navigator.pushNamed(context, '/sad');
                      },
                    ),
                    builGiftCard(
                      context,
                      "Open me if Moi pissed you off!",
                      const Color(0xFF79DCF2),
                      Color(0xFF07565F),
                      () {
                        Navigator.pushNamed(context, '/pissed');
                      },
                    ),
                    builGiftCard(
                      context,
                      "Open me when you miss Moi",
                      const Color(0xFFF2B705),
                      Color(0xFF874308),
                      () {
                        Navigator.pushNamed(context, '/miss');
                      },
                    ),
                    builGiftCard(
                      context,
                      "Open me if you are lonely",
                      const Color(0xFFF2B705),
                      Color(0xFF874308),
                      () {
                        Navigator.pushNamed(context, '/lonely');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget builGiftCard(
  BuildContext context,
  String text,
  Color bgcolor,
  Color textcolor,
  VoidCallback onTap,
) {
  final screenWidth = MediaQuery.of(context).size.width;

  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Ink(
        width: (screenWidth - 60) / 2,
        height: 140,
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          text,

          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textcolor,
          ),
        ),
      ),
    ),
  );
}
