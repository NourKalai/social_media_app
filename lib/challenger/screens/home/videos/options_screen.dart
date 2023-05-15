import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 110),
                    Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.person,
                            size: 18,
                            color: Colors.white,
                          ),
                          radius: 16,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'flutter_developer02',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.verified, size: 15),
                        const SizedBox(width: 6),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Follow',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      'Flutter is beautiful and fast 💙❤💛 ..',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.music_note,
                          size: 15,
                          color: Colors.white,
                        ),
                        const Text(
                          'Original Audio - some music track--',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                    ),
                    const Text('601k',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    const SizedBox(height: 20),
                    const Icon(
                      Icons.comment_rounded,
                      color: Colors.white,
                    ),
                    const Text('1123',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    const SizedBox(height: 20),
                    Transform(
                      transform: Matrix4.rotationZ(5.8),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
