import 'dart:async';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'bottom_bar.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPage();
}

class _PaymentPage extends State<PaymentPage> {
  final TextEditingController _controllerCardName = TextEditingController();
  final TextEditingController _controllerCardNumber = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerCVC = TextEditingController();
  final TextEditingController _controllerAmount = TextEditingController();

  @override
  void dispose() {
    _controllerCardName.dispose();
    _controllerCardNumber.dispose();
    _controllerDate.dispose();
    _controllerCVC.dispose();
    _controllerAmount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 250, 240),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 250, 240),
        title: const Text("Donation"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                style: TextStyle(
                  fontSize: 20,
                ),
                "All donations go to the United Nation's World Food Programme (WFP)",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text('Card Owner'),
                  const SizedBox(height: 3),
                  TextFormField(
                    controller: _controllerCardName,
                    decoration: InputDecoration(
                      hintText: 'John Smith',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('Card Number'),
                  const SizedBox(height: 3),
                  TextFormField(
                    controller: _controllerCardNumber,
                    decoration: InputDecoration(
                      hintText: 'XXXX XXXX XXXX XXXX',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.credit_card,
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(19),
                      _CreditCardInputFormatter(),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('Expiration Date'),
                            const SizedBox(height: 3),
                            TextFormField(
                              controller: _controllerDate,
                              decoration: InputDecoration(
                                hintText: 'MM/YY',
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.5),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                                _ExpirationDateInputFormatter(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('CVC'),
                            const SizedBox(height: 3),
                            TextFormField(
                              controller: _controllerCVC,
                              decoration: InputDecoration(
                                hintText: 'XXX',
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.5),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.black,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                                _CVCInputFormatter(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Amount(AED)'),
                  const SizedBox(height: 3),
                  TextFormField(
                    controller: _controllerAmount,
                    decoration: InputDecoration(
                      hintText: 'AED 000.00',
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.payments_outlined,
                        color: Colors.black,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      CurrencyTextInputFormatter.currency(
                        symbol: "AED ",
                        locale: "en",
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          if (_creditCardChecker() ==
                              "Donation successful! Thank you.") {
                            _showSimpleModalDialog2(context);
                            _showSimpleModalDialog1(context);
                            Timer(
                              const Duration(seconds: 1),
                              () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                            );
                          } else {
                            _showErrorModalDialog(context);
                            _showSimpleModalDialog1(context);
                            Timer(
                              const Duration(seconds: 1),
                              () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop();
                              },
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(Colors.black),
                          overlayColor: WidgetStateProperty.resolveWith<Color>(
                            (Set<WidgetState> states) {
                              return const Color.fromARGB(255, 219, 219, 219);
                            },
                          ),
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Process Donation',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  String _creditCardChecker() {
    bool cardNameCorrect = false;
    if (_controllerCardName.text.isNotEmpty) {
      cardNameCorrect = true;
    }

    bool cardNumberCorrect = false;
    if (_controllerCardNumber.text.length == 19) {
      cardNumberCorrect = true;
    }

    int dateMM;
    int dateYY;

    if (_controllerDate.text.isNotEmpty && _controllerDate.text.length == 5) {
      dateMM = int.parse(_controllerDate.text[0] + _controllerDate.text[1]);
      dateYY = int.parse(_controllerDate.text[3] + _controllerDate.text[4]);
    } else {
      dateMM = -1;
      dateYY = -1;
    }

    bool dateCorrect = false;

    DateTime currentDate = DateTime.now();
    var formatterMonth = DateFormat('MM');
    var formatterYear = DateFormat('yy');
    String formattedMonth = formatterMonth.format(currentDate);
    String formattedYear = formatterYear.format(currentDate);
    int currentMonth = int.parse(formattedMonth);
    int currentYear = int.parse(formattedYear);

    if (1 <= dateMM && dateMM <= 12 && dateYY >= currentYear) {
      dateCorrect = true;
    } else {
      dateCorrect = false;
    }

    if (dateYY == currentYear) {
      if (dateMM < currentMonth) {
        dateCorrect = false;
      }
    }

    bool cvcCorrect = false;

    if (_controllerCVC.text.length == 3) {
      cvcCorrect = true;
    }

    RegExp myRegExp = RegExp('AED 0.00');

    bool amountCorrect = false;
    if (_controllerAmount.text.isNotEmpty &&
        !_controllerAmount.text.startsWith(myRegExp)) {
      amountCorrect = true;
    }

    String output = "basic";
    if (!(cardNameCorrect &&
        cardNumberCorrect &&
        dateCorrect &&
        cvcCorrect &&
        amountCorrect)) {
      output =
          "Invalid input(s): Errors in one (or more) text fields. Please try again.";
    }

    if (output == "basic") {
      output = "Donation successful! Thank you.";
    }

    return output;
  }

  _showErrorModalDialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: const Text("ERROR"),
            content: Text(_creditCardChecker()),
            actions: <Widget>[
              ElevatedButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ),
            ],
          );
        });
  }

  _showSimpleModalDialog1(context) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return Dialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 210),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Processing Payment',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: CircularProgressIndicator.adaptive(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.black),
                                
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showSimpleModalDialog2(context) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        _creditCardChecker(),
                        style: const TextStyle(fontSize: 24),
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
        });
  }
}

class _CreditCardInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'),
        ''); // remove everything that is not numbers, not really necessary if the only allowed keyboard is numbers, but useful in case anyone decides to copy paste
    final formattedText = _getFormattedText(text);
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _getFormattedText(String text) {
    if (text.isEmpty) return '';

    final buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' '); // space after every 4 digits
      }
      buffer.write(text[i]);
    }
    return buffer.toString();
  }
}

class _CVCInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class _ExpirationDateInputFormatter extends TextInputFormatter {
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

    if (text.length >= 2) {
      buffer.write(text.substring(0, 2));
    } else {
      buffer.write(text);
    }

    if (text.length > 2) {
      buffer.write('/');
    }

    if (text.length >= 4) {
      buffer.write(text.substring(2, 4));
    } else if (text.length > 2) {
      buffer.write(text.substring(2));
    }

    return buffer.toString();
  }
}
