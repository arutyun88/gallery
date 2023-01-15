import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/custom_divider.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    Key? key,
    required this.body,
    this.title,
    required this.actions,
  }) : super(key: key);

  final Widget body;
  final Widget? title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          AppBar(
            elevation: 0.0,
            title: title,
            centerTitle: true,
            actions: actions,
          ),
          const CustomDivider(),
          Expanded(child: body),
          const CustomDivider(),
        ],
      ),
    );
  }
}
