import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';


class RecipeResposePage extends StatefulWidget {
  const RecipeResposePage({super.key});

  @override
  State<RecipeResposePage> createState() => _RecipeResposePageState();
}

class _RecipeResposePageState extends State<RecipeResposePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat with Pam!"),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/profile/pam_profile.png',
                  ),
                ),
              ],
            ),
            BubbleSpecialThree(
              text: ,
              color: const Color(0xFFE8E8EE),
              tail: false,
              isSender: false,
            ),
          ],
        ),
      ),
    );
  }
}
