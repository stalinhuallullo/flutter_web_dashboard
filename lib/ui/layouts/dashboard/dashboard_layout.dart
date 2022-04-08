import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/global/providers/sidemenu_provider.dart';
import 'package:flutter_web_dashboard/ui/widgets/side_menu.dart';

class DashboardLayout extends StatefulWidget {
  
  final Widget child;

  const DashboardLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {

  @override
  void initState() { 
    super.initState();
    const duration = Duration( milliseconds: 300 );
    SideMenuProvider.menuController = AnimationController( vsync: this, duration: duration );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: SideMenu()
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: widget.child,
            )
          ),
        ],
      ),
    );
  }
}
