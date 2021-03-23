import 'package:flutter/material.dart';

class FactoryUtils {
  IconData getIconByDepartment(department) {
    if (department == "CAE") return Icons.apartment;
    if (department == "CCE") return Icons.code;
    if (department == "EME") return Icons.power_outlined;
    if (department == "GPE") return Icons.local_gas_station;
    if (department == "BME") return Icons.biotech;
    if (department == "GP") return Icons.engineering;
    if (department == "OCE")
      return Icons.directions_boat_outlined;
    else
      return Icons.bar_chart;
  }
}
