import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_learn/core/config/theme/colors_app.dart';
import 'package:lingo_learn/core/utils/extensions/build_context.dart';
import '../../../../common/constants/route.dart';
import 'app_svg_picture.dart';

class FancyImageShimmerViewer extends StatelessWidget {
  const FancyImageShimmerViewer({
    Key? key,
    required this.imageUrl,
    this.errorWidget,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.borderRadius = 0,
  }) : super(key: key);

  final String imageUrl;
  final Widget? errorWidget;
  final BoxFit fit;
  final double? height;
  final double? width;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return FancyShimmerImage(
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius != null ? 20 : borderRadius!),
        ),
      ),
      imageUrl: EndPoints.addres + imageUrl,
      errorWidget: errorWidget ??
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  borderRadius != null ? 20 : borderRadius!),
              color: AppColors.grey.withOpacity(0.1),
            ),
            child: ClipRRect(

                borderRadius: BorderRadius.circular(
                    45.r),

              child: Center(
                child: Icon(Icons.photo,color: context.colorScheme.primary,),
              ),
            ),
          ),
      boxFit: fit,
      height: height ??300 ,
      width: width ?? 300,
    );
  }
}
