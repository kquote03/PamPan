import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

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
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Item Name"),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Expiry Date"),
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 12),
                  MultiSelectDropDown<String>(
                    onOptionSelected:
                        (List<ValueItem<String>> selectedOptions) {},
                    options: const [
                      ValueItem(label: 'Bread', value: 'bread'),
                      ValueItem(label: 'Dairy', value: 'dairy'),
                      ValueItem(label: 'Cheese', value: 'cheese'),
                      ValueItem(label: 'Meats', value: 'meats'),
                      ValueItem(label: 'Fruits', value: 'fruits'),
                      ValueItem(label: 'Vegetables', value: 'vegetables'),
                      ValueItem(label: 'Fish', value: 'fish'),
                      ValueItem(label: 'Party', value: 'party'),
                      ValueItem(label: 'Other', value: 'other'),
                    ],
                    borderColor: Colors.black45,
                    borderWidth: 1,
                    hintColor: Colors.black,
                    borderRadius: 0,
                    fieldBackgroundColor:
                        const Color.fromARGB(255, 255, 250, 240),
                    focusedBorderColor:
                        const Color.fromARGB(255, 113, 216, 244),
                    dropdownHeight: 450,
                    optionTextStyle: const TextStyle(fontSize: 16),
                    selectedOptionIcon: const Icon(Icons.check_circle),
                    selectionType: SelectionType.single,
                    hint: "Category",
                  ),
                  const SizedBox(height: 12),
                  MultiSelectDropDown<String>(
                    onOptionSelected:
                        (List<ValueItem<String>> selectedOptions) {},
                    options: const [
                      ValueItem(label: 'None', value: 'none'),
                      ValueItem(label: 'Milk', value: 'milk'),
                      ValueItem(label: 'Eggs', value: 'fish'),
                      ValueItem(label: 'Fish', value: 'fish'),
                      ValueItem(label: 'Shellfish', value: 'shellfish'),
                      ValueItem(label: 'Nuts', value: 'nuts'),
                      ValueItem(label: 'Wheat', value: 'wheat'),
                      ValueItem(label: 'Soybean', value: 'soybean'),
                      ValueItem(label: 'Other', value: 'other'),
                    ],
                    disabledOptions: const [
                      ValueItem(label: 'Other', value: 'other')
                    ],
                    borderColor: Colors.black45,
                    borderWidth: 1,
                    hintColor: Colors.black,
                    borderRadius: 0,
                    searchEnabled: true,
                    fieldBackgroundColor:
                        const Color.fromARGB(255, 255, 250, 240),
                    focusedBorderColor:
                        const Color.fromARGB(255, 113, 216, 244),
                    dropdownHeight: 450,
                    optionTextStyle: const TextStyle(fontSize: 16),
                    selectedOptionIcon: const Icon(Icons.check_circle),
                    selectionType: SelectionType.multi,
                    hint: "Allergens",
                  ),
                  const SizedBox(height: 12),
                  MultiSelectDropDown<String>(
                    onOptionSelected:
                        (List<ValueItem<String>> selectedOptions) {},
                    options: const [
                      ValueItem(label: 'g', value: 'g'),
                      ValueItem(label: 'kg', value: 'kg'),
                      ValueItem(label: 'mL', value: 'mL'),
                      ValueItem(label: 'L', value: 'L'),
                      ValueItem(label: 'Pieces', value: 'pieces'),
                    ],
                    borderColor: Colors.black45,
                    borderWidth: 1,
                    borderRadius: 0,
                    hintColor: Colors.black,
                    fieldBackgroundColor:
                        const Color.fromARGB(255, 255, 250, 240),
                    focusedBorderColor:
                        const Color.fromARGB(255, 113, 216, 244),
                    dropdownHeight: 450,
                    optionTextStyle: const TextStyle(fontSize: 16),
                    selectedOptionIcon: const Icon(Icons.check_circle),
                    selectionType: SelectionType.single,
                    hint: "Measurement Unit",
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Quantity"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Add Item',
                      style: TextStyle(color: Colors.black),
                    ),
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
