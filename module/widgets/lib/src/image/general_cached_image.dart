import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GeneralCachedImage extends StatelessWidget {
  const GeneralCachedImage({super.key, this.imageUrl, this.fit, this.errorWidget, this.loadingWidget});

  final String? imageUrl;
  final BoxFit? fit;
  final Widget? errorWidget;
  final Widget? loadingWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      errorWidget: (context, url, error) => errorWidget ?? const Icon(Icons.error),
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          loadingWidget ??
          const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
      placeholderFadeInDuration: const Duration(milliseconds: 500),
      filterQuality: FilterQuality.medium,
      useOldImageOnUrlChange: false,
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}
