import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lingo_learn/core/utils/extensions/build_context.dart';
import '../../../../common/helpers/helper_functions.dart';
import '../../../../core/utils/responsive_padding.dart';
import 'app_text.dart';

typedef PickFileCallback = Function(BuildContext context, File? file);

class PickImageBottomSheet extends StatefulWidget {
  const PickImageBottomSheet({
    super.key,
    required this.onPickFile,
  });

  final PickFileCallback onPickFile;

  @override
  State<PickImageBottomSheet> createState() => _PickImageBottomSheetState();
}

class _PickImageBottomSheetState extends State<PickImageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
       backgroundColor: Color(0xff0B0D1D),
      enableDrag: false,
      onClosing: () {},
      builder: (BuildContext context) => Padding(
        padding: HWEdgeInsets.symmetric(horizontal: 16.0,vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,

            AppText(
              "الاختيار من :",
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: context.colorScheme.primary),
            ),
            20.verticalSpace,
            imageSourceWidget(
              onTap: () async => await onSelectSource(context, ImageSource.camera),
              text: "الكاميرا",
              iconData: Icons.camera,
            ),
            imageSourceWidget(
              onTap: () async => await onSelectSource(context, ImageSource.gallery),
              text: "المعرض",
              iconData: Icons.image_rounded,
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Future<void> onSelectSource(BuildContext context, ImageSource source) async {
    final file = await HelperFunctions.instance.pickImage(source);
    if (!mounted) return;

    if (file != null) {
     Navigator.pop(context);
    }

    widget.onPickFile(context, file);
  }

  Widget imageSourceWidget({
    required VoidCallback onTap,
    required String text,
    required IconData iconData,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: HWEdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            Icon(iconData, color: context.colorScheme.primary,size: 30.r,),
            16.horizontalSpace,
            AppText(
              text,
              style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.primary),
            ),
            30.verticalSpace
          ],
        ),
      ),
    );
  }
}
