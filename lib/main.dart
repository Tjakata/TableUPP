import 'package:flutter/material.dart';
import 'package:tableupp/splashScreen/splash_screen.dart';


void main() {
runApp(
      MyApp(
          child: MaterialApp(
            title: 'TableUPP',
            themeMode: ThemeMode.system,
            home: SplashScreen(),
            debugShowCheckedModeBanner: false,
          ),
      ),
  );
}

class MyApp extends StatefulWidget {
 final Widget? child;

 const MyApp({super.key, this.child});


 //this method is called when the app is restarted
 static void restartApp(BuildContext context)
 {
   context.findAncestorStateOfType<_MyAppState>()!.restartApp();
 }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{

  Key key = UniqueKey();

  void restartApp()
  {
    setState(() {
      key = UniqueKey();
    });

  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
