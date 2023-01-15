import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/custom_divider.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    Key? key,
    this.appBar,
    required this.body,
    this.title,
    required this.actions,
  }) : super(key: key);

  final Widget? appBar;
  final Widget body;
  final Widget? title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            appBar ??
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBar(
                      elevation: 0.0,
                      title: title,
                      centerTitle: true,
                      actions: actions,
                    ),
                    const CustomDivider()
                  ],
                ),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
