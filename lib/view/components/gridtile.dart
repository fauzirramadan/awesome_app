import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 15,
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 2,
        pattern: [
          const WovenGridTile(0.9),
          const WovenGridTile(0.7,
              crossAxisRatio: 0.9, alignment: AlignmentDirectional.centerEnd)
        ],
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey[200],
        );
      },
    );
  }
}
