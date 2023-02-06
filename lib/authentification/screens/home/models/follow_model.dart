import 'package:http/http.dart';

class Follow {
  String name;
  String imageUrl;

  Follow({
    required this.name,
    required this.imageUrl,
  });
}

final List<Follow> follows = [
  Follow(
    name: 'Sam Martin',
    imageUrl: 'assets/images/user0.png',
  ),
  Follow(
    name: 'Nour Kalai',
    imageUrl: 'assets/images/user1.png',
  ),
  Follow(
    name: 'Rihen Houli',
    imageUrl: 'assets/images/user2.png',
  ),
  Follow(
    name: 'Emna Rebai',
    imageUrl: 'assets/images/user3.png',
  ),
  Follow(
    name: 'Sam Martin',
    imageUrl: 'assets/images/user4.png',
  ),
  Follow(
    name: 'Sam Martin',
    imageUrl: 'assets/images/user0.png',
  ),
  Follow(
    name: 'Sam Martin',
    imageUrl: 'assets/images/user2.png',
  ),
   Follow(
    name: 'Emna Rebai',
    imageUrl: 'assets/images/user3.png',
  ),
  Follow(
    name: 'Sam Martin',
    imageUrl: 'assets/images/user4.png',
  ),
  Follow(
    name: 'Sam Martin',
    imageUrl: 'assets/images/user0.png',)
];
