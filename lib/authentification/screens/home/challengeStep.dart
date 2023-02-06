import 'package:diginas_app/authentification/screens/home/sidebar-screens/models/info.dart';
import 'package:diginas_app/authentification/screens/home/video_detail.dart';
import 'package:flutter/material.dart';

class ChallengeStep extends StatefulWidget {
  const ChallengeStep({super.key});

  @override
  State<ChallengeStep> createState() => _ChallengeStepState();
}

class _ChallengeStepState extends State<ChallengeStep> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Steps",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black54),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.calendar_today_outlined,
                  size: 20, color: Colors.black54),
              const SizedBox(
                width: 15,
              ),
              const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              const Text(
                "Your program",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
              const Text(
                "Details",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 32, 218, 41)),
              ),
              const Icon(Icons.arrow_forward_ios,
                  size: 20, color: Color.fromARGB(255, 32, 218, 41))
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 126, 235, 130),
                  Color.fromARGB(255, 100, 235, 130)
                ], begin: Alignment.topLeft, end: Alignment.centerLeft),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(5, 10),
                      blurRadius: 2,
                      color: Colors.green.shade100)
                ]),
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Next Step",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 9),
                  const Text(
                    "Radio passage",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "And Tv Show",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.timer,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "7 days",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromARGB(255, 50, 172, 54),
                                    blurRadius: 8,
                                    offset: Offset(4, 8)),
                              ]),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const VideoInfo(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.play_circle_fill_outlined,
                              color: Colors.white,
                              size: 60,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        // ignore: sized_box_for_whitespace
        Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    // gradient: LinearGradient(colors: [
                    //   Color.fromARGB(255, 200, 245, 202),
                    //   Color.fromARGB(255, 100, 235, 130)
                    // ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/card.png"),
                        fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(8, 10),
                          blurRadius: 30,
                          color: const Color.fromARGB(255, 156, 235, 218)
                              .withOpacity(0.8)),
                      BoxShadow(
                          offset: const Offset(-1, -5),
                          blurRadius: 30,
                          color: Colors.green.shade100)
                    ]),
              ),
              Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.only(right: 260, bottom: 40, top: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/run2.png"),
                        fit: BoxFit.fill),
                  )),
              Container(
                width: double.maxFinite,
                height: 100,
                margin: const EdgeInsets.only(left: 150, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("You are doing great",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 75, 155, 219))),
                    const SizedBox(height: 10),
                    RichText(
                        text: TextSpan(
                            text: "Keep it up\n",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                color: Colors.grey.shade500,
                                fontSize: 16),
                            children: const [TextSpan(text: "stick to your plan")]))
                  ],
                ),
              )
            ]),
          ),
          Row(
            children: const [
               Text(
                "Competitors",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
              child: OverflowBox(
            maxWidth: MediaQuery.of(context).size.width,
            child: ListView.builder(
                padding: const EdgeInsets.only(left: 30, bottom: 40),
                itemCount: (Cards.length.toDouble() / 2).toInt(), //2
                itemBuilder: (_, i) {
                  int a = 2 * i;
                  int b = 2 * i + 1;
                  return Row(
                    children: [
                      Container(
                        height: 150,
                        margin: const EdgeInsets.only(bottom: 15),
                        width: (MediaQuery.of(context).size.width - 90) / 2,
                        padding: const EdgeInsets.only(
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage((Cards[a].authorImageUrl)),
                                // colorFilter: ColorFilter.linearToSrgbGamma(),
                                opacity: 0.5),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(5, 5),
                                  color: const Color.fromARGB(255, 68, 163, 80)
                                      .withOpacity(0.1)),
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(-5, -5),
                                  color: const Color.fromARGB(255, 68, 163, 80)
                                      .withOpacity(0.1))
                            ]),
                        child: Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(Cards[a].text,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        height: 150,
                        width: (MediaQuery.of(context).size.width - 90) / 2,
                        padding: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage((Cards[b].authorImageUrl)),
                                // colorFilter: ColorFilter.linearToSrgbGamma(),
                                opacity: 0.5),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(5, 5),
                                  color: const Color.fromARGB(255, 68, 163, 80)
                                      .withOpacity(0.1)),
                              BoxShadow(
                                  blurRadius: 3,
                                  offset: const Offset(-5, -5),
                                  color: const Color.fromARGB(255, 68, 163, 80)
                                      .withOpacity(0.1))
                            ]),
                        child: Center(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(Cards[b].text,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ))
        ],
      ),
    )));
  }
}
