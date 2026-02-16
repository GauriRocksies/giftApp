import 'package:flutter/material.dart';

class AngryScreen extends StatefulWidget {
  const AngryScreen({super.key});

  @override
  State<AngryScreen> createState() => _AngryScreenState();
}

class _AngryScreenState extends State<AngryScreen> {
  int angerLevel = 5;
  bool unlocked = false;

  void _smash() {
    if (angerLevel > 0) {
      setState(() {
        angerLevel--;
      });

      if (angerLevel == 0) {
        setState(() {
          unlocked = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2B705),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, '/angry'),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Before You Break Something",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 25),

              const Text("😭", style: TextStyle(fontSize: 70)),

              const SizedBox(height: 25),

              // Anger Meter
              LinearProgressIndicator(
                value: angerLevel / 5,
                minHeight: 15,
                backgroundColor: Colors.grey[300],
                color: angerLevel > 3
                    ? Colors.red
                    : angerLevel > 1
                    ? Colors.orange
                    : Colors.green,
              ),

              const SizedBox(height: 10),

              Text(
                "Counts till calm: $angerLevel",
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 40),

              // Smash Button
              GestureDetector(
                onTap: _smash,
                child: Container(
                  height: 160,
                  width: 160,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      "SMASH",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Unlock Message Below (Scrollable naturally)
              if (unlocked) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.teal[800],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Okay breathe.\n\n"
                        "Is it me? You said you can’t stay mad at me.\n\n"
                        "In case its me, I wont say I am sorry but I am sure there has been some misunderstanding because I am such an angel man, how can you be angry on meee!!\n\n"
                        "Jokes apart, I am sorry for whatever pissed you off. Please don’t stay angry sweetheart. And if it’s not me (Which probably is the case), try to keep your head calm 🍯, maybe talk to your Moi? Or maybe that might piss you off more but still, its worth a try right?\n\n And if you’re still mad… here’s a picture of your favourite person just chilling.\n\n",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          "assets/img7.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Still mad at this face? 🤨",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 60),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
