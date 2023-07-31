import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern/day_3/screens/bverticleimplementation.dart';

class HorizontalImplementation extends StatefulWidget {
  const HorizontalImplementation({super.key});

  @override
  State<HorizontalImplementation> createState() =>
      _HorizontalImplementationState();
}

class _HorizontalImplementationState extends State<HorizontalImplementation> {
  DateTime myDateTime = DateTime.now();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Horizontal Direction")),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Image.network(
                    images[index],
                    height: 200,
                    width: 200,
                  ),
                  const Text("This is title"),
                  Text(myDateTime.toString())
                ],
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => const VerticleImplementation()));
        },
        child: const Center(child: Icon(Icons.arrow_right_alt)),
      ),
    );
  }
}
