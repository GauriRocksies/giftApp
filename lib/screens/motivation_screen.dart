import 'package:flutter/material.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({super.key});

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F5C5C),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),

            // Back Button
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            const SizedBox(height: 10),

            // Letter Section
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1AA3A3),
                  border: Border.all(color: const Color(0xFF1976D2), width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Text(
                        "If the world feels heavier than it should, pause for a second.\n\n"
                        "Maybe everything seems heavy, maybe nothing seems under your control — but sweetheart, I know you will manage it just fine. You are my strong man.\n\n"
                        "Away from home, away from land, away from everyone you love — it takes courage to live like this. You inspire me every day. And if you can handle me, you can handle everything.\n\n",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: 20),

                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image(
                          image: AssetImage("assets/img6.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        "Always proud of you. Always here.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
