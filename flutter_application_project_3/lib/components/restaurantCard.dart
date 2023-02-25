import 'package:flutter/material.dart';
import 'package:flutter_application_project_3/moduls/Restaurant.dart';
import 'package:flutter_application_project_3/moduls/appStyle.dart';

class RestaurantCard extends StatelessWidget {
  RestaurantCard({Key? key, required this.restaurant}) : super(key: key);
  Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(190, 200, 200, 200)),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      restaurant.image,
                      width: 400,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        restaurant.logo,
                        width: 50,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(100, 100, 100, 0.5),
                            border: Border.all(color: Colors.transparent),
                            borderRadius: const BorderRadius.all(Radius.circular(5))),
                        child: const Icon(
                          Icons.discount,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurant.name,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(190, 200, 200, 200)),
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          Text('4.3'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(190, 200, 200, 200)),
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.grey,
                          ),
                          Text('32-38 min'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(190, 200, 200, 200)),
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.call_received_rounded,
                            color: Colors.grey,
                          ),
                          Text('1.6 km'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 30, 56, 78),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.directions_car_sharp,
                            color: Colors.white,
                          ),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: 'Delivery fee ', style: TextStyle(color: Colors.white, fontSize: 12)),
                                TextSpan(
                                    text: 'SAR 12.00 ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                    )),
                                TextSpan(text: 'SAR 0.00', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 126, 189, 216),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.directions_car_sharp,
                            color: Color.fromARGB(255, 45, 93, 108),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'SAR 12.00 ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 45, 93, 108),
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                    )),
                                TextSpan(
                                    text: 'SAR 5.00 with promo code',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 45, 93, 108),
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 126, 189, 216),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.directions_car_sharp,
                            color: Color.fromARGB(255, 45, 93, 108),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'SAR 12.00 ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 45, 93, 108),
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                    )),
                                TextSpan(
                                    text: 'SAR 7.00 with promo code',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 45, 93, 108),
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 126, 189, 216),
                          border: Border.all(color: Colors.transparent),
                          borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.directions_car_sharp,
                            color: Color.fromARGB(255, 45, 93, 108),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'SAR 12.00 ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 45, 93, 108),
                                      fontSize: 12,
                                      decoration: TextDecoration.lineThrough,
                                    )),
                                TextSpan(
                                    text: 'SAR 9.00 with promo code',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 45, 93, 108),
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: AppStyle.spasingHight,
        ),
      ],
    );
  }
}
