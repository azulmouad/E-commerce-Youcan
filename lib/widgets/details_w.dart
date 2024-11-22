import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/colors.dart';
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

class CardSelectQuantity extends StatelessWidget {
  const CardSelectQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xffEAEAEA),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.minus,
                  size: 15,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  '01',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.plus,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardSizeItem extends StatelessWidget {
  const CardSizeItem({super.key, required this.size, required this.selected});
  final String size;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      alignment: Alignment.center,
      child: Text(
        size,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

class CardSizeProduct extends StatelessWidget {
  const CardSizeProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardSizeItem(
          size: "S",
          selected: false,
        ),
        CardSizeItem(
          size: "M",
          selected: true,
        ),
        CardSizeItem(
          size: "L",
          selected: false,
        ),
        CardSizeItem(
          size: "XL",
          selected: false,
        ),
        CardSizeItem(
          size: "XXL",
          selected: false,
        ),
      ],
    );
  }
}

class CardColorItem extends StatelessWidget {
  const CardColorItem({super.key, required this.color, required this.selected});
  final Color color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: selected
              ? Border.all(
                  color: Colors.white,
                  width: 3,
                )
              : null),
    );
  }
}

class CardProductColors extends StatelessWidget {
  const CardProductColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CardColorItem(
          color: Colors.red,
          selected: false,
        ),
        CardColorItem(
          color: Colors.blue,
          selected: true,
        ),
        CardColorItem(
          color: Colors.green,
          selected: false,
        ),
        CardColorItem(
          color: Colors.orange,
          selected: false,
        ),
      ],
    );
  }
}

class CardAddToCart extends StatelessWidget {
  const CardAddToCart(
      {super.key,
      required this.label,
      required this.icon,
      required this.isCart});
  final String label;
  final IconData icon;
  final bool isCart;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: isCart ? kPrimary : Colors.white,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isCart ? Colors.white : kPrimary,
              size: 18,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                color: isCart ? Colors.white : kPrimary,
                // fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardDetailsDrop extends StatefulWidget {
  const CardDetailsDrop({super.key, required this.title});
  final String title;

  @override
  State<CardDetailsDrop> createState() => _CardDetailsDropState();
}

class _CardDetailsDropState extends State<CardDetailsDrop> {
  bool isDrop = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: kInputBackground,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isDrop = !isDrop;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    isDrop
                        ? FontAwesomeIcons.chevronDown
                        : FontAwesomeIcons.chevronRight,
                    size: 12,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          if (isDrop) const SizedBox(height: 10),
          if (isDrop)
            Text(
              "He moonlights difficult engrossed, sportsmen interested has all Devonshire difficulty gay assistance joy.For who thoroughly conviction. ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
