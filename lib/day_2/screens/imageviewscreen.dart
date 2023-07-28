import 'package:flutter/material.dart';

class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({super.key});

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image View Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
              "https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539_960_720.jpg",
              height: 200,
              width: 200,
            ),
            const Text("Network Image"),
            const SizedBox(height: 100),
            Image.asset(
              "assets/images/temple.jpg",
              height: 200,
              width: 200,
            ),
            const Text("Assets Image")
          ],
        ),
      ),
    );
  }
}
