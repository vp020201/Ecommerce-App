import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/views/home_screen/components/featured_button.dart';
import 'package:ecommerce_app/widgets_common/home_buttons.dart';
import '../../consts/consts.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context)

  {
    //return Container();
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea
        (child: Column
        (
          children: [
            Container(
              alignment: Alignment.center,
              height: 70,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchanything,
                    hintStyle: TextStyle(color:textfieldGrey),
                ),
              ),
            ),
            3.heightBox,

             Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 200,
                        enlargeCenterPage: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image
                                .asset(slidersList[index], fit: BoxFit.fill,)
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(const EdgeInsets.symmetric(horizontal: 8))
                                .make(),
                          );
                        }),
                    12.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(2, (index) =>
                          homeButtons(
                            height: context.screenHeight * 0.13,
                            width: context.screenWidth / 2.6,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            title: index == 0 ? todayDeal : flashsale,
                          )),
                    ),

                  //  2nd swiper
                    15.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSlidersList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image.asset(
                              secondSlidersList[index], fit: BoxFit.fill,)
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(const EdgeInsets.symmetric(horizontal: 8))
                                .make(),
                          );
                        }),

                   //category buttons
                    15.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) =>
                          homeButtons(
                            height: context.screenHeight * 0.13,
                            width: context.screenWidth / 3.3,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                ? icBrands : icTopSeller,
                            title: index == 0
                                ? topCategories
                                : index == 1
                                ? brand
                                : topSellers,
                          )),
                    ),

                   // featured categories
                    20.heightBox,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: featuredCategories.text.color(fontGrey)
                            .size(20).fontFamily(bold)
                            .make()),
                    15.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(3,
                                (index) =>
                                Column(
                                  children: [
                                    featuredButton(icon: featuredImages1[index],
                                        title: featuredTitles1[index]),
                                    10.heightBox,
                                    featuredButton(icon: featuredImages2[index],
                                        title: featuredTitles2[index]),
                                  ],

                                )).toList(),
                             ),
                             ),

                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: blackColor),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          featuredProduct.text.white.fontFamily(bold)
                              .size(20)
                              .make(),
                          15.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(6, (index) =>
                                  SizedBox(
                                    //Container(
                                        height: MediaQuery.of(context).size.height,
                                  //  height:40,
                                 //   width: ,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Image.asset(imgP1,
                                          width: 150,
                                          fit: BoxFit.cover,),
                                      //  10.heightBox,
                                       // const Spacer(),
                                        "Lipsticks".text.fontFamily(semibold)
                                            .color(darkFontGrey).size(20)
                                            .make(),
                                        10.heightBox,
                                        "\$300".text.color(blackColor)
                                            .fontFamily(semibold).size(16)
                                            .make()
                                      ],
                                    ).box.white
                                        .margin(
                                        const EdgeInsets.symmetric(horizontal: 4))
                                        .roundedSM
                                        .padding(const EdgeInsets.all(12))
                                        .make(),
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),

                    //third swiper
                    10.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSlidersList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Image
                                .asset(
                              secondSlidersList[index], fit: BoxFit.fill,)
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(const EdgeInsets.symmetric(horizontal: 8))
                                .make(),
                          );
                        }),

                    //all products section
                    20.heightBox,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Top Products',style: TextStyle(color: Colors.grey.shade800,fontSize: 20,fontFamily: semibold))
                    ).box.padding(const EdgeInsets.symmetric(horizontal: 10)).make(),

                    8.heightBox,

                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 2,
                            mainAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(imgP2,
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover),
                              "NailPaints".text.fontFamily(bold)
                                  .color(darkFontGrey).size(15)
                                  .make(),
                              10.heightBox,
                              "\$300".text.color(blackColor).fontFamily(
                                  bold).size(14).make(),
                              5.heightBox,
                            ],).box.white
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .roundedSM
                              .padding(const EdgeInsets.all(12))
                              .make();
                        }
                    )


                  ],
                ),
              ),
             )
          ]
      ),
      ),
    );
  }
}










