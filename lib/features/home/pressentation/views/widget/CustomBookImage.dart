import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  final String imageurl;
  const CustomBookImage({required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          imageUrl: imageurl,
          errorWidget: (context, url, error) => Icon(Icons.error_outline),
        ),
      ),
    );
  }
}
