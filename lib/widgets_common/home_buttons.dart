import '../../consts/consts.dart';


Widget homeButtons({width,height,icon,title,onPress}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 26),10.heightBox,
      Text('$title',style: const TextStyle(fontFamily: semibold,color: Colors.grey))
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();

}

/*
Widget HomeButton({width,height,icon,title,onPress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon,width: 50),
      15.heightBox,
      Text('$title',style: TextStyle(fontFamily: semibold,color: Colors.grey))
    ],
  ).box.rounded.white.size(width, height).shadowSm.make();
}
 */

























