class Card {
  String authorImageUrl;
  String text;

  Card({
    required this.authorImageUrl,
    required this.text,
  });
}

final List<Card> Cards = [
  Card(
    authorImageUrl: 'assets/images/user2.png',
    text: 'Sandra Tie',
  ),
  Card(
    authorImageUrl: 'assets/images/user3.png',
    text: 'Vika Levy',
  ),
  Card(
    authorImageUrl: 'assets/images/user4.png',
    text: 'Pascal Houli',
  ),
  Card(
    authorImageUrl: 'assets/images/user1.png',
    text: 'Rihen Houli',
  ),
  Card(
    authorImageUrl: 'assets/images/user0.png',
    text: 'Sali Monroe',
  ),
];
