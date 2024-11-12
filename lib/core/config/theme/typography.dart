import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_learn/core/utils/extensions/build_context.dart';

part 'font.dart';

TextTheme appTextTheme(BuildContext context, TextTheme base, Color textColor) {
      return base
          .copyWith(
            displayLarge: base.displayLarge?.copyWith(
                fontSize: _FontSize.displayLarge,
                fontWeight: _regular,
                fontFamily:'DGTrikaRegular',
                letterSpacing: -0.25,

                color: context.colorScheme.tertiary
            ),
            displayMedium: base.displayMedium?.copyWith(
                fontSize: _FontSize.displayMedium,
                fontWeight: _regular,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            displaySmall: base.displaySmall?.copyWith(
                fontSize: _FontSize.displaySmall,
                fontWeight: _regular,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            headlineLarge: base.headlineLarge?.copyWith(
                fontSize: _FontSize.headlineLarge,
                fontWeight: _regular,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            headlineMedium: base.headlineMedium?.copyWith(
                fontSize: _FontSize.headlineMedium,
                fontWeight: _regular,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            headlineSmall: base.headlineSmall?.copyWith(
                fontSize: _FontSize.headlineSmall,
                fontWeight: _regular,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            titleLarge: base.titleLarge?.copyWith(
                fontSize: _FontSize.titleLarge,
                fontWeight: _regular,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            titleMedium: base.titleMedium?.copyWith(
                fontSize: _FontSize.titleMedium,
                fontWeight: _medium,
                letterSpacing: 0.15,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            titleSmall: base.titleSmall?.copyWith(
                fontSize: _FontSize.titleSmall,
                fontWeight: _medium,
                letterSpacing: 0.1,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            bodyLarge: base.bodyLarge?.copyWith(
                fontSize: _FontSize.bodyLarge,
                fontWeight: _regular,
                letterSpacing: 0.5,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            bodyMedium: base.bodyMedium?.copyWith(
                fontSize: _FontSize.bodyMedium,
                fontWeight: _regular,
                letterSpacing: 0.25,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            bodySmall: base.bodySmall?.copyWith(
                fontSize: _FontSize.bodySmall,
                fontWeight: _regular,
                letterSpacing: 0.4,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            labelLarge: base.labelLarge?.copyWith(
                fontSize: _FontSize.labelLarge,
                fontWeight: _medium,
                letterSpacing: 0.1,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            labelMedium: base.labelMedium?.copyWith(
                fontSize: _FontSize.labelMedium,
                fontWeight: _medium,
                letterSpacing: 0.5,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
            labelSmall: base.labelSmall?.copyWith(
                fontSize: _FontSize.labelSmall,
                fontWeight: _medium,
                letterSpacing: 0.5,
                fontFamily:'DGTrikaRegular',
                color: context.colorScheme.tertiary
            ),
      )
          .apply(displayColor: textColor, bodyColor: textColor);
}
