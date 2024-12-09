import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoiceButton extends StatelessWidget {
  final String iconAsset;
  final String text;
  final String route;  
  final VoidCallback? onTap;  

  const ChoiceButton({
    Key? key,
    required this.iconAsset,
    required this.text,
    this.route = '',
    this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => {},
      onExit: (_) => {},
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();  // Si une fonction onTap est fournie, l'exécuter
          } else if (route.isNotEmpty) {
            Navigator.pushNamed(context, route);  // Sinon, faire une redirection
          }
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconAsset,
                  width: 40,
                  height: 40,
                ),
                SizedBox(height: 10),
                Text(text),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
