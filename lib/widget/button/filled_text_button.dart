import 'package:flutter/material.dart';

class FilledTextButton extends StatelessWidget {
  const FilledTextButton(
      {super.key,
      required this.name,
      required this.onClick,
      this.alignment = Alignment.center});

  final String name;
  final Function onClick;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: FilledButton(
          onPressed: () {
            onClick();
          },
          style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF303030),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0)),
          child: SizedBox(
              width: double.infinity,
              child: Align(
                  alignment: alignment,
                  child: Text(name,
                      style: Theme.of(context).textTheme.titleLarge))),
        ));
  }
}
