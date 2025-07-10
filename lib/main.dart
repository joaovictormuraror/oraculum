import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const OraculumApp());
}

class OraculumApp extends StatelessWidget {
  const OraculumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oraculum',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openGallery() async {
    final picker = ImagePicker();
    await picker.pickImage(source: ImageSource.gallery);
  }

  void _openHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HistoryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFD2AD79),
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: const Center(
                child: Text(
                  'oraculu͂m',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Visual da câmera aqui',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _openGallery,
                    icon: const Icon(Icons.photo_library),
                    color: Colors.white,
                    iconSize: 32,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFD2AD79),
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 36),
                  ),
                  IconButton(
                    onPressed: () => _openHistory(context),
                    icon: const Icon(Icons.history),
                    color: Colors.white,
                    iconSize: 32,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFD2AD79),
              padding: const EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: const Center(
                child: Text(
                  'oraculu͂m',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Histórico',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  HistoryCard(
                    imageAsset: 'assets/papiro1.png',
                    text: '“O sol é lindo, as nuvens são leves...”',
                  ),
                  HistoryCard(
                    imageAsset: 'assets/papiro2.png',
                    text:
                        '“O sol é lindo, as nuvens são leves e o vento dança sobre as águas do Grande Rio...”',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final String imageAsset;
  final String text;

  const HistoryCard({
    super.key,
    required this.imageAsset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFD2AD79),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(imageAsset),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
