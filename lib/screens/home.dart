import 'package:flutter/material.dart';
import 'package:you_app/helpers/colors.dart';

import '../helpers/assets.dart';
import '../helpers/constants.dart';
import '../widgets/home_w.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimary,
        centerTitle: false,
        title: const Image(
          image: AssetImage(kIcon),
          height: 25,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.white,
              size: 28,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          const SizedBox(height: 15),

          ///Input Search & Filter
          const HomeInputSearch(),
          const SizedBox(height: 15),

          ///Carousel
          const CarouselHome(),
          const SizedBox(height: 20),

          ///Categories
          SizedBox(
            width: double.infinity,
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categoryImages.length,
              itemBuilder: (_, i) {
                return CatyHomeItem(
                  image: categoryImages[i],
                  name: categoryText[i],
                );
              },
              separatorBuilder: (_, i) => const SizedBox(width: 12),
            ),
          ),
          const SizedBox(height: 10),

          ///View All Products
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Latest',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('View all'),
              ),
            ],
          ),
          const SizedBox(height: 5),
          GridView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .8,
            ),
            children: [
              CardProductHomeItem(),
              CardProductHomeItem(),
              CardProductHomeItem(),
              CardProductHomeItem(),
              CardProductHomeItem(),
            ],
          ),
        ],
      ),
    );
  }
}
