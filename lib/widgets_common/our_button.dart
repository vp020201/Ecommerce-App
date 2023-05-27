import 'package:ecommerce_app/consts/consts.dart';

Widget ourButton({onPress, color,textcolor,String? title}){
  return ElevatedButton
    (
    style: ElevatedButton.styleFrom(
      backgroundColor: blackColor,
      padding: const EdgeInsets.all(12),
    ),


      onPressed: onPress,
      child: title!.text.color(textcolor).fontFamily(bold).make(),
  );
}