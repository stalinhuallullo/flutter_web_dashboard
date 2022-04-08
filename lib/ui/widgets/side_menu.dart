import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/global/constants/constant.dart';
import 'package:flutter_web_dashboard/global/constants/style.dart';
import 'package:flutter_web_dashboard/global/providers/sidemenu_provider.dart';
import 'package:flutter_web_dashboard/global/router/routers.dart';
import 'package:flutter_web_dashboard/global/services/navigation_service.dart';
import 'package:flutter_web_dashboard/ui/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/ui/widgets/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({ 
    Key? key 
  }) : super(key: key);

  void navigateTo( String routeName ) {
    NavigationService.replaceTo( routeName );
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
double _width = MediaQuery.of(context).size.width;
    return Container(
      child: ListView(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(width: _width / 48),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset("assets/icons/logo.png"),
                  ),
                  Flexible(
                    child: CustomText(
                      text: "Dash",
                      size: 20,
                      weight: FontWeight.bold,
                      color: active,
                    ),
                  ),
                  SizedBox(width: _width / 48),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Divider(color: lightGrey.withOpacity(.1), ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SideMenuItem(itemName: homeConstant, onTap: () => navigateTo( Flurorouters.homeRoute ) ),
              SideMenuItem(itemName: generalDataConstant, onTap: () => navigateTo( Flurorouters.generalDataRoute ) ),
              SideMenuItem(itemName: companiesConstant, onTap: () => navigateTo( Flurorouters.companiesRoute ) ),
              SideMenuItem(itemName: apisConstant, onTap: () => navigateTo( Flurorouters.apisRoute ) ),
              SideMenuItem(itemName: rolesConstant, onTap: () => navigateTo( Flurorouters.rolesRoute ) ),
              SideMenuItem(itemName: usersConstant, onTap: () => navigateTo( Flurorouters.usersRoute ) ),
              SideMenuItem(itemName: reportsConstant, onTap: () => navigateTo( Flurorouters.reportsRoute ) )
            ]
          )
          
        ],
      ),
    );
  }
}