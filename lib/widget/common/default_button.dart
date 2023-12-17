import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.name, required this.onClick});

  final String name;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: OutlinedButton(
          onPressed: () {
            onClick();
          },
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black87,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0)),
          child: SizedBox(width: double.infinity, child: Text(name)),
        ));
  }
}
