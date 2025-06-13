import 'dart:async';
import 'package:flutter/material.dart';
import 'donation.dart';
import 'achievements.dart';
import 'events.dart';
import 'share.dart';

class Stage2Screen extends StatefulWidget {
  const Stage2Screen({super.key});

  @override
  State<Stage2Screen> createState() => _Stage2ScreenState();
}

class _Stage2ScreenState extends State<Stage2Screen> {
  final List<String> imageList = [
    'assets/news1.png',
    'assets/news2.png',
    'assets/news3.png',
    'assets/news4.png',
    'assets/news5.png',
  ];

  int currentImageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startImageRotation();
  }

  void _startImageRotation() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        currentImageIndex = (currentImageIndex + 1) % imageList.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Color.fromARGB(255, 14, 145, 0),
                Colors.blue,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Community News",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 14, 145, 0),
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 450,
              child: Stack(
                children: [
                  // Logo
                  Positioned(
                    top: screenHeight * 0.35,
                    left: 90,
                    child: Image.asset(
                      'assets/logo.png',
                      height: 189 * 1.1,
                      width: 189 * 1.1,
                    ),
                  ),

                  // DONATE
                  Positioned(
                    top: screenHeight * 0.25,
                    left: 140,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Donation(),
                          ),
                        );
                      },
                      child: const Text("DONATE"),
                    ),
                  ),

                  // ACHIEVEMENTS
                  Positioned(
                    bottom: screenHeight * 0.17,
                    left: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Achievements(),
                          ),
                        );
                      },
                      child: const Text("ACHIEVEMENTS"),
                    ),
                  ),

                  // EVENTS
                  Positioned(
                    top: screenHeight * 0.45,
                    left: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Events(),
                          ),
                        );
                      },
                      child: const Text("EVENTS"),
                    ),
                  ),

                  // SHARE
                  Positioned(
                    top: screenHeight * 0.45,
                    left: 280,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Share(),
                          ),
                        );
                      },
                      child: const Text("SHARE"),
                    ),
                  ),
                ],
              ),
            ),

            // Right side image
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: 500,
                    child: Image.asset(
                      imageList[currentImageIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
