import 'package:diginas_app/authentification/screens/home/widgets/content_header.dart';
import 'package:diginas_app/authentification/screens/home/widgets/content_list.dart';
import 'package:diginas_app/authentification/screens/home/widgets/custom_appbar.dart';
import 'package:diginas_app/authentification/screens/home/widgets/preview.dart';
import 'package:flutter/material.dart';


import 'models/data_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late ScrollController _scrollController;
 final double _scrollOffset = 0.0;
  @override
  // void initState() {
  //   _scrollController = ScrollController()
  //     ..addListener(() {
  //       setState(() {
  //         _scrollOffset = _scrollController.offset;
  //       });
  //     });
  //   super.initState();
  // }
  @override
  void dispose() {
    // _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 80),
          child: CustomAppBar(
            scrollOffset: _scrollOffset,
          ),
        ),
        body: const CustomScrollView(
          // controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
                child: ContentHeader(featuredContent: sintelContent)),
            SliverPadding(
              padding: EdgeInsets.only(top: 20),
              sliver: SliverToBoxAdapter(
                  child: Preview(title: 'Previews', contentList: previews)),
            ),
            SliverToBoxAdapter(
              child: ContentList(title: "My List", contentList: myList),
            ),
            SliverToBoxAdapter(
              child: ContentList(
                  title: "All Chalenges", contentList: myList, isAll: true),
            ),
            SliverToBoxAdapter(
              child: ContentList(title: "Trending", contentList: myList),
            ),
          ],
        ),
      ),
    );
  }
}