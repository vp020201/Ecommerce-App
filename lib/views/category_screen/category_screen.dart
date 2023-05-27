import 'package:ecommerce_app/consts/lists.dart';
import 'package:ecommerce_app/views/category_screen/category_details.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../consts/consts.dart';
import '../../widgets_common/bg_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context)
  {
    return bgWidget(
    child:Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
       padding: const EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,
                mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 210),
            itemBuilder: (context,index){
          return Column
            (
            children: [
              Image.asset(categoryImages[index],
              height: 160,
              width: 200,
              fit: BoxFit.cover
              ),
              10.heightBox,
              Text(categoriesList[index],
              style:const TextStyle(color: blackColor,fontFamily: semibold,fontSize: 15),textAlign: TextAlign.center,)
            ],
          ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
             Get.to(()=>CategoryDetails(title: categoriesList[index]));
            });
            }
            ),
      ),
    ));

  }
}
