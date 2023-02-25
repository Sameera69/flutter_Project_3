import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class NewSection extends StatelessWidget {
  const NewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'NEW',
              style: TextStyle(color: Colors.blue, fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/p2.png',
                    width: 80,
                  ),
                ),
                Text(
                  'ToYou Club',
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
                    'assets/images/p3.png',
                    width: 80,
                  ),
                ),
                Text(
                  'ToYou Credit',
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
                    'assets/images/p4.png',
                    width: 80,
                  ),
                ),
                Text(
                  'Order Again',
                  style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
