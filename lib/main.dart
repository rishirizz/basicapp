import 'package:basicapp/screens/dashBoard_screen.dart';
import 'package:basicapp/screens/home_screen.dart';
import 'package:basicapp/screens/login_screen.dart';
import 'package:basicapp/services/api_service.dart';
import 'package:flutter/material.dart';

Widget _defaultScreen = LoginScreen();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggenIn = await SharedService.isLoggedIn();
  if (isLoggenIn) {
    _defaultScreen = HomeScreen();
  }
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _defaultScreen,
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
