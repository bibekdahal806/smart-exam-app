import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';

enum AvatarShape { circle, rectangle }

class CustomImageAvatar extends StatelessWidget {
  final String image;
  final double? size;
  final double? height;
  final double? width;
  final AvatarShape shape;
  final String? placeHolderImage;
  final BoxFit fit;
  final BoxFit placeHolderFit;
  final BorderRadiusGeometry? borderRadius;
  final bool isNetwork;

  const CustomImageAvatar._({
    required this.image,
    required this.isNetwork,
    this.size,
    this.height,
    this.width,
    this.shape = AvatarShape.circle,
    this.placeHolderImage,
    this.fit = BoxFit.cover,
    this.placeHolderFit = BoxFit.cover,
    this.borderRadius,
    super.key,
  });

  /// For network images
  const CustomImageAvatar.network({
    Key? key,
    required String imageUrl,
    double? size,
    double? height,
    double? width,
    AvatarShape shape = AvatarShape.circle,
    String? placeHolderImage,
    BoxFit fit = BoxFit.cover,
    BoxFit placeHolderFit = BoxFit.cover,
    BorderRadiusGeometry? borderRadius,
  }) : this._(
         key: key,
         image: imageUrl,
         isNetwork: true,
         size: size,
         height: height,
         width: width,
         shape: shape,
         placeHolderImage: placeHolderImage,
         fit: fit,
         placeHolderFit: placeHolderFit,
         borderRadius: borderRadius,
       );

  /// For asset images
  const CustomImageAvatar.asset({
    Key? key,
    required String imagePath,
    double? size,
    double? height,
    double? width,
    AvatarShape shape = AvatarShape.circle,
    BoxFit fit = BoxFit.cover,
    BorderRadiusGeometry? borderRadius,
  }) : this._(
         key: key,
         image: imagePath,
         isNetwork: false,
         size: size,
         height: height,
         width: width,
         shape: shape,
         fit: fit,
         borderRadius: borderRadius,
       );

  @override
  Widget build(BuildContext context) {
    final double finalHeight = size ?? height ?? 50;
    final double finalWidth = size ?? width ?? 50;

    final Widget imageWidget = isNetwork
        ? CustomCachedNetworkImage(
            imageUrl: image,
            fit: fit,
            placeHolderImage: placeHolderImage,
            placeHolderFit: placeHolderFit,
          )
        : Image.asset(image, fit: fit);

    return Container(
      height: finalHeight,
      width: finalWidth,
      decoration: BoxDecoration(
        shape: shape == AvatarShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        borderRadius: shape == AvatarShape.rectangle
            ? borderRadius ?? BorderRadius.circular(12)
            : null,
      ),
      clipBehavior: Clip.hardEdge,
      child: imageWidget,
    );
  }
}
