import 'package:fluro/fluro.dart';
import 'package:flutter_web_dashboard/ui/pages/404/page_not_found.dart';

class NoPageFoundHandlers{

  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters) {
      return PageNotFound();
    }
  );

}