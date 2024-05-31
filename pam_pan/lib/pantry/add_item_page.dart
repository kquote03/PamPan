import 'dart:async';
import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
// Old SQLite-based local database
//import 'package:pam_pan/backend/dbinterface.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:pam_pan/pantry/barcode_api.dart';
import 'package:pam_pan/backend/appwrite_client.dart';
import 'package:pam_pan/bottom_bar.dart';
import 'package:pam_pan/pantry/food_item.dart';

var databases = Databases(client);
bool isEditMode = false;

class AddItemPage extends StatefulWidget {
  String? id;
  FoodItem? fooditem;
  AddItemPage({super.key, this.id, this.fooditem});

  @override
  State<AddItemPage> createState() => _AddItemPage();
}

class _AddItemPage extends State<AddItemPage> {
  final TextEditingController _controllerItemName = TextEditingController();
  final TextEditingController _controllerExpiryDate = TextEditingController();
  final TextEditingController _controllerCategory = TextEditingController();
  final MultiSelectController<String> _controllerAllergens =
      MultiSelectController();
  final _controllerMeasurement = TextEditingController();
  final TextEditingController _controllerQuantity = TextEditingController();
  final List<String> categoryList = [];

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

  var items;

  @override
  void initState() {
    super.initState();
    isEditMode = false;
    if (widget.id != null) {
      isEditMode = true;
      _getItemsAndSetControllers();
    } else if (widget.fooditem != null) {
      isEditMode = true;
      _setItemDetails(widget.fooditem!);
    }
    _getCategories();
  }

  Future<void> _getCategories() async {
    for (var i in await getCategories()) {
      categoryList.add(i);
    }
    // FOR THE RECORD
    // I came accross this solution by TOTAL ACCIDENT
    // I have a habit of frequently saving my work (trauma from losing work)
    // and by that I mean I save after each line. (:w)
    // vscode hot-reloads the app after each save.
    // So I saved when having written the incomplete code, only for it to
    // magically work. subhaaanallahh XD
    setState(() {});
  }

