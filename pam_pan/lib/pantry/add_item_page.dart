import 'dart:async';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:pam_pan/MiriamMap/miriam_map.dart';
// Old SQLite-based local database
//import 'package:pam_pan/backend/dbinterface.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/pantry/barcode_api.dart';
import 'package:pam_pan/records.dart';
import 'package:pam_pan/backend/appwrite_client.dart';

var databases = Databases(client);

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPage();
}

class _AddItemPage extends State<AddItemPage> {
  final TextEditingController _controllerItemName = TextEditingController();
  final TextEditingController _controllerExpiryDate = TextEditingController();
  final MultiSelectController<String> _controllerCategory =
      MultiSelectController();
  final MultiSelectController<String> _controllerAllergens =
      MultiSelectController();
  final MultiSelectController<String> _controllerMeasurement =
      MultiSelectController();
  final TextEditingController _controllerQuantity = TextEditingController();

  @override
  void dispose() {
    _controllerItemName.dispose();
    _controllerExpiryDate.dispose();
    _controllerCategory.dispose();
    _controllerAllergens.dispose();
    _controllerMeasurement.dispose();
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
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Item Name",
                            hintText: "Please enter the name of your item",
                          ),
                          validator: (String? value) {
                            _itemNameChecker(value)
                                ? 'Please enter a valid name'
                                : null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _controllerItemName,
                        ),
                      ),
                      IconButton(
                          onPressed: _barcodeClick,
                          icon: const Icon(Icons.barcode_reader))
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Expiry Date",
                      hintText: "YYYY-MM-DD",
                    ),
                    validator: (String? value) {
                      !_expiryDateChecker(value)
                          ? "Please insert a valid expiry date"
                          : null;
                    },
                    keyboardType: TextInputType.datetime,
                    controller: _controllerExpiryDate,
                    inputFormatters: [_ExpiryDateInputFormatter()],
                  ),
                  const SizedBox(height: 12),
                  MultiSelectDropDown<String>(
                    controller: _controllerCategory,
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
                    dropdownHeight: 200,
                    optionTextStyle: const TextStyle(fontSize: 16),
                    selectedOptionIcon: const Icon(Icons.check_circle),
                    selectionType: SelectionType.multi,
                    hint: "Category",
                  ),
                  const SizedBox(height: 12),
                  MultiSelectDropDown<String>(
                    controller: _controllerAllergens,
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
                    controller: _controllerMeasurement,
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
                    onPressed: () async {
                      if (_itemNameChecker(_controllerItemName.text) &&
                          _quantityChecker() &&
                          _expiryDateChecker(_controllerExpiryDate.text)) {
                        addFoodItem(
                          _controllerItemName.text,
                          _controllerExpiryDate.text,
                          _controllerCategory.selectedOptions,
                          _controllerAllergens.selectedOptions[0].label,
                          _controllerMeasurement.selectedOptions[0].label,
                          int.parse(_controllerQuantity.text),
                        );
                        //TODO: Remove Test
                        print(await BarcodeApi()
                            .getFoodItemByUPC('8690504019091'));
                        //print(await DBInterface().getFoodItemList());

                        _showSimpleItemSuccessDialog(context);
                        _showAddingItemDialog(context);
                        Timer(const Duration(seconds: 3), () {
                          Navigator.of(context, rootNavigator: true).pop();
                        });
                        // events.addAll({
                        //   DateTime.parse(_controllerExpiryDate.text): [
                        //     Event(_controllerItemName.text)
                        //   ]
                        // });
                      } else {
                        _showErrorModalDialog(context);
                        _showAddingItemDialog(context);
                        Timer(const Duration(seconds: 3), () {
                          Navigator.of(context, rootNavigator: true).pop();
                        });
                      }
                    },
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
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        destinations: [
          NavigationDestination(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.home,
                size: 35,
                color: Colors.black,
              ),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const MiriamMap();
                    },
                  ),
                );
              },
              icon:
                  const Icon(Icons.location_on, size: 35, color: Colors.black),
            ),
            label: 'Map',
          ),
          NavigationDestination(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddItemPage();
                    },
                  ),
                );
              },
              icon: const Icon(Clarity.plus_circle_solid,
                  size: 35, color: Colors.black),
            ),
            label: 'Camera',
          ),
          NavigationDestination(
            icon: IconButton(
              icon: const Icon(
                Icons.receipt,
                size: 35,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Records();
                    },
                  ),
                );
              },
            ),
            label: 'Records',
          ),
        ],
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 70,
        // onDestinationSelected: (value) {},
        selectedIndex: 0,
        surfaceTintColor: const Color.fromARGB(255, 255, 255, 242),
        indicatorColor: const Color.fromARGB(255, 255, 255, 242),
      ),
    );
  }

  bool _itemNameChecker(String? value) {
    return !(value == null || value.isEmpty);
  }

  bool _expiryDateChecker(String? value) {
    //TODO: Make the code below use the passed value instead of re-extracting the text
    int dateYYYY;
    int dateMM;
    int dateDD;

    if (_controllerExpiryDate.text.isNotEmpty &&
        _controllerExpiryDate.text.length == 10) {
      dateYYYY = int.parse(
        _controllerExpiryDate.text[0] +
            _controllerExpiryDate.text[1] +
            _controllerExpiryDate.text[2] +
            _controllerExpiryDate.text[3],
      );
      dateMM = int.parse(
        _controllerExpiryDate.text[5] + _controllerExpiryDate.text[6],
      );
      dateDD = int.parse(
        _controllerExpiryDate.text[8] + _controllerExpiryDate.text[9],
      );
    } else {
      dateYYYY = -1;
      dateMM = -1;
      dateDD = -1;
    }

    bool expiryDateCorrect = false;

    DateTime currentDate = DateTime.now();
    var formatterYear = DateFormat('y');
    var formatterMonth = DateFormat('MM');
    var formatterDay = DateFormat('dd');
    String formattedYear = formatterYear.format(currentDate);
    String formattedMonth = formatterMonth.format(currentDate);
    String formattedDay = formatterDay.format(currentDate);
    int currentYear = int.parse(formattedYear);
    int currentMonth = int.parse(formattedMonth);
    int currentDay = int.parse(formattedDay);

    if (1 <= dateMM &&
        dateMM <= 12 &&
        dateYYYY >= currentYear &&
        dateDD >= 01 &&
        dateDD <= 31) {
      expiryDateCorrect = true;
    } else {
      expiryDateCorrect = false;
    }

    if (dateYYYY == currentYear) {
      if (dateMM == currentMonth) {
        if (dateDD < currentDay) {
          expiryDateCorrect = false;
        } else {
          expiryDateCorrect = true;
        }
      }
      if (dateMM < currentMonth) {
        expiryDateCorrect = false;
      } else {
        expiryDateCorrect = true;
      }
    }
    return expiryDateCorrect;
  }

  bool _quantityChecker() {
    bool quantityCorrect = false;

    if (_controllerExpiryDate.text.isNotEmpty &&
        _controllerQuantity.text.length < 4) {
      quantityCorrect = true;
    }
    return quantityCorrect;
  }

  void addFoodItem(String item, String expiryDate, List<ValueItem<String>> category,
      String allergens, String measurements, int quantity) {
        // Convert ValueItem to just the values.
        List<String> categories = <String>[];
        for(var i in category) {
          categories.add(i.value??'');
        }
        print(categories);
      var promise = databases.createDocument(
        databaseId: '6650884f00137e1b1fcd',
        collectionId: '6650886f0027a739c072',
        documentId: ID.unique(),
        data: { "name": item, "expiryDate": expiryDate, "categories": categories, "measurementUnit": measurements, "quantity": quantity }
        );
//    DBInterface().insertFoodItem(
//        item, expiryDate, category, allergens, measurements, quantity);
  }

  _showErrorModalDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return AlertDialog(
          title: const Text("ERROR"),
          content: const Text(
              "Invalid input: Errors in one (or more) text fields. Please try again. - Pam"),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _showAddingItemDialog(context) {
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

  _showSimpleItemSuccessDialog(context) {
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
                      "Item added successfully and is now tracked. - Pam",
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
                        Navigator.of(context, rootNavigator: true).pop();
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

  void _barcodeClick() async {
    // Launches the barcode reader, then (inshallah) will interface with the API
    // Then finally fills the fields with the data from the API.
    _controllerItemName.text = (await BarcodeApi()
            .getFoodItemByUPC((await BarcodeScanner.scan()).rawContent))
        .itemName;
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
