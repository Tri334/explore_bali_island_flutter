import 'package:explore_bali_island_flutter/icons/explore_bali_island_icons.dart';
import 'package:explore_bali_island_flutter/view/home/bloc/api/service_api.dart';
import 'package:explore_bali_island_flutter/view/home/bloc/home_bloc.dart';
import 'package:explore_bali_island_flutter/view/home/models/home_models.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

part 'home/home_pages.dart';
part 'home/widget/place_info.dart';
part '../view/widget/custom_text.dart';
part '../view/widget/blur_box.dart';
part 'home.dart';
part '../view/home/widget/image_box.dart';

part '../model/model.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: const Image(
              image: AssetImage('assets/images/landingPage.png'),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                const Color(0xff1D1D1D).withOpacity(0),
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
          Positioned(
              top: 40,
              left: 25,
              right: 25,
              child: Center(
                child: BlurBox(
                  radius: 100,
                  height: 20.sp,
                  width: 120.sp,
                  child: Center(
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 5,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              ExploreBaliIsland.map_pin,
                              size: 15.sp / 1.5,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CustomTextWidget(
                              customStyles: childStyles,
                              type: 'headingIconText',
                              fontSize: 16,
                            ),
                          ],
                        ),
                        const Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: 5,
                            )),
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: BlurBox(
              radius: 15,
              height: 180.sp,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            customStyles: childStyles,
                            fontSize: 40,
                          ),
                          CustomTextWidget(
                            customStyles: childStyles,
                            fontSize: 16,
                            type: 'headingDsc',
                          ),
                          Container(
                            color: Colors.transparent,
                            height: 10.sp,
                          ),
                          Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Center(
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 7.sp,
                                              width: 37.sp,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xffF0F0F0),
                                                      width: 1)),
                                            ),
                                            SizedBox(
                                              width: 3.sp,
                                            ),
                                            Container(
                                              height: 7.sp,
                                              width: 7.sp,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  border: Border.all(
                                                      color: const Color(
                                                              0xffF0F0F0)
                                                          .withOpacity(0.4),
                                                      width: 1)),
                                            ),
                                            SizedBox(
                                              width: 3.sp,
                                            ),
                                            Container(
                                              height: 7.sp,
                                              width: 7.sp,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  border: Border.all(
                                                      color: Color(0xffF0F0F0)
                                                          .withOpacity(0.4),
                                                      width: 1)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                                const Expanded(
                                  flex: 5,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                        width: 180.sp,
                                        height: 30.sp,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.green,
                                        ),
                                        child: Center(
                                            child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home(),
                                                ));
                                          },
                                          child: CustomTextWidget(
                                            customStyles: childStyles,
                                            type: 'headingButton',
                                            fontSize: 13.2,
                                          ),
                                        ))))
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
