import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final Widget? child;
  final bool? inAsyncCall;
  final double? opacity;
  final Color? color;
  final Animation<Color>? valueColor;

  AppCircularProgressIndicator({
    Key? key,
    @required this.child,
    @required this.inAsyncCall,
    this.opacity = 0.8,
    this.color = Colors.grey,
    this.valueColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child!);
    if (inAsyncCall!) {
      final modal = new Stack(
        children: [
          new Opacity(
            opacity: opacity!,
            child: ModalBarrier(dismissible: false, color: color),
          ),
          new Center(
            child: new CircularProgressIndicator(
                backgroundColor:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black54)),
          ),
        ],
      );
      widgetList.add(modal);
    }
    return Stack(
      children: widgetList,
    );
  }
}
