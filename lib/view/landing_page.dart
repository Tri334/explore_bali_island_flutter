import 'dart:math';

import 'package:explore_bali_island_flutter/icons/explore_bali_island_icons.dart';
import 'package:explore_bali_island_flutter/view/home/bloc/api/service_api.dart';
import 'package:explore_bali_island_flutter/view/home/bloc/home_bloc.dart';
import 'package:explore_bali_island_flutter/view/home/models/home_models.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part 'home/home_pages.dart';
part 'home/widget/place_info.dart';
part '../view/widget/custom_text.dart';
part '../view/widget/blur_box.dart';
part 'home.dart';
part '../view/home/widget/image_box.dart';

part '../model/model.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final PageController _pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sizer(
        builder: (context, orientation, deviceType) => Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                              landingImages[index % landingImages.length]),
                          fit: BoxFit.cover,
                        )),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.9),
                                const Color(0xff1D1D1D).withOpacity(0),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter),
                        ),
                      ),
                    ]);
                  }),
            ),
            Positioned(
                top: 40,
                left: 25,
                right: 25,
                child: Center(
                  child: BlurBox(
                    radius: 100,
                    height: 26.sp,
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
                          Expanded(
                              flex: 1,
                              child: SizedBox(
                                width: 5.sp,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Center(
                                        child: Container(
                                            color: Colors.transparent,
                                            child: SmoothPageIndicator(
                                                axisDirection: Axis.horizontal,
                                                controller: _pageController,
                                                count: landingImages.length,
                                                effect: WormEffect(
                                                    dotHeight: 8.sp,
                                                    dotWidth: 8.sp,
                                                    activeDotColor:
                                                        Colors.white,
                                                    dotColor: Colors.grey,
                                                    strokeWidth: 2,
                                                    spacing: 8.sp))),
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
      ),
    );
  }
}

class AlertNotImplemented extends StatelessWidget {
  const AlertNotImplemented({
    Key? key,
    this.title = 'Not Found',
    this.content = 'Not Implemented Yet',
  }) : super(key: key);
  final String title, content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK')),
        )
      ],
    );
  }
}
