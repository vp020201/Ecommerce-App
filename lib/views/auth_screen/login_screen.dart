//import 'package:ecommerce_app/views/splash_screen/splash_screen1.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/auth_screen/signup_screen.dart';
import 'package:ecommerce_app/widgets_common/applogo_widgets.dart';
import 'package:ecommerce_app/widgets_common/bg_widget.dart';
import 'package:ecommerce_app/widgets_common/custom_textfile.dart';
import 'package:ecommerce_app/widgets_common/our_button.dart';
//import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../home_screen/home.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var controller =Get.put(AuthController());

    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body:
         Center(
        child: Column(children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
          15.heightBox,
          Obx(
              ()=>
           Column(
             children: [
               customTextField(hint: emailHint,title: email,isPass: false,controller: controller.emailController),
               customTextField(hint: passwordHint,title:password ,isPass: true,controller: controller.passwordController),
               Align(
                   alignment: Alignment.centerRight,
                   child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
               5.heightBox,
            //   ourButton().box.width(context.screenWidth-50).make(),
            controller.isloading.value?
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(blackColor),
            ): ourButton(color: blackColor,title: login,textcolor: whiteColor,onPress: ()
             async{
              controller.isloading(true);
               await controller.loginMethod(context: context).then((value){
                 if(value!=null)
                   {
                     VxToast.show(context, msg: loggedin);
                     Get.offAll(()=>HomeScreen());
                   }
                 else
                   {
                     controller.isloading(false);
                   }
               });

               //Get.to(()=>const HomeScreen());
             }).
           box.width(context.screenWidth-50).make(),
               5.heightBox,
               createNewAccount.text.color(fontGrey).make(),
               5.heightBox,
               ourButton(color:golden,title: signup,textcolor: blackColor,
               onPress: (){
                 Get.to(()=>SignupScreen());
               })


               .box.width(context.screenWidth-50).make(),
               10.heightBox,
               loginWith.text.color(fontGrey).make(),
               5.heightBox,
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: List.generate(3, (index) =>Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: CircleAvatar(

                     backgroundColor: lightGrey,
                     radius: 25,
                     child: Image.asset(socialIconList[index],width: 30,),
                   ),
                 )),
               )

             ],
           ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make()
         )
        ],
          ),
      ),
    ));
  }
}
