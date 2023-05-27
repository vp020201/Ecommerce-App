import 'package:ecommerce_app/views/category_screen/items_details.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../consts/consts.dart';
import '../../widgets_common/bg_widget.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).make(),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        6,
                        (index) => "Perfumes"
                            .text
                            .size(12)
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .makeCentered()
                            .box
                            .white
                            .rounded
                            .size(120, 60)
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .make()),
                  )),

              //items container
              20.heightBox,
              Expanded(
                  child: Container(
                color: lightGrey,
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(imgP2,
                              height: 150, width: 200, fit: BoxFit.cover),
                          "Lipsticks".text.color(Colors.grey).make(),
                          10.heightBox,
                          "\$300"
                              .text
                              .color(Colors.black87)
                              .fontWeight(FontWeight.bold)
                              .size(16)
                              .make(),
                          10.heightBox,
                        ],
                      )
                          .box
                          .white
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .roundedSM
                          .outerShadowSm
                          .padding(const EdgeInsets.all(12))
                          .make()
                          .onTap(() {
                        Get.to(() => const ItemDetails(title: "Dummy Item"));
                      });
                    }),
              ))
            ],
          )),
    ));
  }
}
