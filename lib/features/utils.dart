import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

// if this function returns true, that means we are in dark mode. 