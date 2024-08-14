import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomCachedImage extends StatelessWidget {
  final String imageURL;
  const CustomCachedImage({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(imageUrl: imageURL,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => Image.asset('lib/assets/images/error-image.jpg'),
      placeholder: (context, url) => Center(
        child: Image.asset('lib/assets/images/image-place-holder.png'),
      ),
    );
  }
}
