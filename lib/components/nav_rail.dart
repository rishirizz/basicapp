import 'package:basicapp/constants/textStyles.dart';
import 'package:flutter/material.dart';

class NavRail extends StatefulWidget {
  const NavRail({Key? key}) : super(key: key);

  @override
  _NavRailState createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: NavigationRail(
                leading: Container(
                  height: 70,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage('images/programmer.png'),
                    ),
                  ),
                ),
                backgroundColor: Colors.purple,
                selectedIndex: 1,
                destinations: [
                  NavigationRailDestination(
                    icon: const Icon(
                      Icons.bar_chart_outlined,
                    ),
                    selectedIcon: const Icon(
                      Icons.bar_chart_outlined,
                      color: Color(0xffff3838),
                    ),
                    label: Text(
                      'DASHBOARD',
                      style: navigationRailTextStyle,
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(
                      Icons.bar_chart_outlined,
                    ),
                    selectedIcon: const Icon(
                      Icons.bar_chart_outlined,
                      color: Color(0xffff3838),
                    ),
                    label: Text(
                      'HOME',
                      style: navigationRailTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
