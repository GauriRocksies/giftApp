// import 'package:flutter/material.dart';
// import 'package:confetti/confetti.dart';
// import 'dart:math';

// class BirthdayScreen extends StatefulWidget {
//   const BirthdayScreen({super.key});

//   @override
//   State<BirthdayScreen> createState() => _BirthdayScreenState();
// }

// class _BirthdayScreenState extends State<BirthdayScreen> {
//   late ConfettiController _confettiController;

//   bool blown = false;

//   @override
//   void initState() {
//     super.initState();
//     _confettiController = ConfettiController(
//       duration: const Duration(seconds: 3),
//     );
//   }

//   Future<void> _blowCandle() async {
//     if (blown) return;

//     setState(() {
//       blown = true;
//     });

//     await Future.delayed(const Duration(milliseconds: 600));

//     _confettiController.play();
//   }

//   @override
//   void dispose() {
//     _confettiController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF4F606A),
//       body: GestureDetector(
//         onVerticalDragEnd: (details) {
//           if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
//             _blowCandle();
//           }
//         },
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             // Main Content
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 60),

//                 Text(
//                   blown
//                       ? "Happyyyy Birthdayyy 🎉"
//                       : "Make a wish…\nSwipe up to blow 🕯",
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 22,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),

//                 const SizedBox(height: 40),

//                 // Candle Image + Flame
//                 Stack(
//                   alignment: Alignment.topCenter,
//                   children: [
//                     Image.asset("assets/candle.jpeg", width: 220),

//                     // Flame
//                     AnimatedOpacity(
//                       duration: const Duration(milliseconds: 500),
//                       opacity: blown ? 0 : 1,
//                       child: const Padding(
//                         padding: EdgeInsets.only(top: 8),
//                         child: Icon(
//                           Icons.local_fire_department,
//                           size: 45,
//                           color: Color(0xFFF28627),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 60),

//                 if (blown) Image.asset("assets/bday.jpeg", width: 260),

//                 const SizedBox(height: 80),
//               ],
//             ),

//             // Confetti
//             Align(
//               alignment: Alignment.topCenter,
//               child: ConfettiWidget(
//                 confettiController: _confettiController,
//                 blastDirectionality: BlastDirectionality.explosive,
//                 shouldLoop: false,
//                 gravity: 0.35,
//                 emissionFrequency: 0.05,
//                 numberOfParticles: 25,
//                 colors: const [
//                   Color(0xFFF2B33D),
//                   Color(0xFFF28627),
//                   Color(0xFFBF5A1F),
//                   Color(0xFF4F606A),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
