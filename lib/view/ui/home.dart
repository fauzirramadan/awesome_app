import 'package:awesome_app/bloc/photos_cubit/photos_cubit.dart';
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
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.widgets))
          ],
        ),
        body: Column(children: const [
          Expanded(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10.0, left: 12, right: 12, bottom: 10),
              child: CustomGridTile(),
            ),
          ),
        ]),
      ),
    );
  }
}
