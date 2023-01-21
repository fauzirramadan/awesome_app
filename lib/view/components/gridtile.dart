import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../bloc/photos_cubit/photos_cubit.dart';

class CustomGridTile extends StatelessWidget {
  final PhotosCubit? cubit;
  const CustomGridTile({Key? key, this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cubit?.listPhoto.length,
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
        var data = cubit?.listPhoto[index];

        return Image(
          image: NetworkImage("${data?.src?.medium}", headers: {
            "Authorization":
                "VpKonmdWMy3iMNtsFOZltVSQsjm4XOctpdrWT29df6PLROCAwZMd2rMw"
          }),
        );
      },
    );
  }
}
