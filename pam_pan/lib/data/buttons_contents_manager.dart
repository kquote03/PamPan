import 'package:flutter/material.dart';
import 'package:pam_pan/calendar_page.dart';
import 'package:pam_pan/home_page.dart';
import 'package:pam_pan/payment_page.dart';
import 'package:pam_pan/payment_processing_page.dart';

class ButtonContentsManager {
  static final List<Widget> buttonContents = [
    const HomePage(),
    const PaymentPage(),
    const CalendarPage(),
    const PaymentProcessingPage(),
  ];
}
