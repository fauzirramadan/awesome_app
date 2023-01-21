import 'package:awesome_app/data/model/photo.dart';
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
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Column(
            children: [
              Text(
                data?.photographer ?? "",
                style: const TextStyle(fontSize: 18),
              )
            ],
          ))
        ],
      ),
    );
  }
}
