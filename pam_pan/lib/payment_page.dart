import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      hintText: 'Charles Smith',
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
                      hintText: 'AED 0.00',
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
                          _processDonation(context);
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
    bool cardNameCorrect = _controllerCardName.text.isNotEmpty;
    bool cardNumberCorrect = _controllerCardNumber.text.length == 19;

    // Parse expiration date
    int dateMM;
    int dateYY;
    if (_controllerDate.text.isNotEmpty && _controllerDate.text.length == 5) {
      dateMM = int.parse(_controllerDate.text.substring(0, 2));
      dateYY = int.parse(_controllerDate.text.substring(3, 5));
    } else {
      dateMM = -1;
      dateYY = -1;
    }

    // Validate expiration date
    bool dateCorrect = dateMM >= 1 && dateMM <= 12 && dateYY >= 0;
    if (dateCorrect) {
      DateTime currentDate = DateTime.now();
      int currentMonth = currentDate.month;
      int currentYear = int.parse(currentDate.year.toString().substring(2));
      dateCorrect = dateYY > currentYear ||
          (dateYY == currentYear && dateMM >= currentMonth);
    }

    bool cvcCorrect = _controllerCVC.text.length == 3;

    RegExp amountRegExp = RegExp(r'^AED \d+\.\d{2}$');
    bool amountCorrect = amountRegExp.hasMatch(_controllerAmount.text);

    if (!cardNameCorrect) {
      return "Please enter the card owner's name.";
    } else if (!cardNumberCorrect) {
      return "Please enter a valid card number.";
    } else if (!dateCorrect) {
      return "Please enter a valid expiration date.";
    } else if (!cvcCorrect) {
      return "Please enter a valid CVC.";
    } else if (!amountCorrect) {
      return "Please enter a valid amount in AED format (e.g., AED 123.45).";
    } else {
      return "Donation successful! Thank you.";
    }
  }

  void _showModalDialog(
      BuildContext context, String title, String message, String buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.zero,
          content: Container(
            constraints: const BoxConstraints(maxHeight: 200),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    // Center the message text
                    child: Text(
                      message,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
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
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        child: Text(
                          buttonText,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _processDonation(BuildContext context) {
    String result = _creditCardChecker();
    if (result == "Donation successful! Thank you.") {
      _showModalDialog(context, "SUCCESS", result, "Close");
      _clearTextFields();
    } else {
      _showModalDialog(context, "ERROR", result, "Done");
    }
  }

  void _clearTextFields() {
    _controllerCardName.clear();
    _controllerCardNumber.clear();
    _controllerDate.clear();
    _controllerCVC.clear();
    _controllerAmount.clear();
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
