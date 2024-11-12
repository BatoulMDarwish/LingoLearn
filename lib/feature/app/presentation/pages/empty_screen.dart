import 'package:flutter/cupertino.dart';
import 'package:lingo_learn/core/utils/extensions/build_context.dart';


import '../widgets/app_text.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText('', style: context.textTheme.titleLarge),
    );
  }
}
