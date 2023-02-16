import 'package:flutter/material.dart';
import 'widgets/appbar_research.dart';
import 'widgets/category_card.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  List<Category> categoryList = [
    Category(
        title: 'Nature',
        nChallenge: 55,
        imagePath:
            'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80'),
    Category(
        title: 'Peace',
        nChallenge: 30,
        imagePath:
            'https://images.unsplash.com/photo-1621208074358-a75848f86a9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80'),
    Category(
        title: 'Environment',
        nChallenge: 8,
        imagePath:
            'https://images.unsplash.com/photo-1597700112072-fa3c1d930655?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=729&q=80'),
    Category(
        title: 'Health',
        imagePath:
            'https://plus.unsplash.com/premium_photo-1658506885664-d6e51ce6ff72?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'),
    Category(
        title: 'Children',
        imagePath:
            'https://images.unsplash.com/photo-1611764461465-09162da6465a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
    Category(
        title: 'Education',
        nChallenge: 25,
        imagePath:
            "https://images.unsplash.com/photo-1581078426770-6d336e5de7bf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
    Category(
        title: 'Health',
        imagePath:
            'https://plus.unsplash.com/premium_photo-1658506885664-d6e51ce6ff72?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'),
    Category(
        title: 'Children',
        imagePath:
            'https://images.unsplash.com/photo-1611764461465-09162da6465a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          AppBarResearch(title: "Category Name"),
          const SizedBox(height: 20),
          GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              itemCount: categoryList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 24),
              itemBuilder: (context, index) {
                return CategoryCard(
                  category: categoryList[index],
                );
              })
        ],
      )),
    );
  }
}
