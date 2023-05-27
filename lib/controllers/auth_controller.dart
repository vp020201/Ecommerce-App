//import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  var isloading = false.obs;
  //text controllers
 // var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
 // var passwordRetypeController = TextEditingController();





  //login method
  Future<UserCredential?> loginMethod ({context})async{
    UserCredential? userCredential;

    try{
      await auth.signInWithEmailAndPassword(email:emailController.text,password:passwordController.text);
    }on FirebaseAuthException catch(e)
    {
      VxToast.show(context, msg:e.toString());
    }
    return userCredential;
  }


//signup method
Future<UserCredential?> signupMethod ({email,password,context})async{
  UserCredential? userCredential;

  try{
     userCredential = await auth.signInWithEmailAndPassword(email:email,password:password);
  }on FirebaseAuthException catch(e)
  {
    VxToast.show(context, msg:e.toString());
  }
  return userCredential;
}

//storing data method

storeUserData({name,password,email}) async {


    DocumentReference store=await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'name':name,
      'password':password,
      'email':email,'imageUrl':'',
      'id':currentUser!.uid
    });

}


//signout method

  signout(context)async
  {
   try{
      await auth.signOut();
    }catch(e)
    {
      VxToast.show(context, msg:e.toString());
    }

  }






}








