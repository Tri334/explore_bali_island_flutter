part of '../../landing_page.dart';

class PlaceInfo extends StatelessWidget {
  const PlaceInfo(
      {Key? key,
      required this.map,
      required this.dsc,
      required this.star,
      required this.place_name,
      required this.img})
      : super(key: key);
  final String map, star, dsc, img, place_name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
          ),
          Positioned(
            top: 40,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 37.sp / 1.2,
                  height: 37.sp / 1.2,
                  decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(100)),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      size: 24.sp / 1.2,
                      ExploreBaliIsland.arrow_left,
                      color: Colors.black,
                    ),
                  ),
                ),
                BlurBox(
                  height: 35.sp,
                  width: 180.sp,
                  radius: 100,
                  blur: 0.1,
                  child: Center(
                    child: Text(
                      place_name,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 37.sp / 1.2,
                  height: 37.sp / 1.2,
                  decoration: BoxDecoration(
                      color: const Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    size: 24.sp / 1.2,
                    ExploreBaliIsland.more_vert,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                BlurBox(
                  height: 22.sp,
                  width: 100.sp,
                  radius: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 7.sp,
                        width: 7.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Color(0xffF0F0F0).withOpacity(0.4),
                                width: 1)),
                      ),
                      SizedBox(
                        width: 3.sp,
                      ),
                      Container(
                        height: 7.sp,
                        width: 37.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                            border:
                                Border.all(color: Color(0xffF0F0F0), width: 1)),
                      ),
                      SizedBox(
                        width: 3.sp,
                      ),
                      Container(
                        height: 7.sp,
                        width: 7.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Color(0xffF0F0F0).withOpacity(0.4),
                                width: 1)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  height: 200.sp,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: Center(
                          child: Container(
                            height: 2.sp,
                            width: 80.sp,
                            decoration: const BoxDecoration(color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25.sp, 24.sp, 25.sp, 7.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  ExploreBaliIsland.map_pin,
                                  size: 18.sp,
                                  color: const Color(0xff064789),
                                ),
                                SizedBox(
                                  width: 4.sp,
                                ),
                                Text(
                                  map,
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  ExploreBaliIsland.star,
                                  size: 18.sp,
                                  color: const Color(0xffF4EB08),
                                ),
                                SizedBox(
                                  width: 3.sp,
                                ),
                                Text(
                                  star,
                                  style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.sp, left: 30.sp, right: 30.sp),
                        child: Text(
                          dsc,
                          style: TextStyle(
                              color: const Color(0xffABABAB), fontSize: 12.sp),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
