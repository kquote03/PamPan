import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pam_pan/data/buttons_contents_manager.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int index = 0;

  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = SingleChildScrollView(
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
              "Any donation you make through us would go straight to the United Nation's World Food Programme (WFP), which aims to distribute food to as many hungry people as possible, across the globe.",
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Card Name',
                  ),
                ),
                TextField(
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
                      child: TextField(
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
                      child: TextField(
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
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    index = 3;
                    buttonClicked();
                  },
                  child: const Text('Process Donation'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void buttonClicked() {
    setState(() {
      currentPage = ButtonContentsManager.buttonContents[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return currentPage;
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

    // Add the month part (MM) to the buffer
    if (text.length >= 2) {
      buffer.write(text.substring(0, 2));
    } else {
      buffer.write(text);
    }

    // Add the slash (/) separator if needed
    if (text.length > 2) {
      buffer.write('/');
    }

    // Add the year part (YY) to the buffer
    if (text.length >= 4) {
      buffer.write(text.substring(2, 4));
    } else if (text.length > 2) {
      buffer.write(text.substring(2));
    }

    return buffer.toString();
  }
}
