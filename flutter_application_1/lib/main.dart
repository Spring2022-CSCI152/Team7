import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/responsive/mobile_screen_layout.dart';
import 'package:flutter_application_1/responsive/responsive_layout_screen.dart';
import 'package:flutter_application_1/responsive/web_screen_layout.dart';
import 'package:flutter_application_1/screens/add_post_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:provider/provider.dart';
//WebScreenLayout
import './responsive/web_screen_layout.dart';

// void main() async {
//   WidgetsFlutterBinding
//       .ensureInitialized(); //makes sure flutter loads before firebase
//   if (kIsWeb) {
//     await Firebase.initializeApp(
//       options: const FirebaseOptions(
//         apiKey: "AIzaSyBejEb5oKMMLH4vT1ACjtIbioA8SvwBKzU",
//         appId: "1:15298368232:web:583065e947f60714662f5d",
//         messagingSenderId: "15298368232",
//         projectId: "mepo-1bb10",
//         storageBucket: "mepo-1bb10.appspot.com",
//       ),
//     );
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(const MyApp());
//   runApp(const WebScreenLayout());
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (_) => UserProvider(),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Mepo',
    //     theme: ThemeData.dark().copyWith(
    //       scaffoldBackgroundColor: mobileBackgroundColor,
    //     ),
    //     home: StreamBuilder(
    //       stream: FirebaseAuth.instance
    //           .authStateChanges(), //keep track of user state
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.active) {
    //           if (snapshot.hasData) {
    //             //checking if snapshot has valid data
    //             return const ResponsiveLayout(
    //               mobileScreenLayout: MobileScreenLayout(),
    //               webScreenLayout: WebScreenLayout(),
    //             );
    //           } else if (snapshot.hasError) {
    //             return Center(
    //               child: Text('${snapshot.error}'),
    //             );
    //           }
    //         }
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return const Center(
    //             child: CircularProgressIndicator(
    //               color: primaryColor,
    //             ),
    //           );
    //         }
    //         return WebScreenLayout();
    //       },
    //     ),
    //   ),
    // );
    return MaterialApp(home: AddPostScreen());
  }
}
