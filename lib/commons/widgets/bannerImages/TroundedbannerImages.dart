import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constatnts/colors.dart';
import '../../../utils/constatnts/sizes.dart';
import '../shimmer/shimmer.dart';

///Here is the code for the banner 
class TroundedBannerImage extends StatelessWidget {
  const TroundedBannerImage({
    super.key,
    this.width = 150,
    this.height = 150,
    required this.imgurl,
    this.applyImageradius = false,
    this.boxBorder,
    this.backgroundColor = Tcolors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = Tsizes.md,
  });

  final double? width, height;
  final String imgurl;
  final bool applyImageradius;
  final BoxBorder? boxBorder;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onPressed,
      child: Container(
        height: height,
        width:  width,
        padding: padding,
        decoration: BoxDecoration(
          border: boxBorder,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
           child: ClipRRect(
                  borderRadius: applyImageradius
                   ? BorderRadius.circular(borderRadius)
                    : BorderRadius.zero,
                     child:
                        isNetworkImage
                         ?
                        CachedNetworkImage(
                          
                        fit: BoxFit.cover,
                        imageUrl: imgurl,
                        progressIndicatorBuilder: (context, url, progress) {
                          return const TShimmerWidget(width:double.infinity, height: 190,);
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                        ) : Image(
                
                      image: isNetworkImage
                    ? NetworkImage(imgurl)
                    : AssetImage(imgurl) as ImageProvider)),
      ),
    );
  }
}
