import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'imageviewscreen.dart';

class ChangeIconAndImage extends StatefulWidget {
  const ChangeIconAndImage({super.key});

  @override
  State<ChangeIconAndImage> createState() => _ChangeIconAndImageState();
}

class _ChangeIconAndImageState extends State<ChangeIconAndImage> {
  List images = [
    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/02/01/22/02/mountain-landscape-2031539_960_720.jpg",
    "https://cdn.pixabay.com/photo/2014/09/14/18/04/dandelion-445228_960_720.jpg",
    "https://docs.flutter.dev/assets/images/dash/dash-fainting.gif",
    "https://cdn.pixabay.com/photo/2016/07/11/15/43/pretty-woman-1509956_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/02/13/12/26/aurora-1197753_960_720.jpg",
    "https://cdn.pixabay.com/photo/2016/11/08/05/26/woman-1807533_960_720.jpg",
    "https://cdn.pixabay.com/photo/2013/11/28/10/03/autumn-219972_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/17/19/08/away-3024773_960_720.jpg",
  ];
  int _currentImageIndex = 0;
  void _changeImageIndex() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon and Image Change"),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(
                images[_currentImageIndex],
                height: 400,
                width: 400,
              ),
              FloatingActionButton(
                onPressed: () {
                  _changeImageIndex();
                },
                child: const Icon(Icons.shuffle),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const ImageViewScreen()));
                  },
                  child: const Text("Image Display")),
            ],
          );
        },
      ),
    );
  }
}