import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;
  const ImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) {
            return Image(
              image: imageProvider,
              fit: BoxFit.cover,
            );
          },
          placeholder: (context, url) {
            return const Center(child: CircularProgressIndicator());
          },
          errorWidget: (context, url, error) =>
              const Center(child: CircularProgressIndicator())),
    );
  }
  //https://images.unsplash.com/photo-1681105192375-aadb6e706216?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1172&q=80
}/* */
