import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/global/constants/constant.dart';
import 'package:flutter_web_dashboard/global/constants/style.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  var activeItem = homeConstant.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case homeConstant: return _customIcon(Icons.home, itemName);
      case generalDataConstant: return _customIcon(Icons.trending_up, itemName);
      case companiesConstant: return _customIcon(Icons.add_business, itemName);
      case apisConstant: return _customIcon(Icons.polyline, itemName);
      case rolesConstant: return _customIcon(Icons.business_center_sharp, itemName);
      case usersConstant: return _customIcon(Icons.supervisor_account, itemName);
      case reportsConstant: return _customIcon(Icons.analytics, itemName);
      default: return _customIcon(Icons.home, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}


