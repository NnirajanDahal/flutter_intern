import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarNavigation extends StatefulWidget {
  const AppBarNavigation({super.key});

  @override
  State<AppBarNavigation> createState() => _AppBarNavigationState();
}

class _AppBarNavigationState extends State<AppBarNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Custom Scroll View'),
            pinned: true,
            floating: false,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  style: ListTileStyle.list,
                  tileColor: Colors.grey,
                  title: Center(child: Text('Item $index')),
                  subtitle: Center(child: Text('Subtitle $index')),
                );
              },
              childCount: 26,
            ),
          ),
        ],
      ),
    );
  }
}
