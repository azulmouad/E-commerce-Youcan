import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class CarouselProductDetails extends StatefulWidget {
  const CarouselProductDetails({super.key});

  @override
  State<CarouselProductDetails> createState() => _CarouselProductDetailsState();
}

class _CarouselProductDetailsState extends State<CarouselProductDetails> {
  int indexCarousel = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SizedBox(
          height: size.height * .5,
          width: size.width,
          child: PageView(
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
                      height: size.height,
                      image: NetworkImage(carouselImages[i]),
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
            ],
          ),
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
        SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                ),
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  size: 18,
                ),
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border,
              size: 18,
            ),
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
