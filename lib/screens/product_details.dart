import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:you_app/helpers/colors.dart';

import '../widgets/details_w.dart';
import '../widgets/home_w.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      bottomNavigationBar: SafeArea(
        top: false,
        child: Row(
          children: [
            CardAddToCart(
              label: "Add to cart",
              icon: FontAwesomeIcons.cartShopping,
              isCart: true,
            ),
            const SizedBox(width: 10),
            CardAddToCart(
              label: "Buy now",
              icon: FontAwesomeIcons.bagShopping,
              isCart: false,
            ),
          ],
        ),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        padding: EdgeInsets.zero,
        children: [
          ///Carousel Images
          CarouselProductDetails(),

          ///Title
          Text(
            'Full sleeve red shirt',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          ///Category
          Text(
            'Women shirt',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),

          ///Prices & Date offer
          Row(
            children: [
              Text(
                '\$10:00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '\$15:00',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '20% OFF',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              Text(
                '16hrs : 32mins',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),

          ///Review
          Row(
            children: [
              AnimatedRatingStars(
                initialRating: 3.5,
                minRating: 0.0,
                maxRating: 5.0,
                filledColor: Colors.amber,
                emptyColor: Colors.grey,
                filledIcon: Icons.star,
                halfFilledIcon: Icons.star_half,
                emptyIcon: Icons.star_border,
                onChanged: (double rating) {},
                customFilledIcon: Icons.star,
                customHalfFilledIcon: Icons.star_half,
                customEmptyIcon: Icons.star_border,
                starSize: 18.0,
                readOnly: false,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  '10 See reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),

          ///Select Quantity
          const Text(
            'Select Quantity',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          CardSelectQuantity(),
          const SizedBox(height: 10),

          ///Select Size
          const Text(
            'Select Size: XL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          CardSizeProduct(),
          const SizedBox(height: 10),

          ///Select Color
          const Text(
            'Select Color',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          const CardProductColors(),

          ///Details
          const SizedBox(height: 20),
          CardDetailsDrop(
            title: "Product Details",
          ),
          CardDetailsDrop(
            title: "Specifications",
          ),
          CardDetailsDrop(
            title: "Material & Care",
          ),
          CardDetailsDrop(
            title: "Rating & Reviews",
          ),

          const SizedBox(height: 15),

          ///Select Color
          const Text(
            'Similar Products',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          GridView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .8,
            ),
            children: [
              CardProductHomeItem(),
              CardProductHomeItem(),
            ],
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
