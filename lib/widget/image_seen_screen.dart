import 'package:flutter/material.dart';

class ImageSeen extends StatefulWidget {
  const ImageSeen({Key? key}) : super(key: key);

  @override
  State<ImageSeen> createState() => _ImageSeenState();
}

class _ImageSeenState extends State<ImageSeen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.network(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJNZW4BLBsUQy32kokD21__zw0E1b6e3S8vHkQstNqnziy4kv-CXN2PG4NkLOERIye90M&usqp=CAU',
        fit: BoxFit.cover,
        height: size.height,
        width: size.width,
      ),
    );
  }
}
