import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard_multiempresas/global/providers/sidemenu_provider.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/pages/404/page_not_found.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers{

  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters) {
      Provider.of<SideMenuProvider>(context!, listen: false).setCurrentPageUrl('/404');

      return PageNotFound();
    }
  );

}