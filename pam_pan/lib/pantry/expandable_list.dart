// import 'package:flutter/material.dart';
// import 'package:pam_pan/pantry/category.dart';

// var data = {
//   "01/01/2018": [
//     ["CocaCola", "2024-05-01", "330", "mL"],
//     ["Dominos Pizza", "2024-05-01", "330", "mL"],
//   ],
//   "04/01/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/02/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/03/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/04/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/05/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/06/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/07/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/08/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/09/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/10/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/11/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/12/2018": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/12/2019": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/13/2019": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/14/2019": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/15/2019": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
//   "04/16/2019": [
//     ["Appy Fizz", "2024-05-01", "330", "mL"],
//     ["Galaxy S9+", "2024-05-01", "330", "mL"],
//     ["Apple iPhone X", "2024-05-01", "330", "mL"],
//   ],
// };

// List<String> dataKeys = data.keys.toList();

// class ExpandableList extends StatefulWidget {
//   const ExpandableList({super.key});

//   @override
//   _ExpandableList createState() => _ExpandableList();
// }

// class _ExpandableList extends State<ExpandableList> {
//   List<Widget> _buildList(int keyIndex) {
//     List<Widget> list = [];

//     for (int i = 0; i < data[dataKeys[keyIndex]]!.length; i++) {
//       list.add(
//         Row(
//           children: <Widget>[
//             Row(
//               children: [
//                 Row(
//                   children: [
//                     const Text(
//                       '''

// Item Name:
// Expiry Date:
// Quantity/Amount:
// ''',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     const SizedBox(),
//                     Text(
//                       '''
        
//         ${data[dataKeys[keyIndex]]![i][0]}
//         ${data[dataKeys[keyIndex]]![i][1]}
//         ${data[dataKeys[keyIndex]]![i][2]} ${data[dataKeys[keyIndex]]![i][3]}
//         ''',
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ],
//             )
//           ],
//         ),
//       );
//     }
//     return list;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 250, 240),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 255, 250, 240),
//         title: const Text("My Pantry"),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Container(
//         color: const Color.fromARGB(255, 255, 250, 240),
//         child: ListView.builder(
//           itemCount: categories.length,
//           itemBuilder: (BuildContext context, int keyIndex) {
//             return Card(
//               color: const Color.fromARGB(255, 71, 50, 39),
//               child: ExpansionTile(
//                 enableFeedback: true,
//                 iconColor: Colors.white,
//                 childrenPadding: const EdgeInsets.only(left: 20),
//                 leading: categories[keyIndex].icon,
//                 title: categories[keyIndex].nameText,
//                 children: <Widget>[
//                   Column(
//                     children: _buildList(keyIndex),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
