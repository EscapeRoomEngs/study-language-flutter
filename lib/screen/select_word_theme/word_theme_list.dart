import 'dart:convert';

import 'package:flutter/material.dart';

import '../../navigation/routes.dart';
import '../../util/Utils.dart';
import '../../widget/button/filled_text_button.dart';
import '../basic/home_content.dart';

class WordThemeList extends StatelessWidget {
  const WordThemeList({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: themeList(context, country),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData == false) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(fontSize: 15),
              ),
            );
          } else {
            List<String> data = snapshot.data as List<String>;
            return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                child: Column(
                    children: data
                        .map(
                          (item) => FilledTextButton(
                              alignment: Alignment.centerLeft,
                              name: "${getThemeName(item).toUpperCase()}테마",
                              onClick: () => {
                                    Navigator.pushNamed(
                                        context, Routes.selectStudyType,
                                        arguments: item)
                                  }),
                        )
                        .toList()));
          }
        });
  }

  Future<List<String>> themeList(BuildContext context, Country country) async {
    // Load as String
    final manifestContent =
        await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    // Decode to Map
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // Filter by path
    final filtered = manifestMap.keys
        .where((path) => path.startsWith("assets/data/${country.code}"))
        .toList();

    return filtered;
  }
}
