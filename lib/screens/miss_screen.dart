import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';

class MissScreen extends StatefulWidget {
  const MissScreen({super.key});

  @override
  State<MissScreen> createState() => _MissScreenState();
}

class _MissScreenState extends State<MissScreen> {
  final PageController _pageController = PageController();

  int currentIndex = 0;
  bool isZoomed = false;

  final List<Map<String, String>> memories = [
    {
      "image": "assets/img1.jpeg",
      "title": "Fashionista Moi",
      "caption":
          "She is Elite, her sense of fashion is top notch. The headbad - Premium Lactose brand Pillow towel, her shrug premium Tucci brand checkered shirt and her tshirt Vui Litton green plain. .\n\n"
          "swipe left for more",
    },
    {
      "image": "assets/img2.jpeg",
      "title": "Zuban Kesari Moi",
      "caption":
          "A little sadak chap, still top-tier fashion. Does not promote tobacco. But poses dramatically. Respect.",
    },
    {
      "image": "assets/img3.jpeg",
      "title": "Skin Care specialist Moi",
      "caption":
          "Usually spotted with a sheet mask on her face, this is a rare Moi. Aise to she just washes her face with water but when the urge comes, she can go for a 50 step skin care routine which includes washing face 45 times : )",
    },
    {
      "image": "assets/img4.jpeg",
      "title": "Blob Moi",
      "caption":
          "Spotted when she is veryy comfortable with the one on VC. She will make you laugh and irritate you to your wits ends but but but, If you click her screenshot - it's the end for you x_x",
    },
    {
      "image": "assets/img5.jpeg",
      "title": "Wifey Moi",
      "caption":
          "The most premium Moi. Unlocked only when you are a part of her top priority list. She will scold you, nag at you, ask you to call your home, remind you to behave in front of parents and insist that you eat on time even though she skips her breakfast 5/7 days. She is sweet but more scary ; )",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4B400),
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              physics: isZoomed
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              itemCount: memories.length,
              onPageChanged: (index) {
                HapticFeedback.lightImpact();
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return _buildCard(memories[index]);
              },
            ),

            // Progress Counter
            Positioned(
              top: 16,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${currentIndex + 1}/${memories.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Back Button
            Positioned(
              top: 16,
              left: 20,
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context, '/store'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(Map<String, String> memory) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFFFC107),
          boxShadow: const [BoxShadow(blurRadius: 20, color: Colors.black26)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            children: [
              // Curved Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 26),
                decoration: const BoxDecoration(
                  color: Color(0xFFEAD3A3),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(80),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Which MOI do you Miss??",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Zoomable Image
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: PhotoView(
                      imageProvider: AssetImage(memory["image"]!),
                      backgroundDecoration: const BoxDecoration(
                        //color: Colors.white,
                      ),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 3,
                      initialScale: PhotoViewComputedScale.covered,
                      scaleStateChangedCallback: (scaleState) {
                        setState(() {
                          isZoomed = scaleState != PhotoViewScaleState.initial;
                        });
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                memory["title"]!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  memory["caption"]!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14, height: 1.4),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
