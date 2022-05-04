import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/constants/style.dart';
import 'package:flutter_web_dashboard_multiempresas/global/router/route.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  var activeItem = Flurorouter.homePageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    print("itemName ==> " + itemName);

    activeItem.value = itemName;
    print("activeItem ==> " + activeItem.toString());
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case Flurorouter.homePageDisplayName: return _customIcon(Icons.home, itemName);
      case Flurorouter.generalDataPageDisplayName: return _customIcon(Icons.trending_up, itemName);
      case Flurorouter.companiesPageDisplayName: return _customIcon(Icons.add_business, itemName);
      case Flurorouter.apisPageDisplayName: return _customIcon(Icons.polyline, itemName);
      case Flurorouter.rolesPageDisplayName: return _customIcon(Icons.business_center_sharp, itemName);
      case Flurorouter.usersPageDisplayName: return _customIcon(Icons.supervisor_account, itemName);
      case Flurorouter.reportsPageDisplayName: return _customIcon(Icons.analytics, itemName);
      case Flurorouter.logOutPageDisplayName: return _customIcon(Icons.logout, itemName);
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


