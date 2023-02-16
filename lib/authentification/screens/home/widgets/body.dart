import 'package:diginas_app/authentification/screens/home/see_all.dart';
import 'package:diginas_app/authentification/screens/home/widgets/category_card.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
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
              'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=928&q=80'),
      Category(
          title: 'Environment',
          nChallenge: 8,
          imagePath:
              'https://images.unsplash.com/photo-1597700112072-fa3c1d930655?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=729&q=80'),
      Category(
          title: 'Health',
          nChallenge: 18,
          imagePath:
              'https://plus.unsplash.com/premium_photo-1658506885664-d6e51ce6ff72?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80'),
      Category(
          title: 'Children',
          nChallenge: 72,
          imagePath:
              'https://images.unsplash.com/photo-1611764461465-09162da6465a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80')
    ];
    return SingleChildScrollView(
        child: Column(children: [
      Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Explore Categories',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter'),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SeeAll()),
                    );
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 10, 238, 124),
                    ),
                  ))
            ],
          )),
      GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          itemCount: 4,
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
    ]));
  }
}
