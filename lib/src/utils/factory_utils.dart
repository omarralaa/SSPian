import 'package:flutter/material.dart';

class FactoryUtils {
  IconData getIconByDepartment(department) {
    switch (department) {
      case 'CCE':
        return Icons.computer_sharp;
      case 'CAE':
        return Icons.architecture;
      case 'EME':
        return Icons.electrical_services_outlined;
      default:
        return Icons.engineering;
    }
  }
}
