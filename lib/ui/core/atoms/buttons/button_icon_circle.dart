import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard_multiempresas/global/controllers/constrollers.dart';


class ButtonIconCircle extends StatelessWidget {
  final String nameIcon;
  final Function onPressed;
  final Color color;

  const ButtonIconCircle({
    Key? key, 
    required this.nameIcon, 
    this.color = Colors.blue,
    required this.onPressed,
  }) : super(key: key);
    


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
        primary: Colors.white,
        onPrimary: Colors.black,
      ),
      onPressed: () => onPressed(), 
      child: iconController.returnIconFor(nameIcon, color)
    );

    /*return GestureDetector(
      onTap: (){
        if( widget.onPressed != null ) widget.onPressed!();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: ( _ ) => setState(()=> isHover = true ),
        onExit: ( _ ) => setState(()=> isHover = false ),
        child: Container(
          margin: EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
          child: Row(
            children: [
              widget.icon,
              Text(
                widget.text ?? '',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  decoration: isHover ? TextDecoration.underline : TextDecoration.none
                ),
              )
            ],
          ),
        ),
      ),
    );*/
  }
}