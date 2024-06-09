import 'package:flutter/material.dart';

class NavigationService {
  //Singleton Method
  static final NavigationService _navigationService =
      NavigationService._internal();

  factory NavigationService() => _navigationService;

  NavigationService._internal();

  //Navigation Key
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static get navigationKey => _navigatorKey;

  //Named Route

  //Navigation push
  static Future<dynamic> pushNamed({required String routeName, Object? args}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  //Navigation push replacement
  static Future<dynamic> pushReplacementNamed(
      {required String routeName, Object? args}) {
    return _navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  //Navigate Push

  static Future<dynamic> push(
      {String routeName = '', required Widget target, Object? args}) {
    return _navigatorKey.currentState!.push(
      MaterialPageRoute(
          builder: (context) => target,
          settings: RouteSettings(name: routeName, arguments: args)),
    );
  }

  //Navigate Push Replacement

  static Future<dynamic> pushReplacement(
      {String routeName = '', required Widget target, Object? args}) {
    return _navigatorKey.currentState!.pushReplacement(
      MaterialPageRoute(
          builder: (context) => target,
          settings: RouteSettings(name: routeName, arguments: args)),
    );
  }

  //Navigate Push Until

  static Future<dynamic> pushUntil(
      {String routeName = '', required Widget target, Object? args}) {
    return _navigatorKey.currentState!.pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) => target,
          settings: RouteSettings(name: routeName, arguments: args)),
      (Route<dynamic> route) => false,
    );
  }

  //Pop Function
  static void pop([Object? argument]) {
    return _navigatorKey.currentState!.pop(argument);
  }

  //Pop Until Function
  static void popUntil(
      {required String routeName, bool Function(Route<dynamic>)? routes}) {
    return _navigatorKey.currentState!
        .popUntil(routes ?? ModalRoute.withName(routeName));
  }

  //Pop Until FirstPage Function
  static void popUntilFirstPage() {
    return _navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  static void pushNamedAndRemoveUntil(
      {required String routeName,
      Object? args,
      bool Function(Route<dynamic>)? routes}) {
    _navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      routes ?? (Route<dynamic> route) => false,
      arguments: args,
    );
  }

//Pop and Push Function
  static Future<dynamic> popAndPushNamed(
      {String routeName = '', Object? args}) {
    return _navigatorKey.currentState!.popAndPushNamed(
      routeName,
      arguments: args,
    );
  }

  static bool get canPop => _navigatorKey.currentState!.canPop();

  static BuildContext get context =>
      _navigatorKey.currentState!.overlay!.context;

  static Future<bool> get mayBePop async =>
      await _navigatorKey.currentState!.maybePop();
}
