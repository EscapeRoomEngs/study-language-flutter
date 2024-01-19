import 'package:flutter/material.dart';

/// 가운데 Text가 있는 app bar
class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleAppBar({super.key, required this.title, this.onClickBack});

  final String title;
  final VoidCallback? onClickBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      backgroundColor: Colors.transparent,
      leading: onClickBack != null
          ? IconButton(
              onPressed: onClickBack,
              icon: const Icon(Icons.arrow_back_rounded))
          : const Spacer(),
      centerTitle: true,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
