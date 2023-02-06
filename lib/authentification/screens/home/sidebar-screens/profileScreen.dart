// ignore: file_names
// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:diginas_app/authentification/screens/home/sidebar-screens/friends.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/sideBar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    List tags = ['challenge1', 'challenge2', 'challenge3', 'challenge4'];
    List<String> imageList = [
      'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
      'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
      'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
      'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    ];
    List days = [
      'week1',
      'week2',
      'week3',
      'week4',
      'week5',
      'week6',
      'week7',
      'week8'
    ];
    return SafeArea(
      child: Scaffold(
          drawer: const SideBar(),
          key: _scaffoldKey,
          appBar: AppBar(
            // backgroundColor: const Color.fromARGB(66, 122, 119, 119),

            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            elevation: 0,
            actions: [
              Builder(builder: (context) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                );
              })
            ],
          ),
          body: SingleChildScrollView(
              child: Material(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 28.0, top: 7),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/nan.png"),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 38),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Nour Kalai',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.location_on,
                                  size: 17,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8.0,
                                  ),
                                  child: Text('Tunisia',
                                      style: TextStyle(
                                          wordSpacing: 2, letterSpacing: 4)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ]),
                Padding(
                    padding: const EdgeInsets.only(
                        right: 38.0, left: 38, top: 15, bottom: 12),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextButton(
                                  child: Center(
                                    child: RichText(
                                        text: TextSpan(
                                            text: '17K\n',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                            children: [
                                          TextSpan(
                                            text: 'followers',
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 15),
                                          ),
                                        ])),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const FollowersScreen()));
                                  },
                                ),
                              ]),
                          Container(
                            color: Colors.white,
                            width: 1,
                            height: 22,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '387',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              Text(
                                'following',
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.white,
                            width: 1,
                            height: 22,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 18, right: 18, top: 8, bottom: 8),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(33)),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 44, 92, 224),
                                    Color.fromARGB(255, 10, 238, 124),
                                  ],
                                  begin: Alignment.bottomRight,
                                  end: Alignment.centerLeft),
                            ),
                            child: const Text('follow',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ])),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 15),
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(34),
                      )),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 33, right: 24, left: 25, bottom: 25),
                          child: Text(
                            'Portfolio',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 33,
                              color: Color.fromARGB(255, 10, 238, 124),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 24, left: 25),
                          height: 44,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: tags.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              221, 34, 35, 37))),
                                  margin: const EdgeInsets.only(right: 13),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 13,
                                        bottom: 5,
                                        right: 20,
                                        left: 20),
                                    child: Text(
                                      tags[index],
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 25),
                            height: 40,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: days.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          right: 17.0, top: 10.0, left: 20.0),
                                      child: index == 0
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  days[index],
                                                  style: const TextStyle(
                                                      color: Color(0xff434AE8),
                                                      fontSize: 19),
                                                ),
                                                const CircleAvatar(
                                                  radius: 2,
                                                  backgroundColor:
                                                      Color(0xff43aAE8),
                                                )
                                              ],
                                            )
                                          : Text(days[index],
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                          255, 22, 20, 20)
                                                      .withOpacity(0.9),
                                                  fontSize: 19)));
                                })),
                        Container(
                          height: 1000,
                          margin: const EdgeInsets.all(12),
                          child: StaggeredGridView.countBuilder(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 12,
                              itemCount: imageList.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(207, 230, 217, 217),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: imageList[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              staggeredTileBuilder: (index) {
                                return StaggeredTile.count(
                                    1, index.isEven ? 1.2 : 1.8);
                              }),
                        ),
                      ]),
                ),
              ])))),
    );
  }
}
