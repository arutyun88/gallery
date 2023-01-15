import 'package:flutter/material.dart';
import 'package:gallery/app/ui/component/custom_divider.dart';

class CustomAppScaffold extends StatelessWidget {
  const CustomAppScaffold({
    Key? key,
    required this.body,
    this.leading,
    this.title,
    this.withAppBar,
  }) : super(key: key);

  final Widget body;
  final Widget? leading;
  final String? title;
  final bool? withAppBar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: withAppBar != null
            ? AppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                elevation: 0.0,
                title: Text(title ?? ''),
                leading: leading,
              )
            : null,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (withAppBar != null) const CustomDivider(),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
