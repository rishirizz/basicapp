import 'package:basicapp/screens/dashBoard_screen.dart';
import 'package:basicapp/screens/home_screen.dart';
import 'package:basicapp/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BasicApp());
}

class BasicApp extends StatefulWidget {
  @override
  _BasicAppState createState() => _BasicAppState();
}

class _BasicAppState extends State<BasicApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      onGenerateRoute: (RouteSettings settings) {
        var routes = <String, WidgetBuilder>{
          '/login': (BuildContext context) => LoginScreen(),
          '/dashboard': (BuildContext context) => DashBoardScreen(),
          '/home': (BuildContext context) => HomeScreen(),
        };
        WidgetBuilder builder = routes[settings.name]!;
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      },
    );
  }
}
