import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_learn/core/config/theme/my_color_scheme.dart';
import 'package:lingo_learn/core/config/theme/typography.dart';
import 'package:lingo_learn/core/utils/extensions/build_context.dart';
import '../../../../core/config/theme/app_theme.dart';
import '../../../../core/config/theme/colors_app.dart';
import '../../../../core/utils/responsive_padding.dart';
import 'app_text.dart';

class AppTextField<T> extends StatefulWidget {
  const AppTextField( {
    super.key,
    required this.name,
    this.controller,
    this.onTap,
    this.onEditingComplete,
    this.onChange,
    this.onFieldSubmitted,
    this.onSaved,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.enabled = true,
    this.textInputType,
    this.textInputAction = TextInputAction.next,
    this.textDirection,
    this.validator,
    this.maxLengthEnforcement,
    this.focusNode,
    this.autoValidateMode,
    this.scrollPhysics,
    this.scrollController,
    this.initialValue,
    this.keyboardAppearance,
    this.textAlignVertical,
    this.obscuringCharacter = "*",
    this.expands = false,
    this.readOnly = false,
    this.autocorrect = true,
    this.autofocus = false,
    this.showLength = false,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.textAlign = TextAlign.start,
    this.textCapitalization = TextCapitalization.none,
    this.obscure = false,
    this.prefixIcon,
    this.icon,
    this.hintTextStyle,
    this.textStyle,
    this.suffixIcon,
    this.suffix,
    this.hintText,
    this.labelText,
    this.inputFormatters,
    this.contentPadding,
    this.contextMenuBuilder = _defaultContextMenuBuilder,
    this.borderSideColor,
    this.filled,
    this.onSubmitted,
    this.fillColor,
    this.labelTextStyle,
    this.translateHint = true,
    this.translateLabel = true,
    this.borderRadius,
    this.title,
    this.borderWidth,
    this.isPasswordFiled = false,
    this.prefixBoxConstraints,
    this.initValue,
    this.valueTransformer,
    this.prefix,
  });

  final TextEditingController? controller;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String? val)? onChange;
  final void Function(String val)? onFieldSubmitted;
  final void Function(String? val)? onSaved;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool enabled;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final FormFieldValidator<String?>? validator;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final FocusNode? focusNode;
  final AutovalidateMode? autoValidateMode;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final String? initialValue;
  final void Function(String?)? onSubmitted;
  final Brightness? keyboardAppearance;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final EdgeInsets scrollPadding;
  final bool expands;
  final bool readOnly;
  final bool autocorrect;
  final bool autofocus;
  final String obscuringCharacter;
  final bool showLength;
  final bool obscure;
  final Widget? prefixIcon;
  final Widget? icon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final EditableTextContextMenuBuilder contextMenuBuilder;
  final Color? borderSideColor;
  final Color? fillColor;
  final bool? filled;
  final bool translateHint;
  final bool translateLabel;
  final TextStyle? labelTextStyle;
  final BorderRadius? borderRadius;
  final String? title;
  final double? borderWidth;
  final bool isPasswordFiled;
  final BoxConstraints? prefixBoxConstraints;
  final String name;
  final String? initValue;
  final ValueTransformer<T?>? valueTransformer;
  final Widget ?prefix;

  @override
  State<AppTextField> createState() => _AppTextFieldState();

  static Widget _defaultContextMenuBuilder(BuildContext context, EditableTextState editableTextState) {
    return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState,
    );
  }
}

class _AppTextFieldState extends State<AppTextField> {
  late final ValueNotifier<bool> obscureNotifier;

