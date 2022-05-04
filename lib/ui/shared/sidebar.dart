import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/auth_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/sidemenu_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/global/router/route.dart';
import 'package:flutter_web_dashboard_multiempresas/global/services/navigation_service.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/shared/widgets/logo.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/shared/widgets/menu_item.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/shared/widgets/text_separator.dart';
import 'package:provider/provider.dart';



class Sidebar extends StatelessWidget {
 

  void navigateTo( String routeName ) {
    NavigationService.replaceTo( routeName );
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {

    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [

          Logo(),

          SizedBox( height: 50 ),

          TextSeparator( text: 'Menu' ),

          MenuItem(
            text: Flurorouter.homePageDisplayName,
            icon: Icons.home,
            onPressed: () => navigateTo( Flurorouter.homePageRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.homePageRoute,
          ),

          MenuItem( 
            text: Flurorouter.generalDataPageDisplayName, 
            icon: Icons.note_add_outlined, 
            onPressed: () => navigateTo( Flurorouter.generalDataPageRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.generalDataPageRoute,
          ),
          MenuItem( 
            text: Flurorouter.companiesPageDisplayName, 
            icon: Icons.add_business, 
            onPressed: () => navigateTo( Flurorouter.companiesPageRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.companiesPageRoute,
          ),
          MenuItem( 
            text: Flurorouter.apisPageDisplayName, 
            icon: Icons.layers_outlined, 
            onPressed: () => navigateTo( Flurorouter.apisPageRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.apisPageRoute,
          ),
          MenuItem( 
            text: Flurorouter.rolesPageDisplayName, 
            icon: Icons.business_center_sharp, 
            onPressed: () => navigateTo( Flurorouter.rolesPageRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.rolesPageRoute,
          ),
          MenuItem( 
            text: Flurorouter.usersPageDisplayName, 
            icon: Icons.people_alt_outlined, 
            onPressed: () => navigateTo( Flurorouter.usersPageRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.usersPageRoute,
          ),
          MenuItem( 
            text: Flurorouter.reportsPageDisplayName, 
            icon: Icons.analytics, 
            onPressed: () => navigateTo( Flurorouter.reportsPageRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.reportsPageRoute,
          ),
          
          SizedBox( height: 50 ),
          TextSeparator( text: 'Controles' ),
          MenuItem( 
            text: Flurorouter.logOutPageDisplayName, 
            icon: Icons.exit_to_app_outlined, 
            onPressed: (){
              Provider.of<AuthProvider>(context, listen: false)
                .logout();
            }
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color( 0xff092044 ),
        Color( 0xff092042 ),
      ]
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ]
  );
}