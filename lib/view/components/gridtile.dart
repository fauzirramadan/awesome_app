import 'package:awesome_app/utils/nav_utils.dart';
import 'package:awesome_app/view/ui/detail.dart';
import 'package:awesome_app/view/widgets/loading_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../bloc/photos_cubit/photos_cubit.dart';

class CustomGridTile extends StatefulWidget {
  const CustomGridTile({Key? key}) : super(key: key);

  @override
  State<CustomGridTile> createState() => _CustomGridTileState();
}

class _CustomGridTileState extends State<CustomGridTile> {
  final ScrollController _controller = ScrollController();
  PhotosCubit? cubit;
  PhotosState? currentState;

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.hasClients) {
        if (_controller.offset >= _controller.position.maxScrollExtent) {
          loadMore();
        }
      }
    });
    super.initState();
  }

  void loadMore() {
    if (currentState is PhotoSuccess) {
      cubit?.loadMorePhotos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (context, state) {
        cubit = context.read<PhotosCubit>();
        currentState = state;
        if (currentState is PhotosInitial) {
          cubit?.getPhotos();
        }

        return SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: cubit?.listPhoto.length,
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
                  var data = cubit?.listPhoto[index];

                  return GestureDetector(
                    onTap: () => Nav.to(DetailPage(
                      data: data,
                    )),
                    child: Image(
                      image: NetworkImage("${data?.src?.medium}"),
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
              ),
              currentState is PhotoLoadMore
                  ? const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: LoadingCircular(),
                    )
                  : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