  @override
  void initState() {
    obscureNotifier = ValueNotifier(widget.isPasswordFiled);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...{
          AppText(
            widget.title!.tr(),
            style: context.textTheme.bodyMedium,
          ),
          13.verticalSpace,
        },
        ValueListenableBuilder<bool>(
            valueListenable: obscureNotifier,
            builder: (context, obscureValue, _) {
              return Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15.r),
                //     boxShadow:  [
                //     BoxShadow(
                //       color: Color(0xffEEEEEE).withOpacity(.69),
                //       blurRadius: 2.0, // soften the shadow
                //       spreadRadius: -1.0, //extend the shadow
                //       offset: Offset(
                //         1, // Move to right 5  horizontally
                //         -2,// , // Move to bottom 5 Vertically
                //       ),
                //     )
                //
                // ]),
                child: FormBuilderTextField(
                  name: widget.name,
                  initialValue: widget.initValue,
                  valueTransformer: widget.valueTransformer,
                  controller: widget.controller,
                  onTap: widget.onTap,
                  onChanged: widget.onChange,
                  onEditingComplete: widget.onEditingComplete,
                  onSaved: widget.onSaved,
                  validator: widget.validator,
                  maxLines: widget.isPasswordFiled ? 1 : widget.maxLines,
                  minLines: widget.minLines,
                  maxLength: widget.showLength ? widget.maxLength : null,
                  textAlign: widget.textAlign,
                  enabled: widget.enabled,
                  keyboardType: widget.textInputType,
                  textInputAction: widget.textInputAction,
                  textDirection: widget.textDirection,
                  scrollPadding: widget.scrollPadding,
                  expands: widget.expands,
                  maxLengthEnforcement: widget.maxLengthEnforcement,
                  focusNode: widget.focusNode,
                  obscureText:widget.obscure? obscureValue: false,
                  obscuringCharacter: widget.obscuringCharacter,
                  autovalidateMode: widget.autoValidateMode,
                  readOnly: widget.readOnly,
                  scrollPhysics: widget.scrollPhysics,
                  scrollController: widget.scrollController,
                  autocorrect: widget.autocorrect,
                  autofocus: widget.autofocus,
                  cursorColor: context.colorScheme.primary,
                  keyboardAppearance: widget.keyboardAppearance,
                  textAlignVertical: widget.textAlignVertical,
                  textCapitalization: widget.textCapitalization,
                  contextMenuBuilder: widget.contextMenuBuilder,
                  inputFormatters: [
                    if (widget.maxLength != null) LengthLimitingTextInputFormatter(widget.maxLength),
                    if (widget.textInputType == TextInputType.phone/* || widget.textInputType == TextInputType.number*/) ...[
                      FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    ],
                    ...?widget.inputFormatters
                  ],
                  style: widget.textStyle ??
                      context.textTheme.bodyMedium?.r?.copyWith(
                        color: context.colorScheme.onBackground,
                        decoration: TextDecoration.none,
                        fontFamily: 'Inter'
                      ),
                  decoration: InputDecoration(
                    errorStyle:context.textTheme.titleLarge?.r?.copyWith(
                      fontSize: 15.sp,
                        color: Colors.red,
                        decoration: TextDecoration.none,
                        fontFamily: 'Inter'

                    ) ,
                    prefix:widget.prefix ,
                    border: OutlineInputBorder(

                      borderRadius: widget.borderRadius ?? BorderRadius.circular(kbrBorderTextField),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: widget.borderRadius ?? BorderRadius.circular(kbrBorderTextField),
                    ),
                    enabledBorder: OutlineInputBorder(

                      borderRadius: widget.borderRadius ?? BorderRadius.circular(kbrBorderTextField),
                    ),
                    disabledBorder: OutlineInputBorder(

                      borderRadius: widget.borderRadius ?? BorderRadius.circular(kbrBorderTextField),
                    ),
                    errorBorder: OutlineInputBorder(

                      borderRadius: widget.borderRadius ?? BorderRadius.circular(kbrBorderTextField),
                    ),
                    focusedErrorBorder: OutlineInputBorder(

                      borderRadius: widget.borderRadius ?? BorderRadius.circular(kbrBorderTextField),
                    ),
                    filled: widget.filled ?? true,
                    fillColor: widget.fillColor?? AppColors.fillTextField,
                    contentPadding: widget.contentPadding ?? HWEdgeInsetsDirectional.only(start: 16, end: 10),
                    prefixIcon: widget.prefixIcon,
                    prefixIconConstraints: widget.prefixBoxConstraints,
                    icon: widget.icon,
                    suffixIcon: widget.isPasswordFiled ? eyeIcon(obscureValue) : widget.suffixIcon,
                    suffix: widget.suffix,
                    hintText: widget.translateHint ? widget.hintText?.tr() : widget.hintText,
                    hintStyle:
                    widget.hintTextStyle ?? context.textTheme.bodyMedium.r?.withColor(Color(0xffCCCCCC)),
                    labelText: widget.translateLabel ? widget.labelText?.tr() : widget.labelText,
                    labelStyle:
                    widget.labelTextStyle ?? context.textTheme.bodyMedium?.withColor(context.colorScheme.hint),
                  ),
                  onSubmitted: (widget.onSubmitted),
                ),
              );
            }),
      ],
    );
  }

  Widget eyeIcon(bool obscure) {
    return IconButton(
      onPressed: () => obscureNotifier.value = !obscure,
      icon: Icon(obscure ? CupertinoIcons.eye : CupertinoIcons.eye_slash, color: context.colorScheme.primary),
    );
  }
}
