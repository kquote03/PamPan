import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPage();
}

class _AddItemPage extends State<AddItemPage> {
  final TextEditingController _controllerItemName = TextEditingController();
  final TextEditingController _controllerExpiryDate = TextEditingController();
  final TextEditingController _controllerQuantity = TextEditingController();

  @override
  void dispose() {
    _controllerItemName.dispose();
    _controllerExpiryDate.dispose();
    _controllerQuantity.dispose();
    super.dispose();
  }

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
                      border: OutlineInputBorder(),
                      labelText: "Item Name",
                      hintText: "Please enter the name of your item",
                    ),
                    controller: _controllerItemName,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Expiry Date",
                      hintText: "YYYY-MM-DD",
                    ),
                    keyboardType: TextInputType.datetime,
                    controller: _controllerExpiryDate,
                    inputFormatters: [_ExpiryDateInputFormatter()],
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
                    dropdownHeight: 250,
                    optionTextStyle: const TextStyle(fontSize: 16),
                    selectedOptionIcon: const Icon(Icons.check_circle),
                    selectionType: SelectionType.single,
                    hint: "Measurement Unit",
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Quantity",
                      hintText: "#",
                    ),
                    keyboardType: TextInputType.number,
                    controller: _controllerQuantity,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(3),
                    ],
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

  _showErrorModalDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return AlertDialog(
          title: const Text("ERROR"),
          content: const Text("_creditCardChecker()"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  _showSimpleModalDialog1(context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 350),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Column(
                    children: [
                      Text('Adding Item'),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                        text: "ok",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                            wordSpacing: 1)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _showSimpleModalDialog2(context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 350),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      // _creditCardChecker(),
                      "test",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                        text: "ok",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                            wordSpacing: 1)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Close"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text =
        newValue.text.replaceAll(RegExp(r'\D'), ''); // Remove non-digits
    final formattedText = _getFormattedText(text);
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _getFormattedText(String text) {
    if (text.isEmpty) return '';

    final buffer = StringBuffer();

    if (text.length >= 4) {
      buffer.write(text.substring(0, 4));
    } else {
      buffer.write(text);
    }

    if (text.length > 4) {
      buffer.write('-');
    }

    if (text.length >= 6) {
      buffer.write(text.substring(4, 6));
    } else if (text.length > 4) {
      buffer.write(text.substring(4));
    }

    if (text.length > 6) {
      buffer.write('-');
    }

    if (text.length >= 8) {
      buffer.write(text.substring(6, 8));
    } else if (text.length > 6) {
      buffer.write(text.substring(6));
    }

    return buffer.toString();
  }
}
