import 'package:flutter/material.dart';
import 'package:tale/utils/router/router_const.dart';
import 'package:tale/view/screens/Signin/up/signin.dart';
import 'package:tale/view/screens/Signin/up/signup.dart';
import 'package:tale/view/screens/home_screen.dart';
import 'package:tale/view/screens/splash_screen.dart';


// Class responsible for generating routes in the application
class MyRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initRoute:
        {
          return _route(SplashScreen());
        }
        case homeRouteScreen:
        {
          return _route(HomeScreen());
        }
        case signInScreen:
        {
          return _route(SignIn());
        }
         case signUpScreen:
        {
          return _route(SingUp());
        }

      default:
        {
          final arg = settings.name as String;
          return _route(UndefineRoute(routeName: arg));
        }
    }
  }

// Helper method to create a MaterialPageRoute
  static MaterialPageRoute _route(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}

// Widget to display an undefined route error
class UndefineRoute extends StatelessWidget {
  const UndefineRoute({Key? key, required this.routeName}) : super(key: key);
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This $routeName is Undefine Route',
        ),
      ),
    );
  }
}
