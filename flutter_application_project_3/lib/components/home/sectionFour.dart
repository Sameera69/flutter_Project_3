import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class SectionFour extends StatelessWidget {
  const SectionFour({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/p10.png',
                width: 160,
              ),
            ),
            Text(
              'ToYou Store & More',
              style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/p11.png',
                width: 160,
              ),
            ),
            Text(
              'ToYou Coffee',
              style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
