import 'package:firebase_core/firebase_core.dart' as Firebase;
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/checkout.dart';
import 'package:flutter_app/pages/frontpage.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/profile.dart';
import 'package:flutter_app/screens/signin_screen.dart';
import 'package:flutter_app/utils/custom_theme.dart';
import 'package:get/get.dart';
import 'package:flutter_app/utils/application_state.dart';
import 'package:provider/provider.dart';
// import 'firebase_options.dart';
// import 'package:firebase_core_dart/firebase_core_dart.dart' as Fi;

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //if flutter needs to call a native code before runapp
  await Firebase.Firebase
      .initializeApp(
        
      ); //needs to call native code to initialize firebase
  runApp(
    ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: (context, _) => Consumer<ApplicationState>(
      builder: (context, applicationState, _) {
        Widget child;
        switch (applicationState.loginState) {
          case AplicationLoginState.loggedOut:
            print(AplicationLoginState.loggedOut);
            child = SignInScreen();
            break;
          case AplicationLoginState.loggedIn:
            print(AplicationLoginState.loggedIn);
            child = frontPage();

            break;
          default:
            // print(AplicationLoginState.loggedIn);
            child = SignInScreen();
        }

        print(child);

        return MaterialApp(theme: CustomTheme.getTheme(), home: child,
        
      debugShowCheckedModeBanner: false,
        );
      },
      child: const MyApp(),
    ),
  )
      // const MyApp()

      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    //build is container (stateless widget)
    return
        //  MaterialApp(
        // theme: ThemeData(      //used to design the fonts and colors
        //   primarySwatch: Colors.blue,
        // ),
        // home: 
        // const SignInScreen(), //widget defined in home is displayed when the application starts normally
        DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("SHOPPERS"),
        ),
        bottomNavigationBar: Container(
            child: const TabBar(
                padding: EdgeInsets.symmetric(vertical: 10),
                indicatorColor: Colors.yellow,
                labelColor: Colors.yellow,
                tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                ),
              ),
              Tab(icon: Icon(Icons.person)),
              Tab(icon: Icon(Icons.shopping_cart)),
            ])),
        body: const TabBarView(
            children: [HomeScreen(), ProfileScreen(), CheckoutScreen()]),
      ),
        // )
    );
  }
}
