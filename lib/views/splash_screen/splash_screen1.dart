import 'dart:async';

import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/widgets_common/applogo_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/views/auth_screen/login_screen.dart';

import '../home_screen/home_screen.dart';







class Splash_Screen extends StatefulWidget{
  const Splash_Screen({super.key});

  @override
  State<StatefulWidget> createState() => Splash_Screen_state();
}

class Splash_Screen_state extends State<Splash_Screen> {
  get auth => null;

  changeScreen()
  {
    Future.delayed(const Duration(seconds: 3),()
    {
      auth.authStateChanges().listen((User? user)
      {
        if(user==null && mounted)
          {
            Get.to(()=> const LoginScreen());
          }
        else{
          Get.to(()=>const HomeScreen());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
    // Timer(const Duration(seconds: 2), (){
    //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login_screen()));
    //   auth.authStateChanges().listen((User? user)
    //   {
    //     if(user == null && mounted) {
    //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    //     } else {
    //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    //     }
    //   }
    //   );
    // }
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(
          child: Column(
            children: [
              // Align(
              //     alignment: Alignment.topLeft,
              //     child: Image.asset(icSplashBg,width: 300,)
              // ),
                  200.heightBox,
              const SizedBox(height: 20,),

              applogoWidget(),

              // const SizedBox(height: 10,),
              //
              // const Text(
              //   '$appname',
              //   style: TextStyle(
              //       fontFamily: bold,
              //       fontSize: 20,
              //       color: Colors.white
              //   ),
              // ),

              const SizedBox(height: 8 ),

              const Text(
                'version 1.0.0',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                ),
              ),

              const Spacer(),

              const Text(
                'TATA Group',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),
              ),

              //const SizedBox(height: 20),
              20.heightBox
            ],
          )
      ),

    );
  }
}















//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   //get future => null;
//
// //  get login_screen => null;
//
//
//   changeScreen()
//   {
//     Future.delayed(Duration(seconds: 3),()
//     {
//     Get.to(()=>LoginScreen());
//     }
//     );
//   }
//
//   @override
//   void initstate()
//   {
//     changeScreen();
//     super.initState();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: blackColor,
//       body:
//       Center(
//         child: Column(
//             children: [
//               50.heightBox,
//               applogoWidget(),
//               //  80.heightBox,
//               Container(
//                 height: 12,
//                 color: Colors.transparent,
//               ),
//               Text('Version 1.0.0',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
//               const Spacer(),
//               Text('@Tata group',style: TextStyle(color: Colors.white),),
//             ]
//         ),
//
//       ),
//
//     );
//
//   }
// }
