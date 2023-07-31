import 'package:flutter/material.dart';

class DropShadowContainer extends StatefulWidget {
  const DropShadowContainer({super.key});

  @override
  State<DropShadowContainer> createState() => _DropShadowContainerState();
}

class _DropShadowContainerState extends State<DropShadowContainer> {
  bool textButtonPressed = false;
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
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 208, 218, 223),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsetsDirectional.all(10),
                itemCount: textButtonPressed ? 20 : 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(
                              0, 3), // changes the position of the shadow
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          images[index],
                          width: 150,
                          height: 100,
                        ),
                        Column(
                          children: [
                            const Text("This is title"),
                            const Text(
                              "This is subtitle",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              myDateTime.toString(),
                              style: const TextStyle(fontSize: 10),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    textButtonPressed = textButtonPressed ? false : true;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textButtonPressed ? "View Less" : "View more",
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                    ),
                    Icon(textButtonPressed
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
