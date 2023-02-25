import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class PromotionsSection extends StatelessWidget {
  const PromotionsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/p6.png',
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      'Delivery Starting 1',
                      style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                    ),
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
                      'assets/images/p7.png',
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      'Order More Pay Less',
                      style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                    ),
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
                      'assets/images/p8.png',
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      'Promotions           ',
                      style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                    ),
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
                      'assets/images/p9.png',
                      width: 100,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Text(
                      'Free Delivery         ',
                      style: TextStyle(fontSize: AppStyle.textNormalSize, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
