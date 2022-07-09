part of '../../landing_page.dart';

class ImageBox extends StatelessWidget {
  const ImageBox({
    Key? key,
    this.type = 'nearby',
    this.distant = '',
    this.img = '',
    this.place = '',
    this.map = '',
    this.star = '',
    this.dsc = '',
    this.fav = false,
  }) : super(key: key);
  final String type, map, distant, img, place, star, dsc;
  final bool fav;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 10.sp),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(24),
                image:
                    DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
            height: 200.sp,
            width: 200.sp,
            child: Stack(
              children: [
                Positioned(
                    right: 10,
                    top: 10,
                    child: Container(
                        width: 30.sp,
                        height: 30.sp,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Icon(
                            ExploreBaliIsland.heart,
                            size: 25.sp,
                            color: fav
                                ? const Color(0xffFF3232)
                                : const Color(0xffABABAB),
                            shadows: [
                              BoxShadow(
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                  color: fav
                                      ? const Color(0xffFF3232).withOpacity(0.5)
                                      : const Color(0xffABABAB)
                                          .withOpacity(0.5)),
                            ],
                          ),
                        ))),
                Positioned(
                  bottom: 5,
                  left: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return PlaceInfo(
                            map: map,
                            dsc: dsc,
                            star: star,
                            place_name: place,
                            img: img);
                      },
                    )),
                    child: BlurBox(
                      height: 70.sp,
                      width: 220.sp,
                      blur: 1.5,
                      radius: 16,
                      child: Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              place,
                              style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                type == 'nearby'
                                    ? Text(
                                        '$distant from you',
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      )
                                    : Text(
                                        map,
                                        style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontSize: 14.sp,
                                            color: Colors.white),
                                      ),
                                Row(
                                  children: [
                                    Icon(
                                      ExploreBaliIsland.star,
                                      size: 12.sp,
                                      color: Color(0xffF4EB08),
                                    ),
                                    Text(
                                      star,
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )));
  }
}
