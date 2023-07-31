import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern/day_3/screens/cwrapwidget.dart';

class VerticleImplementation extends StatefulWidget {
  const VerticleImplementation({super.key});

  @override
  State<VerticleImplementation> createState() => _VerticleImplementationState();
}

class _VerticleImplementationState extends State<VerticleImplementation> {
  bool floatingButtonPressed = false;
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => const WrapWidget()));
            },
            icon: const Icon(Icons.arrow_right_alt),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        title: const Text("Verticle Direction"),
      ),
      body: ListView.builder(
        itemCount: floatingButtonPressed ? images.length : 5,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.white,
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20),
                  child: Image.network(
                    images[index],
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: const Text("This is text"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("This is description"),
                  Text(myDateTime.toString())
                ],
              ),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      // images.removeAt(index);
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            floatingButtonPressed = floatingButtonPressed ? false : true;
          });
        },
        child: Icon(
            floatingButtonPressed ? Icons.arrow_upward : Icons.arrow_downward),
      ),
    );
  }
}