//
//
//
// import 'package:ecommerce_app/consts/lists.dart';
// import 'package:ecommerce_app/views/home_screen/components/featured_button.dart';
// import 'package:ecommerce_app/widgets_common/home_buttons.dart';
// import '../../consts/consts.dart';
//
// class Home extends StatefulWidget {
//   const Home({super.key});
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context)
//
//   {
//     //return Container();
//     return Container(
//       padding: const EdgeInsets.all(12),
//       color: lightGrey,
//       width: context.screenWidth,
//       height: context.screenHeight,
//       child: SafeArea
//         (child: Column
//         (
//           children: [
//             Container(
//               alignment: Alignment.center,
//               height: 60,
//               color: lightGrey,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     suffixIcon: Icon(Icons.search),
//                     filled: true,
//                     fillColor: whiteColor,
//                     hintText: searchanything,
//                     hintStyle: TextStyle(color:textfieldGrey),
//                 ),
//               ),
//             ),
//             10.heightBox,
//
//             Expanded(
//               child: SingleChildScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 child: Column(
//                   children: [
//                     VxSwiper.builder(
//                         aspectRatio: 16 / 9,
//                        // autoPlay: true,
//                         height: 200,
//                         enlargeCenterPage: true,
//                         itemCount: slidersList.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             child: Image
//                                 .asset(slidersList[index], fit: BoxFit.fill,)
//                                 .box
//                                 .rounded
//                                 .clip(Clip.antiAlias)
//                                 .margin(const EdgeInsets.symmetric(horizontal: 8))
//                                 .make(),
//                           );
//                         }),
//                     10.heightBox,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: List.generate(2, (index) =>
//                           homeButtons(
//                             height: context.screenHeight * 0.15,
//                             width: context.screenWidth / 2.5,
//                             icon: index == 0 ? icTodaysDeal : icFlashDeal,
//                             title: index == 0 ? todayDeal : flashsale,
//                           )),
//                     ),
//
//                     //2nd swiper
//                     10.heightBox,
//                     VxSwiper.builder(
//                         aspectRatio: 16 / 9,
//                         autoPlay: true,
//                         height: 150,
//                         enlargeCenterPage: true,
//                         itemCount: secondSlidersList.length,
//                         itemBuilder: (context, index) {
//                           return Container(
//                             child: Image.asset(
//                               secondSlidersList[index], fit: BoxFit.fill,)
//                                 .box
//                                 .rounded
//                                 .clip(Clip.antiAlias)
//                                 .margin(const EdgeInsets.symmetric(horizontal: 8))
//                                 .make(),
//                           );
//                         }),
//
//                     //category buttons
//                     10.heightBox,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: List.generate(3, (index) =>
//                           homeButtons(
//                             height: context.screenHeight * 0.15,
//                             width: context.screenWidth / 3.3,
//                             icon: index == 0
//                                 ? icTopCategories
//                                 : index == 1
//                                 ? icBrands : icTopSeller,
//                             title: index == 0
//                                 ? topCategories
//                                 : index == 1
//                                 ? brand
//                                 : topSellers,
//                           )),
//                     ),
//
//
//
//
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       width: double.infinity,
//                       decoration: const BoxDecoration(
//                           color: blackColor),
//
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           featuredProduct.text.white.fontFamily(bold)
//                               .size(18)
//                               .make(),
//                           10.heightBox,
//                           SingleChildScrollView(
//                             scrollDirection: Axis.horizontal,
//                             child: Row(
//                               children: List.generate(6, (index) =>
//                                   Column(
//                                //     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment: CrossAxisAlignment
//                                         .start,
//                                     children: [
//                                       Image.asset(imgP1,
//                                         width: 150,
//                                         fit: BoxFit.cover,),
//                                     //  10.heightBox,
//                                       const Spacer(),
//                                       "Lipsticks".text.fontFamily(semibold)
//                                           .color(darkFontGrey)
//                                           .make(),
//                                       10.heightBox,
//                                       "\$300".text.color(blackColor)
//                                           .fontFamily(semibold).size(16)
//                                           .make()
//                                     ],
//                                   ).box.white
//                                       .margin(
//                                       const EdgeInsets.symmetric(horizontal: 4))
//                                       .roundedSM
//                                       .padding(const EdgeInsets.all(12))
//                                       .make()),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),

                    //third swiper
                    // 10.heightBox,
                    // VxSwiper.builder(
                    //     aspectRatio: 16 / 9,
                    //     autoPlay: true,
                    //     height: 150,
                    //     enlargeCenterPage: true,
                    //     itemCount: secondSlidersList.length,
                    //     itemBuilder: (context, index) {
                    //       return Container(
                    //         child: Image
                    //             .asset(
                    //           secondSlidersList[index], fit: BoxFit.fill,)
                    //             .box
                    //             .rounded
                    //             .clip(Clip.antiAlias)
                    //             .margin(const EdgeInsets.symmetric(horizontal: 8))
                    //             .make(),
                    //       );
                    //     }),
                    //
                    // //all products section
                    // 20.heightBox,
                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: Text('Top Products',style: TextStyle(color: Colors.grey.shade800,fontSize: 20,fontFamily: semibold))
                    // ).box.padding(const EdgeInsets.symmetric(horizontal: 10)).make(),
                    //
                    // 8.heightBox,
                    //
                    // GridView.builder(
                    //     physics: const NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: 6,
                    //     gridDelegate:
                    //     const SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2,
                    //         mainAxisSpacing: 8,
                    //         crossAxisSpacing: 2,
                    //         mainAxisExtent: 300),
                    //     itemBuilder: (context, index) {
                    //       return Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Image.asset(imgP2,
                    //               height: 200,
                    //               width: 200,
                    //               fit: BoxFit.cover),
                    //           "Lipsticks".text.fontFamily(semibold)
                    //               .color(darkFontGrey)
                    //               .make(),
                    //           10.heightBox,
                    //           "\$300".text.color(blackColor).fontFamily(
                    //               bold).size(16).make(),
                    //           10.heightBox,
                    //         ],).box.white
                    //           .margin(const EdgeInsets.symmetric(horizontal: 4))
                    //           .roundedSM
                    //           .padding(const EdgeInsets.all(12))
                    //           .make();
                    //     }
                    // )

//
//                   ],
//                 ),
//               ),
//             )
//           ]
//       ),
//       ),
//     );
//   }
// }














