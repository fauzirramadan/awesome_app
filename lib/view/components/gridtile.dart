import 'package:awesome_app/utils/nav_utils.dart';
import 'package:awesome_app/view/ui/detail.dart';
import 'package:awesome_app/view/widgets/loading_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../bloc/photos_cubit/photos_cubit.dart';

class CustomGridTile extends StatelessWidget {
  const CustomGridTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (context, state) {
        var cubit = context.read<PhotosCubit>();
        if (state is PhotosInitial) {
          cubit.getPhotos();
        }

        return GridView.builder(
          itemCount: cubit.listPhoto.length,
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 2,
            pattern: [
              const WovenGridTile(0.9),
              const WovenGridTile(0.7,
                  crossAxisRatio: 0.9,
                  alignment: AlignmentDirectional.centerEnd)
            ],
          ),
          itemBuilder: (context, index) {
            var data = cubit.listPhoto[index];

            return GestureDetector(
              onTap: () => Nav.to(DetailPage(
                data: data,
              )),
              child: Image(
                image: NetworkImage("${data.src?.medium}"),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const LoadingCircular();
                  } else {
                    return child;
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
