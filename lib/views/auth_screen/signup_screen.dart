import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';
import '../../consts/lists.dart';
import '../../widgets_common/applogo_widgets.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfile.dart';
import '../../widgets_common/our_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../home_screen/home_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

 @override
State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool?isCheck=false;
var controller =Get.put(AuthController());

//text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body:
          Center(
            child: Column(children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Join the $appname".text.fontFamily(bold).white.size(18).make(),
              15.heightBox,
              Obx(
                  ()=> Column(
                  children: [
                    customTextField( hint:nameHint,title: name,controller: nameController,isPass: false),
                    customTextField( hint:emailHint,title: email,controller: emailController,isPass: false),
                    customTextField( hint: passwordHint,title: password,controller: passwordController,isPass: true),
                    customTextField(hint: passwordHint,title: retypePassword,controller: passwordRetypeController,isPass: true),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child: forgetPass.text.make())),


                // .box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
                Row(
                  children: [
                    Checkbox(
                      activeColor: blackColor,
                        checkColor:whiteColor,value:isCheck,onChanged: (newValue){
                      setState(()

                      {
                        isCheck=newValue;
                      });
                      isCheck =newValue;
                    }
                    ),
                    10.widthBox,
                    Expanded(
                        child: RichText(text: const TextSpan(
                            children: [
                              TextSpan(text: "I agree to the ",style: TextStyle(
                                  fontFamily: regular,
                                color:fontGrey,
                              )),

                              TextSpan(text: "Terms and Conditions ",style: TextStyle(
                                fontFamily: regular,
                                color:blackColor,
                              )),


                              TextSpan(text: "&",style: TextStyle(
                                fontFamily: regular,
                                color:fontGrey,
                              )),


                              TextSpan(text: " Privacy Policy",style: TextStyle(
                                fontFamily: regular,
                                color:blackColor,
                              ))
                            ],
                        ))
                    )
                  ],
                ),
                5.heightBox,
               controller.isloading.value?
               const CircularProgressIndicator(
                 valueColor: AlwaysStoppedAnimation(blackColor),
               ):
                  ourButton(color:isCheck == true? blackColor:lightGrey,title: signup,
                    textcolor: whiteColor,onPress: () async{
                  if(isCheck!=false)
                    {
                      controller.isloading(true);
                      try{
                        await controller.signupMethod(
                            email: emailController.text,
                            password:passwordController.text,
                          context: context,
                        ).then((value)
                        {
                          return controller.storeUserData(
                            email: emailController.text,
                            password: passwordController.text,
                            name: nameController.text,
                          );
                        }).then((value){
                          VxToast.show(context, msg: loggedin);
                          Get.offAll(()=> HomeScreen());
                        });
                      }catch(e){
                        auth.signOut();
                          VxToast.show(context, msg:e.toString());
                          controller.isloading(false);
                      }
                    }
                    })
                    .box.width(context.screenWidth-50).make(),
                10.heightBox,


                Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  alreadyHaveAccount.text.color(fontGrey).make(),
                  login.text.color(blackColor).make().onTap(() {
                    Get.back();
                  }),
                ],
                )
            ],
            ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 55).shadowSm.make(),
              ),
           ],
            ),
          ),
        ));
  }
}











































/* @override

  Widget build(BuildContext context) {

    return bgWidget(
        child:Scaffold(
          resizeToAvoidBottomInset: false,
          //   backgroundColor: Colors.white70,
          body:
          /*     Container(
        height:50,
            color: Colors.black87,
      ),*/
          Center(
            child: Column(
              children: [
                (context.screenHeight*0.1).heightBox,
                applogoWidget(),
                12.heightBox,
                //   Text('Login in to ZUDIO',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                "Join the $appname".text.white.size(15).make(),
                12.heightBox,
                Column(
                  children: [
                    customTextField( hint:nameHint,title: name),
                    customTextField( hint:emailHint,title: email),
                    customTextField( hint: passwordHint,title: password),
                    customTextField(hint: passwordHint,title: retypePassword),
                    Align(
                        alignment: Alignment.centerRight,
                         child: TextButton(onPressed: () {}, child: forgetPass.text.make())),
                    5.heightBox,
                    //    ourButton().box.width(context.screenWidth-50).make(),
                    ourButton(color: Colors.black,title: login,textcolor: Colors.white70,onPress: (){})
                        .box.width(context.screenWidth-50).make(),
                    5.heightBox,
                    createNewAccount.text.color(Colors.grey).make(),

                    Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.black87,value:isCheck,onChanged: (newValue){
                              setState(()

                              {
                                isCheck=newValue;
                              });
                              isCheck =newValue;
                        }
                        ),
                        10.widthBox,
                        Expanded(
                            child: RichText(text: TextSpan(
                          children: [
                            TextSpan(text: "I agree to the",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Colors.white30
                            )),

                            TextSpan(text: "termAndCond",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.black87,
                            )),


                            TextSpan(text: "&",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Colors.white30,
                            )),


                            TextSpan(text: "privacyPolicy",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Colors.black87,
                            ))


                          ]
                        ))
          )
                        ],
                    ),
                    5.heightBox,
                    ourButton(color:isCheck == true? Colors.redAccent : Colors.white60,title: signup,
                        textcolor: Colors.white70,onPress: (){})
                        .box.width(context.screenWidth-50).make(),
                    10.heightBox,
                    RichText(text: TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white60
                          ),
                        ),

                        TextSpan(
                          text: login,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white60
                          ),
                        ),

                      ]

                    ),).onTap(() {
                      Get.back();
                    }),
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),

              ],
            ),
          ),



        )
    );
  }
}*/
// RichText(text: const TextSpan(
//     children: [
//       TextSpan(
//         text: alreadyHaveAccount,
//         style: TextStyle(
//            fontFamily: bold,
//           color: fontGrey
//         ),
//       ),
//
//       TextSpan(
//         text: login,
//         style: TextStyle(
//             fontFamily: bold,
//             color: blackColor
//         ),
//       ),
//
//     ]
//
// ),)
