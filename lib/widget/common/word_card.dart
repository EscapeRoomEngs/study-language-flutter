import 'package:flutter/material.dart';

import '../../model/word_theme.dart';
import 'count_time.dart';

class WordCard extends StatefulWidget {
  final List<WordTheme> wordTheme;

  const WordCard({super.key, required this.wordTheme});

  @override
  State<WordCard> createState() => _WordCard();
}

class _WordCard extends State<WordCard> {
  final PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;
  bool isShowAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: pageController,
        children: widget.wordTheme
            .map<Widget>((e) => GestureDetector(
                  onLongPress: () {
                    setState(() {
                      isShowAnswer = !isShowAnswer;
                    });
                  },
                  child: Center(
                    child: Text(
                      isShowAnswer ? (e.meaning ?? "") : (e.word ?? ""),
                      style: const TextStyle(fontSize: 56),
                    ),
                  ),
                ))
            .toList(),
        onPageChanged: (page) {
          setState(() {
            isShowAnswer = false;
            selectedIndex = page;
          });
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          height: 56.0,
          child: Center(
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${selectedIndex + 1}/${widget.wordTheme.length}")
                  ],
                ),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CountTime(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
