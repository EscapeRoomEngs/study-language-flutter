import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconVerticalButton extends StatelessWidget {
  const IconVerticalButton(
      {super.key,
      required this.name,
      required this.image,
      required this.onClick});

  final String name;
  final String image;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
            onTap: () => {onClick()},
            child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(image),
                    const SizedBox(height: 7),
                    Text(name)
                  ],
                ))));
  }
}
