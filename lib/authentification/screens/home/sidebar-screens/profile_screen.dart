import 'package:diginas_app/authentification/screens/home/models/comment_model.dart';
import 'package:diginas_app/authentification/screens/home/sidebar-screens/friends.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "package:transparent_image/transparent_image.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../detailed_post_screen.dart';
import '../feed_screen.dart';
import '../models/post_model.dart';
import '../widgets/side_bar.dart';

class ProfileScreen extends StatefulWidget {
  final String image;
  final String name;

  const ProfileScreen({super.key, required this.image, required this.name});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    List tags = [
      "${AppLocalizations.of(context)!.challenge}1",
      "${AppLocalizations.of(context)!.challenge}2",
      "${AppLocalizations.of(context)!.challenge}3",
      "${AppLocalizations.of(context)!.challenge}4"
    ];
    List<String> imageList = [
      'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
      'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
      'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
      'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    ];
    List days = [
      "${AppLocalizations.of(context)!.week}1",
      "${AppLocalizations.of(context)!.week}2",
      "${AppLocalizations.of(context)!.week}3",
      "${AppLocalizations.of(context)!.week}4",
      "${AppLocalizations.of(context)!.week}5",
      "${AppLocalizations.of(context)!.week}6",
      "${AppLocalizations.of(context)!.week}7",
      "${AppLocalizations.of(context)!.week}8",
    ];
    return SafeArea(
      child: Scaffold(
          drawer: const SideBar(),
          key: scaffoldKey,
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
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.more_vert),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 7),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(widget.image),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 38),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                  ),
                                  child: Text(
                                      AppLocalizations.of(context)!.tunisia,
                                      style: const TextStyle(
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
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                            children: [
                                          TextSpan(
                                            text: AppLocalizations.of(context)!
                                                .followers,
                                            style: const TextStyle(
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
                            children: [
                              TextButton(
                                child: Center(
                                  child: RichText(
                                      text: TextSpan(
                                          text: '2K\n',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                          children: [
                                        TextSpan(
                                          text: AppLocalizations.of(context)!
                                              .following,
                                          style: const TextStyle(
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
                            child: Text(AppLocalizations.of(context)!.follow,
                                style: const TextStyle(
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
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 33, right: 24, left: 25, bottom: 25),
                          child: Text(
                            AppLocalizations.of(context)!.portfolio,
                            style: const TextStyle(
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
                                        right: 20.0,
                                        top: 10.0,
                                        left: 20.0,
                                      ),
                                      child: index == 0
                                          ? Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  days[index],
                                                  style: const TextStyle(
                                                      color: Color(0xff434AE8),
                                                      fontSize: 15),
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
                                return GestureDetector(
                                  onTap: () {
                                    Post newPost = Post(
                                        authorName: widget.name,
                                        authorImageUrl: widget.image,
                                        timeAgo: 'Now',
                                        imageUrl: imageList[index]);

                                    setState(() {
                                      posts.add(newPost);
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewPostScreen(
                                          nComments: comments.length,
                                          nLikes: 200,
                                          post: newPost,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(207, 230, 217, 217),
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
