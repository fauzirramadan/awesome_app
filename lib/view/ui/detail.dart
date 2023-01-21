import 'package:awesome_app/data/model/photo.dart';
import 'package:awesome_app/view/widgets/loading_circular.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Photo? data;
  const DetailPage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Detail"),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Image.network(
                data?.src?.original ?? "",
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const LoadingCircular();
                  } else {
                    return child;
                  }
                },
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              children: [
                Text(
                  data?.photographer ?? "",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  data?.url ?? "",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
