import 'package:ecommerce_app/consts/consts.dart';

Widget featuredButton({
  required String title,
  required String icon
}) {
//   return Row(
//     children:[
//     Image.asset(icon,width: 60,fit: BoxFit.fill,),
//     10.widthBox,
//   title!.text.fontFamily(semibold).color(darkFontGrey).make(),
//     ],
//   ).box.width(200).margin(const EdgeInsets.symmetric(horizontal: 4)).
//   white.padding(const EdgeInsets.all(4)).roundedSM.outerShadowSm.make();
// }
//
//
//
// Widget featuredButton({String? title,icon}) {
  return Row(
    children: [
      Image.asset(icon,width: 60,fit: BoxFit.fill,),
      8.widthBox,
      Text('$title',style: const TextStyle(fontFamily: semibold,color: Colors.grey),)
    ],
  ).box.width(200).margin(const EdgeInsets.symmetric(horizontal: 4))
      .white.roundedSM.outerShadowSm.padding(const EdgeInsets.all(2)).make();
}
