import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../helpers/constants.dart';

class HomeInputSearch extends StatelessWidget {
  const HomeInputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: kInputBackground,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 0, left: 15),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            DropdownButton(
              hint: Text(
                'Filter',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: const SizedBox(),
              underline: const SizedBox(),
              items: [
                DropdownMenuItem(
                  child: Text('Women'),
                  value: '',
                ),
                DropdownMenuItem(
                  child: Text('Man'),
                  value: '',
                ),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselHome extends StatefulWidget {
  const CarouselHome({super.key});

  @override
  State<CarouselHome> createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  int indexCarousel = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: double.infinity,
        height: 215,
        child: Stack(
          children: [
            PageView(
              onPageChanged: (value) {
                setState(() {
                  indexCarousel = value;
                });
              },
              children: [
                for (int i = 0; i < carouselImages.length; i++)
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(
                        width: double.infinity,
                        image: NetworkImage(carouselImages[i]),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black54, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.only(bottom: 30),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          carouselText[i],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int v = 0; v < carouselText.length; v++)
                    AnimatedContainer(
                      width: indexCarousel == v ? 25 : 8,
                      height: 8,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInBack,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        color: indexCarousel == v ? Colors.white : Colors.grey,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CatyHomeItem extends StatelessWidget {
  const CatyHomeItem({super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
