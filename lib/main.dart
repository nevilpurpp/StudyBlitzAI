import 'package:flutter/material.dart';

import 'app/core/di/locator.dart';
import 'app/ui/screens/app.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

