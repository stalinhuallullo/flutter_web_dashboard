import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/cards/white_card.dart';
import 'package:flutter_web_dashboard_multiempresas/ui/core/atoms/labels/custom_labels.dart';



class HomeView extends StatelessWidget {

  const HomeView({
    Key? key
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {

    //final user = Provider.of<AuthProvider>(context).user!;
    
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1 ),

          SizedBox( height: 10 ),

          WhiteCard(
            title: 'Stalin', //user.nombre ?? 
            child: Text(  'ana@gmail.com' ) //  user.correo ??
          )

        ],
      ),
    );
  }
}