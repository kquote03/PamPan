import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPage();
}

class _AddItemPage extends State<AddItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: const Text('Add Items'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TextField(
                    decoration: InputDecoration(labelText: "Item Name"),
                  ),
                  const SizedBox(height: 12),
                  const TextField(
                    decoration: InputDecoration(labelText: "Expiry Date"),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Category"),
                    items: [
                      'bread',
                      'dairy',
                      'cheese',
                      'chicken',
                      'meats',
                      'fruits',
                      'vegetables',
                      'fish',
                      'party',
                      'other'
                    ].map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Handle category selection
                    },
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Allergens"),
                    items: [
                      'milk',
                      'eggs',
                      'fish',
                      'shellfish',
                      'nuts',
                      'wheat',
                      'soybean',
                      'other',
                      'none'
                    ].map((String allergen) {
                      return DropdownMenuItem<String>(
                        value: allergen,
                        child: Text(allergen),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Handle allergen selection
                    },
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    decoration:
                        const InputDecoration(labelText: "Measurement Unit"),
                    items: ['g', 'kg', 'mL', 'L', 'pieces'].map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Handle unit selection
                    },
                  ),
                  const SizedBox(height: 12),
                  const TextField(
                    decoration: InputDecoration(labelText: "Quantity"),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