  _getItemsAndSetControllers() async {
    List<FoodItem> items = await getItemsById(widget.id);
    print(items);
    _controllerItemName.text = items[0].itemName ?? "";
    _controllerExpiryDate.text = items[0].expiryDate ?? "";
    try {
      _controllerCategory.text = items[0].categoryName ?? "";
    } catch (e) {}
    _controllerQuantity.text = items[0].quantity?.toString() ?? "";
    try {
      _controllerMeasurement.text = items[0].measurementUnit ?? "";
    } catch (e) {}
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                    DropdownMenu<String>(
                        menuHeight: 400,
                        width: MediaQuery.of(context).size.width - (16 * 2),
                        controller: _controllerCategory,
                        dropdownMenuEntries: categoryList.map((category) {
                          return DropdownMenuEntry(
                              value: category, label: category);
                        }).toList(),
                        hintText: "Category"),
                    //const SizedBox(height: 12),
                    //MultiSelectDropDown<String>(
                    //  controller: _controllerAllergens,
                    //  onOptionSelected:
                    //      (List<ValueItem<String>> selectedOptions) {},
                    //  options: const [
                    //    ValueItem(label: 'None', value: 'none'),
                    //    ValueItem(label: 'Milk', value: 'milk'),
                    //    ValueItem(label: 'Eggs', value: 'eggs'),
                    //    ValueItem(label: 'Fish', value: 'fish'),
                    //    ValueItem(label: 'Shellfish', value: 'shellfish'),
                    //    ValueItem(label: 'Nuts', value: 'nuts'),
                    //    ValueItem(label: 'Wheat', value: 'wheat'),
                    //    ValueItem(label: 'Soybean', value: 'soybean'),
                    //    ValueItem(label: 'Other', value: 'other'),
                    //  ],
                    //  disabledOptions: const [
                    //    ValueItem(label: 'Other', value: 'other')
                    //  ],
                    //  borderColor: Colors.black45,
                    //  borderWidth: 1,
                    //  hintColor: Colors.black,
                    //  borderRadius: 0,
                    //  fieldBackgroundColor:
                    //      const Color.fromARGB(255, 255, 250, 240),
                    //  focusedBorderColor:
                    //      const Color.fromARGB(255, 113, 216, 244),
                    //  dropdownHeight: 450,
                    //  optionTextStyle: const TextStyle(fontSize: 16),
                    //  selectedOptionIcon: const Icon(Icons.check_circle),
                    //  selectionType: SelectionType.multi,
                    //  hint: "Allergens",
                    //),
                    const SizedBox(height: 12),
                    DropdownMenu<String>(
                      width: MediaQuery.of(context).size.width - (16 * 2),
                      controller: _controllerMeasurement,
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(label: 'g', value: 'g'),
                        DropdownMenuEntry(label: 'kg', value: 'kg'),
                        DropdownMenuEntry(label: 'ml', value: 'ml'),
                        DropdownMenuEntry(label: 'l', value: 'l'),
                        DropdownMenuEntry(label: 'pieces', value: 'pieces'),
                      ],
                      hintText: "Measurement Unit",
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
                          isEditMode
                              ? editFoodItem(
                                  _controllerItemName.text,
                                  _controllerExpiryDate.text,
                                  _controllerCategory.text,
                                  //_controllerAllergens.selectedOptions[0].label,
                                  _controllerMeasurement.text,
                                  int.parse(_controllerQuantity.text))
                              : addFoodItem(
                                  _controllerItemName.text,
                                  _controllerExpiryDate.text,
                                  _controllerCategory.text,
                                  //_controllerAllergens.selectedOptions[0].label,
                                  _controllerMeasurement.text,
                                  int.parse(_controllerQuantity.text),
                                );
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
                      child: Text(
                        isEditMode ? 'Edit Item' : 'Add Item',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar());
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

  Future<void> addFoodItem(String item, String expiryDate, category,
      /*String allergens,*/ String measurements, int quantity) async {
    print(category);

    if ((await databases.listDocuments(
            databaseId: '6650884f00137e1b1fcd',
            collectionId: '665089ef003013ad1543',
            queries: [Query.search('name', category)]))
        .documents
        .isEmpty) {
      databases.createDocument(
          databaseId: '6650884f00137e1b1fcd',
          collectionId: '665089ef003013ad1543',
          documentId: category,
          data: {
            "name": category,
          });
    }

    // Add them to the databse, which btw
    // TODO: no longer rely on hardcoded values.
    var promise = databases.createDocument(
        databaseId: '6650884f00137e1b1fcd',
        collectionId: '6650886f0027a739c072',
        documentId: ID.unique(),
        data: {
          "name": item,
          "expiryDate": expiryDate,
          "categories": category,
          "measurementUnit": measurements,
          "quantity": quantity,
        });
//    DBInterface().insertFoodItem(
//        item, expiryDate, category, allergens, measurements, quantity);
  }

  Future<void> editFoodItem(String item, String expiryDate, categories2,
      /*String allergens,*/ String measurements, int quantity) async {
    // Convert ValueItem to just the values.
    print(categories2);

    // Add them to the databse, which btw
    // TODO: no longer rely on hardcoded values.
    var promise = databases.updateDocument(
        databaseId: '6650884f00137e1b1fcd',
        collectionId: '6650886f0027a739c072',
        documentId: widget.id ?? 'ERROR',
        data: {
          "name": item,
          "expiryDate": expiryDate,
          "categories": categories2,
          "measurementUnit": measurements,
          "quantity": quantity,
        });
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
    var fooditem =
        (await BarcodeApi().getFoodItemByUPC((await BarcodeScanner.scan(
                options: ScanOptions(restrictFormat: [
      BarcodeFormat.code39,
      BarcodeFormat.code93,
      BarcodeFormat.ean8,
      BarcodeFormat.ean13,
      BarcodeFormat.code128,
      BarcodeFormat.interleaved2of5,
      BarcodeFormat.upce,
      BarcodeFormat.pdf417,
    ])))
            .rawContent));
    print(fooditem);
    _setItemDetails(fooditem);
  }

  void _setItemDetails(FoodItem fooditem) {
    _controllerItemName.text = fooditem.itemName ?? "";
    _controllerMeasurement.text = fooditem.measurementUnit ?? "";
    _controllerCategory.text = fooditem.categoryName ?? "";
    _controllerExpiryDate.text = fooditem.expiryDate ?? "";
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
