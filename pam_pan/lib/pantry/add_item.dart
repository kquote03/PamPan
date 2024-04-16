// import 'package:flutter/material.dart';

// class AddItem extends StatefulWidget {
//   const AddItem({super.key});

//   @override
//   State<AddItem> createState() => _AddItem();
// }

// class _AddItem extends State<AddItem> {
//   final TextEditingController _controllerItemName = TextEditingController();
//   final TextEditingController _controllerExpiryDate = TextEditingController();
//   final TextEditingController _controllerCategoryName = TextEditingController();
//   final TextEditingController _controllerAmount = TextEditingController();
//   final TextEditingController _controllerAmount = TextEditingController();
//   final TextEditingController _controllerAmount = TextEditingController();

//   @override
//   void dispose() {
//     _controllerItemName.dispose();
//     _controllerDate.dispose();
//     _controllerCVC.dispose();
//     _controllerAmount.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               "Add Item",
//               style: TextStyle(
//                 fontSize: 24,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: TextField(
//                         controller: _controllerDate,
//                         decoration: const InputDecoration(
//                           labelText: 'Item Name',
//                           // hintText: 'MM/YY',
//                         ),
//                         keyboardType: TextInputType.number,
//                         // inputFormatters: [
//                         //   LengthLimitingTextInputFormatter(5),
//                         //   _ExpirationDateInputFormatter(),
//                         // ],
//                       ),
//                     ),
//                     const SizedBox(width: 16.0),
//                     Expanded(
//                       child: TextField(
//                         controller: _controllerCVC,
//                         decoration: const InputDecoration(
//                           labelText: 'CVC',
//                           // hintText: 'XXX',
//                         ),
//                         // keyboardType: TextInputType.number,
//                         // inputFormatters: [
//                         //   LengthLimitingTextInputFormatter(3),
//                         //   _CVCInputFormatter(),
//                         // ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 // const TextField(
//                 //   decoration: InputDecoration(
//                 //     labelText: 'Card Name',
//                 //   ),
//                 // ),
//                 TextField(
//                   controller: _controllerAddItem,
//                   decoration: const InputDecoration(
//                     labelText: 'Add Item',
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: TextField(
//                         controller: _controllerDate,
//                         decoration: const InputDecoration(
//                           labelText: 'Expiration Date',
//                           // hintText: 'MM/YY',
//                         ),
//                         keyboardType: TextInputType.number,
//                         // inputFormatters: [
//                         //   LengthLimitingTextInputFormatter(5),
//                         //   _ExpirationDateInputFormatter(),
//                         // ],
//                       ),
//                     ),
//                     const SizedBox(width: 16.0),
//                     Expanded(
//                       child: TextField(
//                         controller: _controllerCVC,
//                         decoration: const InputDecoration(
//                           labelText: 'CVC',
//                           // hintText: 'XXX',
//                         ),
//                         // keyboardType: TextInputType.number,
//                         // inputFormatters: [
//                         //   LengthLimitingTextInputFormatter(3),
//                         //   _CVCInputFormatter(),
//                         // ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 TextField(
//                   controller: _controllerAmount,
//                   decoration: const InputDecoration(
//                     labelText: 'Amount (in Dirhams)',
//                     // hintText: 'AED XXX.XX',
//                   ),
//                   // keyboardType: TextInputType.number,
//                   // inputFormatters: [
//                   //   CurrencyTextInputFormatter(
//                   //     symbol: "AED ",
//                   //     locale: "en",
//                   //   ),
//                   // ],
//                 ),
//                 const SizedBox(height: 32.0),
//                 // TextButton(
//                 //   onPressed: () {
//                 //     if (_creditCardChecker() ==
//                 //         "Donation successful. Thank you. The hungry children thank you.") {
//                 //       _showSimpleModalDialog2(context);
//                 //       _showSimpleModalDialog1(context);
//                 //       Timer(const Duration(seconds: 3), () {
//                 //         Navigator.pop(context);
//                 //       });
//                 //     } else {
//                 //       _showErrorModalDialog(context);
//                 //       _showSimpleModalDialog1(context);
//                 //       Timer(const Duration(seconds: 3), () {
//                 //         Navigator.pop(context);
//                 //       });
//                 //     }
//                 //   },
//                 //   child: const Text(
//                 //     'Process Donation',
//                 //     style: TextStyle(color: Colors.black),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
