import 'package:flutter/material.dart';

class IconController {

  Widget returnIconFor(String itemName, Color colors) {
    switch (itemName) {
      case "edit": return _customIcon(Icons.edit, colors);
      case "remove": return _customIcon(Icons.delete, colors);
      case "add": return _customIcon(Icons.add, colors);
      case "show": return _customIcon(Icons.visibility, colors);
      default: return _customIcon(Icons.home, colors);
    }
    
  }

  Widget _customIcon(IconData icon, Color colors) {
    return Icon( icon, color: colors ?? Colors.black, size: 16);
  }

}