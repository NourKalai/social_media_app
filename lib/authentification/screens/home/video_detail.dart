import 'package:flutter/material.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green, Colors.greenAccent],
                begin: FractionalOffset(0.0, 0.4),
                end: Alignment.topRight)),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 20),
            width: MediaQuery.of(context).size.width,
            height: 280,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(child: Container()),
                    const Icon(Icons.info_outline,
                        size: 20, color: Colors.white),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Radio passage",
                  style: TextStyle(
                      fontSize: 25, color: Colors.white, fontFamily: "Poppins"),
                ),
                const SizedBox(height: 5),
                const Text(
                  "And Tv Show",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.2)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                      ),
                      child: Row(
                        //centrer lektiba fi wost l wedget
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.timer,
                              size: 20, color: Colors.white),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "2 days",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 230,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.2)
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                      ),
                      child: Row(
                        //centrer lektiba fi wost l wedget
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.handyman,
                              size: 20, color: Colors.white),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Gain 5 coins",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50),
                    )),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 30),
                        const Text(
                          "Step 1:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(Icons.loop,
                                size: 30, color: Colors.green.shade600),
                            const SizedBox(width: 10),
                            Text(
                              "3 times",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                  ],
                )),
          )
        ]),
      ),
    );
  }
}
