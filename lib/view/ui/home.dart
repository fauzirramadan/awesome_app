import 'package:awesome_app/bloc/photos_cubit/photos_cubit.dart';
import 'package:awesome_app/view/widgets/loading_circular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/gridtile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PhotosCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Discover"),
        ),
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 12, right: 12),
              child: BlocBuilder<PhotosCubit, PhotosState>(
                builder: (context, state) {
                  var cubit = context.read<PhotosCubit>();
                  if (state is PhotosInitial) {
                    cubit.getPhotos();
                  }
                  return state is PhotosLoading
                      ? const LoadingCircular()
                      : CustomGridTile(
                          cubit: cubit,
                        );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
