import 'package:flutter/material.dart';

class PaymentProcessingPage extends StatefulWidget {
  const PaymentProcessingPage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Processing'),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  State<PaymentProcessingPage> createState() {
    return _PaymentProcessingPage();
  }
}

class _PaymentProcessingPage extends State<PaymentProcessingPage> {
  @override
  void initState() {
    super.initState();
    currentPage = const Column(
      children: [
        Text('Payment Processing'),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
    // Start a timer to simulate payment processing
    Future.delayed(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the payment success page
      setState(() {
        currentPage = const Center(
          child: Text(
            'Your payment was successful!',
            style: TextStyle(fontSize: 24),
          ),
        );
      });
    });
  }

  late Widget currentPage;

  @override
  Widget build(BuildContext context) {
    return currentPage;
  }
}
