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
              padding: EdgeInsets.all(8.0),
              child: Text(
                style: TextStyle(
                  fontSize: 24,
                ),
                "Donating to help the hungry. A worthy endevour.",
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                style: TextStyle(
                  fontSize: 12,
                ),
                "Any donations go to the United Nation's World Food Programme (WFP).",
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: _controllerCardName,
                    decoration: const InputDecoration(
                      labelText: 'Card Name',
                    ),
                  ),
                  TextFormField(
                    controller: _controllerCardNumber,
                    decoration: const InputDecoration(
                      labelText: 'Card Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
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
                        child: TextFormField(
                          controller: _controllerDate,
                          decoration: const InputDecoration(
                            labelText: 'Expiration Date',
                            hintText: 'MM/YY',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(5),
                            _ExpirationDateInputFormatter(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: TextFormField(
                          controller: _controllerCVC,
                          decoration: const InputDecoration(
                            labelText: 'CVC',
                            hintText: 'XXX',
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(3),
                            _CVCInputFormatter(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: _controllerAmount,
                    decoration: const InputDecoration(
                      labelText: 'Amount (in Dirhams)',
                      hintText: 'AED XXX.XX',
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
                  TextButton(
                    onPressed: () {
                      if (_creditCardChecker() ==
                          "Donation successful. Thank you. The hungry children thank you.") {
                        _showSimpleModalDialog2(context);
                        _showSimpleModalDialog1(context);
                        Timer(
                          const Duration(seconds: 3),
                          () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        );
                      } else {
                        _showErrorModalDialog(context);
                        _showSimpleModalDialog1(context);
                        Timer(
                          const Duration(seconds: 3),
                          () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        );
                      }
                    },
                    child: const Text(
                      'Process Donation',
                      style: TextStyle(color: Colors.black),
                    ),
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

    // if (!cardNameCorrect) {
    //   output += "\nName wrong lol";
    // }

    // if (!cardNumberCorrect) {
    //   output += "\nNumber wrong lol";
    // }

    // if (!dateCorrect) {
    //   output += "\nDate wrong lol";
    // }

    // if (!cvcCorrect) {
    //   output += "\nCvc wrong lol";
    // }

    // if (!amountCorrect) {
    //   output += "\nAmount wrong lol";
    // }

    if (!(cardNameCorrect &&
        cardNumberCorrect &&
        dateCorrect &&
        cvcCorrect &&
        amountCorrect)) {
      output =
          "Invalid input: Errors in one (or more) text fields. Please try again.";
    }

    if (output == "basic") {
      output = "Donation successful. Thank you. The hungry children thank you.";
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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              constraints: const BoxConstraints(maxHeight: 350),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Column(
                      children: [
                        Text('Payment Processing'),
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

// class _AmountInputFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     final text = newValue.text
//         .replaceAll(RegExp(r'[^0-9.]'), ''); // Allow only digits and .
//     return TextEditingValue(
//       text: text,
//       selection: TextSelection.collapsed(offset: text.length),
//     );
//   }
// }
