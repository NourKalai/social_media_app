import 'package:diginas_app/authentification/screens/home/widgets/appbar_research.dart';
import 'package:diginas_app/authentification/screens/home/widgets/custom_request.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

import '../models/follow_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/search_delegate.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well
  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "imageUrl": "assets/images/user1.png"},
    {"id": 2, "name": "Aragon", "imageUrl": "assets/images/user0.png"},
    {"id": 3, "name": "Bob", "imageUrl": "assets/images/user0.png"},
    {"id": 4, "name": "Ali", "imageUrl": "assets/images/user1.png"},
    {"id": 5, "name": "Nour", "imageUrl": "assets/images/user3.png"},
    {"id": 6, "name": "Yessin", "imageUrl": "assets/images/user2.png"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  String searchValue = '';
  final List<String> _suggestions = [
    'Sam Martin',
    'Nour Kalai',
    'Rihen Houli',
    'Emna Rebai',
    'Sam Martin',
  ];

  @override
  Widget build(BuildContext context) {
    bool follow = false;

    return SafeArea(
      child: Scaffold(
    
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 10, 238, 124),
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      onChanged: (value) => _runFilter(value),
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                            top: 5.0,
                          ),
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 22),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              _foundUsers.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: _foundUsers.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomRequest(
                              imageUrl: _foundUsers[index]["imageUrl"],
                              name: _foundUsers[index]['name']),
                        );

                        // Card(
                        //     key: ValueKey(_foundUsers[index]["id"]),
                        //     color: Colors.amberAccent,
                        //     elevation: 4,
                        //     margin: const EdgeInsets.symmetric(vertical: 10),
                        //     child: ListTile(
                        //         subtitle: Text(
                        //             '${_foundUsers[index]["age"].toString()} years old'),
                        //         leading: CircleAvatar(
                        //           radius: 10,
                        //           backgroundImage: AssetImage(
                        //               _foundUsers[index]["imageUrl"]),
                        //         ),
                        //         title: Text(
                        //           _foundUsers[index]['name'],
                        //         ))
                        //   subtitle: Text(
                        //       '${_foundUsers[index]["age"].toString()} years old'),
                        // ),
                        // //   ),
                        // //   title: Text(_foundUsers[index]['name']),
                        // //   subtitle: Text(
                        // //       '${_foundUsers[index]["age"].toString()} years old'),
                        // // ),
                        // child: Padding(
                        //   padding: const EdgeInsets.only(top: 10),
                        //   child: Row(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Row(
                        //         children: [
                        //           CircleAvatar(
                        //             radius: 30,
                        //             backgroundImage: AssetImage(
                        //                 _foundUsers[index]["id"]["imageUrl"]),
                        //           ),
                        //           const SizedBox(
                        //             width: 15,
                        //           ),
                        //           Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               Text(_foundUsers[index]["id"]["name"],
                        //                   style: Theme.of(context)
                        //                       .textTheme
                        //                       .titleLarge),
                        //               const SizedBox(
                        //                 height: 5,
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //       Padding(
                        //         padding: EdgeInsets.only(
                        //             top: 10, left: follow == false ? 20 : 10),
                        //         child: CustomButton(
                        //           height: 40,
                        //           color: follow == false
                        //               ? Color.fromARGB(255, 10, 238, 124)
                        //               : const Color.fromARGB(
                        //                   255, 238, 234, 234),
                        //           textColor: follow == false
                        //               ? Colors.white
                        //               : Colors.black,
                        //           onTap: () {
                        //             setState(() {
                        //               follow = !follow;
                        //             });
                        //           },
                        //           text:
                        //               follow == false ? "Follow" : "Unfollow",
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // )
                        // child: ListTile(
                        //   leading: Text(
                        //     _foundUsers[index]["id"].toString(),
                        //     style: const TextStyle(fontSize: 24),
                        //   ),
                        //   title: Text(_foundUsers[index]['name']),
                        //   subtitle: Text(
                        //       '${_foundUsers[index]["age"].toString()} years old'),
                        // ),
                        //   );
                      })
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       itemCount: 6,
              //       itemBuilder: ((context, index) {
              //         return CustomRequest(follower: follows[index]);
              //       })),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
