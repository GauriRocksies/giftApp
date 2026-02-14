import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BdayScreen extends StatelessWidget {
  const BdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 253, 253, 253),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 📰 Newspaper Title
                    Center(
                      child: Text(
                        "The Birthday Post",
                        style: GoogleFonts.unifrakturCook(fontSize: 42),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Saga Tucano, SEA",
                          style: GoogleFonts.playfairDisplay(fontSize: 14),
                        ),
                        Text(
                          "18 February 2026",
                          style: GoogleFonts.playfairDisplay(fontSize: 14),
                        ),
                      ],
                    ),

                    const Divider(thickness: 2.2),
                    const SizedBox(height: 30),

                    // 🎉 Headline
                    Center(
                      child: Text(
                        "HAPPY BIRTHDAY",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        "To my favourite sailor",
                        style: GoogleFonts.greatVibes(fontSize: 42),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // 📱 RESPONSIVE CONTENT
                    LayoutBuilder(
                      builder: (context, constraints) {
                        bool isMobile = constraints.maxWidth < 700;

                        return Column(
                          children: [
                            // First Section
                            isMobile
                                ? Column(
                                    children: [
                                      buildImage("assets/raja1.jpeg"),
                                      const SizedBox(height: 20),
                                      buildParagraph(
                                        "YOUR 29TH BIRTHDAY ❤\n\n"
                                        "You are getting old but it's okay(I guess)..."
                                        " You know you are the oldest among all my friends (T_T),"
                                        "but don't worry, even if you become 60, I would still like you as much as I like you now, irritate you as much,maybe more and keep coming back to you always.",
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: buildImage("assets/raja1.jpeg"),
                                      ),
                                      const SizedBox(width: 30),
                                      Expanded(
                                        child: buildParagraph(
                                          "YOUR 29TH BIRTHDAY ❤\n\n"
                                          "You are getting old but it's okay(I guess)..."
                                          " You know you are the oldest among all my friends (T_T),"
                                          "but don't worry, even if you become 60, I would still like you as much as I like you now, irritate you as much,maybe more and keep coming back to you always.",
                                        ),
                                      ),
                                    ],
                                  ),

                            const SizedBox(height: 30),

                            // Second Section
                            isMobile
                                ? Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      buildImage("assets/raja2.jpeg"),
                                      buildParagraph(
                                        "I might have known you for some 4 months now but you have become an integral part of my days,probably my life.No matter what I say and how much I say, just remember you are important to me.\n\n"
                                        "You make my life happier just by being in it. Wishing you love and happiness always sweetheart. I wish your every dream gets fulfilled and every moment of your life turns out just how you want it to be.\n\n"
                                        "❤",
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: buildParagraph(
                                          "I might have known you for some 4 months now but you have become an integral part of my days,probably my life.No matter what I say and how much I say, just remember you are important to me.\n\n"
                                          "You make my life happier just by being in it. Wishing you love and happiness always sweetheart. I wish your every dream gets fulfilled and every moment of your life turns out just how you want it to be.\n\n"
                                          "❤",
                                        ),
                                      ),
                                      const SizedBox(width: 30),
                                      Expanded(
                                        child: buildImage("assets/raja2.jpeg"),
                                      ),
                                    ],
                                  ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 50),
                    const Divider(thickness: 1.5),

                    Center(
                      child: Text(
                        "HAPPY BIRTHDAY",
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 26,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.asset(path, fit: BoxFit.cover),
    );
  }

  Widget buildParagraph(String text) {
    return Text(
      text,
      style: GoogleFonts.playfairDisplay(fontSize: 18, height: 1.7),
    );
  }
}
