import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mns/models/category_model.dart';
import 'package:mns/provider/app_provider.dart';
import 'package:mns/router_helper.dart';
import 'package:mns/theme/AppColors.dart';
import 'package:mns/ui/screens/CategoryProductsScreen.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  CategModel categoryModel;
  CategoryWidget(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      // designSize: Size(360, 690),
      designSize: const Size(411.42857142857144, 797.7142857142857),
      context: context,
      minTextAdapt: true,
      // orientation: Orientation.portrait
    );
    return GestureDetector(
      onTap: () async {
        await Provider.of<AppProvider>(context, listen: false)
            .getCategProduct(categoryModel.name);

        // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //   return CategoryProductsScreen(categoryModel);
        // }));

        RouterHelper.routerHelper.routingToSpecificWidgetWithoutPop(
            CategoryProductsScreen(categoryModel));
      },
      child: Container(
        padding: EdgeInsets.only(bottom:10 ),
        child: Stack(
          children: [
            Container(
             //padding: EdgeInsets.only(left:10 ),
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 400.w
                  : 200.w,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? 200.h
                  : 300.h,
              child: ClipRRect(
                borderRadius:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? BorderRadius.circular(20)
                        : BorderRadius.circular(10),
                child: Container(
                  width: 360.w,
                  height: 200.h,
                  child: ClipRRect(
                   borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: categoryModel.imgURL,
                      placeholder: (context, url) => CircularProgressIndicator(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          backgroundColor: Colors.grey[200]),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    // Image.network(
                    //   categoryModel.imgURL,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              ),
            ),
            // bottom text
            Container(
              margin: EdgeInsets.only(left: 20 ,top: 30, right: 30),
                  //height: 70,
                  width: 350,
              child: Text(
                context.locale == Locale('en')
                    ? categoryModel.name
                    : categoryModel.name_ar,
                maxLines: 1,
                  style: TextStyle(fontSize: 30 , fontWeight: FontWeight.w400),
                  textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
