import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:pam_pan/firebase_ai.dart';

String prompt =
    """You are the mascot of a food-related app called Pam, and you help manage your user's pantries by tracking how close every food item's expiry date is. The user is called Khalil. Come up with a simple recipe that includes some, but not all, of the items in this pantry. The recipe can include some minor items that aren't in the pantry and need to be bought, but these items have to be explicitly labelled as such. It has to be simple enough to be done by an amateur, but not too simple that it becomes boring. Make sure your response is personalised to the items in the pantry, so don't be too generic. Additionally, make sure you try to prioritise the items that are about to expire, if that is possible. The list of items is as follows: ("Canned diced tomatoes (28 oz can, Expiry: March 2026)"), ("Canned chickpeas (15 oz can, Expiry: May 31st, 2024)"), ("Canned cream of chicken soup (10.75 oz can, Expiry: December 2025)"), ("All-purpose flour (5 lb bag, Expiry: November 2024)"), ("White rice (10 lb bag, Expiry: February 2025)"), ("Brown rice (5 lb bag, Expiry: August 2024)"), ("Rolled oats (2 lb container, Expiry: October 2024)"), ("Dried pasta (1 lb bag, Expiry: August 2024, Penne)"), ("Dried pasta (1 lb bag, Expiry: December 2024, Spaghetti)"), ("Dried lentils (1 lb bag, Expiry: September 2024)"), ("Sugar (5 lb bag, Expiry: May 2025)"), ("Salt (2 lb box, Expiry: May 2027)"), ("Baking powder (16 oz can, Expiry: June 2024)"), ("Baking soda (1 lb box, Expiry: May 2026)"), ("Olive oil (1 liter bottle, Expiry: March 2026)"), ("Vegetable oil (1 liter bottle, Expiry: February 2024)"), ("Balsamic vinegar (25.4 fl oz bottle, Expiry: January 2027)"), ("Ketchup (20 oz bottle, Expiry: September 2024)"), ("Mustard (12 oz jar, Expiry: June 15th, 2024)"), ("Soy sauce (15 fl oz bottle, Expiry: September 2025)"), ("Black peppercorns (4 oz jar, Expiry: August 2024)"), ("Dried oregano (1 oz jar, Expiry: May 2024)"), ("Ground cumin (2 oz jar, Expiry: June 2024)"), ("Chili flakes (1 oz jar, Expiry: May 2025)"), ("Italian seasoning (2 oz jar, Expiry: April 2025)"), ("Eggs (1 dozen carton, Expiry: June 11th, 2024)"), ("Butter (1 lb stick, Expiry: June 5th, 2024)"), ("Milk (1 gallon carton, Expiry: May 30th, 2024)").""";

class RecipeResponsePage extends StatefulWidget {
  // ignore: use_super_parameters
  RecipeResponsePage({Key? key}) : super(key: key);
  String aiResponse = "";

  @override
  _RecipeResponsePageState createState() => _RecipeResponsePageState();
}

class _RecipeResponsePageState extends State<RecipeResponsePage> {
  @override
  void initState() {
    _genAI();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _genAI() async {
    var aiResponse = await FirebaseAI().textWithoutStream(prompt);
    setState(() {
      widget.aiResponse = aiResponse;
    });
  }

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
              text: widget.aiResponse,
              color: const Color(0xFFE8E8EE),
              tail: false,
              isSender: false,
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(
                        context,
                      ).size.width *
                      0.7),
            ),
          ],
        ),
      ),
    );
  }
}
