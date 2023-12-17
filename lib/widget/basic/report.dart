import 'package:flutter/material.dart';

class ReportComponent extends StatelessWidget {
  const ReportComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightBlue,
      child: const Text("리포트 화면입니다."),
    );
  }
}
