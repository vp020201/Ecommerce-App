import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/controllers/auth_controller.dart';
import 'package:ecommerce_app/views/auth_screen/login_screen.dart';
import 'package:ecommerce_app/views/profile_screen/components/details_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../consts/consts.dart';
import '../../widgets_common/bg_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context)
  {
  return bgWidget(
    child:Scaffold(
     body:SafeArea(
        child:  Column(
            children: [
              //edit profile button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(alignment: Alignment.topRight,child:Icon(Icons.edit,color:whiteColor)).
                onTap(() {

                }),
              ),

              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                children: [
                  Image.asset(imgprofile,width: 100,fit: BoxFit.cover).box.roundedFull.
                  clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Dummy user".text.fontFamily(semibold).white.make(),
                      "Customer@example.com".text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.white,
                      )
                    ),
                    onPressed: () async{
                      await Get.put(AuthController()).signout(context);
                      Get.offAll(()=>const LoginScreen());
                    },
                    child: logout.text.fontFamily(semibold).white.make(),
                  ),

                ],
            ),
              ),
       
       20.heightBox,
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(count: "00",title: "in your cart",width: context.screenWidth/3.4),
                detailsCard(count: "32",title: "in your wishlist",width: context.screenWidth/3.4),
                detailsCard(count: "675",title: "your orders",width: context.screenWidth/3.4),
              ],
            ),
              //button section

              40.heightBox,

            ListView.separated(
              shrinkWrap:true,
              separatorBuilder:(context,index)
                {
                  return Divider(
                    color: lightGrey
                  );

                },
              itemCount: profileButtonsList.length,
              itemBuilder: (BuildContext context,int index)
            {
              return ListTile(
                leading: Image.asset(
                  profileButtonsIcon[index],
                width: 22,
                ),
                title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
              );
            },
            ).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16))
                .shadowSm.make().box.color(Colors.black87).make(),

            ],
          ),

      ),
    ),

    );
  }
}