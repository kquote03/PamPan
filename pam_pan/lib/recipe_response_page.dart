import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';

class RecipeResponsePage extends StatelessWidget {
  const RecipeResponsePage(this.aiResponse, {super.key});
  final String aiResponse;

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
              text: aiResponse,
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
