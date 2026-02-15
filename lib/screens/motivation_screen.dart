import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({super.key});

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _player.setLoopMode(LoopMode.one);
      await _player.setAsset('music/lag_ja_gale.mp3');
      await _player.play();
      setState(() {
        isPlaying = true;
      });
    } catch (e) {
      print("Audio failed: $e");
    }
  }

  Future<void> _togglePlay() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      await _player.play();
    }

    setState(() {
      isPlaying = _player.playing;
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

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

            // Scrollable Letter + Image
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
                    children: [
                      const Text(
                        "If the world feels heavier than it should, pause for a second.\n\n"
                        "Maybe everything seems heavy, maybe nothing seems under your control — but sweetheart, I know you will manage it just fine. You are my strong man.\n\n"
                        "Away from home, away from land, away from everyone you love — it takes courage to live like this. You inspire me every day. And if you can handle me, you can handle everything.\n\n",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 20),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/img6.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
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

            const SizedBox(height: 10),

            const Text(
              "Lag ja gale...",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _togglePlay,
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle,
                    color: Colors.orangeAccent,
                    size: 42,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
