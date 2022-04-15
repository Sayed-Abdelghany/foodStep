import 'package:breakapp/constants/imagesPathes.dart';
import 'package:breakapp/constants/screens.dart';
import 'package:breakapp/data/data.local/casheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sizer/sizer.dart';
class IntroductionScreen extends StatelessWidget {
   IntroductionScreen({Key? key}) : super(key: key);
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final pages = List.generate(
      4,
          (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          color: Colors.grey.shade300,
        ),
               margin:  EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                child: SizedBox(
                 height: 20.h,
                     child: Center(
                        child: Image.asset(imagePath[index],
                          fit:BoxFit.cover ,),

              )
                     ),
        ),
      );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               SizedBox(height: 3.h),
              Padding(
                padding:  EdgeInsets.all(10.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        controller.jumpToPage(3);
                      },
                        child:  Text('Skip',style: TextStyle(fontSize: 20.sp,),)),
                     Text('عربى',style: TextStyle(fontSize: 20.sp,),),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
                Padding(
                padding:  EdgeInsets.only(top: 2.h, bottom: 1.h),
                child: Text(
                  'Worm',
                  style: TextStyle(color: Colors.black54,fontSize: 20.sp),
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 16,
                  dotWidth: 16,
                  type: WormType.thin,
                  activeDotColor: Colors.green,

                  // strokeWidth: 5,
                ),
              ),

               SizedBox(height: 2.h),
              InkWell(
                onTap: (){
                  CasheHelper.putBool('onBoarding', true);
                  Navigator.pushNamed(context, signInPath);
                },
                child: Container(
                  height: 10.h,
                  width: 40.w,
                  color: Colors.grey,
                  child: SvgPicture.asset(arrowPath,
                      color:Colors.white ,fit: BoxFit.contain,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







