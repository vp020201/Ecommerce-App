import 'package:ecommerce_app/controllers/home_controller.dart';
import 'package:ecommerce_app/views/category_screen/category_screen.dart';
import 'package:ecommerce_app/views/home_screen/home.dart';
import 'package:ecommerce_app/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../consts/consts.dart';
import '../cart_screen/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget customButton({onPress,color,textColor,title})
{
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(10)
      ),

      onPressed: onPress,

      child: Text(
          '$title',
          style: TextStyle(
              color: textColor,
              fontFamily: bold
          )
      )
  );
}

Widget exitDialog(context) {
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Confirm",style: TextStyle(fontFamily: bold,fontSize: 18,color: Colors.grey.shade800)),
        const Divider(),
        Text("Do you want to EXIT application",style: TextStyle(fontFamily: semibold,fontSize: 16,color: Colors.grey.shade700)),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            customButton(color: blackColor,title: 'Yes',onPress: (){SystemNavigator.pop();},textColor: Colors.white),
            customButton(color:blackColor,title: 'No',onPress: (){Navigator.pop(context);},textColor: Colors.white)
          ],
        )
      ],
    ).box.rounded.color(Colors.grey.shade200).padding(EdgeInsets.all(15)).make(),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  @override

 // var controller=Get.put(HomeController());



  Widget build(BuildContext context) {
  var navbarItem=[
    BottomNavigationBarItem(icon: Image.asset(icHome,width: 26),label: home),
    BottomNavigationBarItem(icon: Image.asset(icCategories,width: 26),label: categories),
    BottomNavigationBarItem(icon: Image.asset(icCart,width: 26),label: cart),
    BottomNavigationBarItem(icon: Image.asset(icAccount,width: 26),label: account)
  ];

  var navBody=[
   const Home(),
   const CategoryScreen(),
   const CartScreen(),
   const ProfileScreen(),
  ];


  var controller = HomeController();

  return WillPopScope(
    onWillPop: () async {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => exitDialog(context)
      );
      return false;
    },
    child: Scaffold(
      body: Column(
        children: [
          Obx(()=>Expanded(child:
          navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(()=>
        BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: blackColor,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap: (value){
            controller.currentNavIndex.value=value;
          },
        ),

      ),
    ),
  );
  }
}