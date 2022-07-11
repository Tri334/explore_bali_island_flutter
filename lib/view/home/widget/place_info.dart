part of '../../landing_page.dart';

class PlaceInfo extends StatefulWidget {
  const PlaceInfo(
      {Key? key,
      required this.map,
      required this.dsc,
      required this.star,
      required this.place_name,
      required this.img})
      : super(key: key);
  final String map, star, dsc, place_name;
  final List img;

  @override
  State<PlaceInfo> createState() => _PlaceInfoState();
}

class _PlaceInfoState extends State<PlaceInfo> {
  final PageController _pageController = PageController(
    initialPage: 1,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            // itemCount: widget.img.length,
            controller: _pageController,
            itemBuilder: (context, index) => GestureDetector(
              onVerticalDragStart: (details) {
                showInfo(context);
              },
              child: Image(
                image: AssetImage(widget.img[index % widget.img.length]),
                fit: BoxFit.cover,
              ),
            ),
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
                      widget.place_name,
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
                  child: GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext contex) =>
                            const AlertNotImplemented(
                              title: 'Config',
                              content: 'Not Implemented Yet',
                            )),
                    child: Icon(
                      size: 24.sp / 1.2,
                      ExploreBaliIsland.more_vert,
                      color: Colors.black,
                    ),
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
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: _pageController,
                        count: widget.img.length,
                        axisDirection: Axis.horizontal,
                        effect: WormEffect(
                            dotHeight: 8.sp,
                            dotWidth: 8.sp,
                            activeDotColor: Colors.white,
                            dotColor: Colors.grey,
                            strokeWidth: 2,
                            spacing: 8.sp),
                      ),
                    )),
                SizedBox(
                  height: 10.sp,
                ),
                GestureDetector(
                  onTap: () {
                    showInfo(context);
                  },
                  child: Container(
                    height: 20.sp,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Center(
                      child: Container(
                        height: 2.sp,
                        width: 80.sp,
                        decoration: const BoxDecoration(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showInfo(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Sheet(map: widget.map, star: widget.star, dsc: widget.dsc);
        });
  }
}

class Sheet extends StatelessWidget {
  const Sheet({
    Key? key,
    required this.map,
    required this.star,
    required this.dsc,
  }) : super(key: key);

  final String map;
  final String star;
  final String dsc;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.sp,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
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
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 10.sp),
              color: Colors.transparent,
              height: 90.sp,
              width: 230.sp,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  dsc,
                  style: TextStyle(
                      color: const Color(0xffABABAB), fontSize: 12.sp),
                ),
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) =>
                    const AlertNotImplemented(title: 'Route'),
              ),
              child: Container(
                height: 36.sp,
                width: 230.sp,
                decoration: BoxDecoration(
                    color: const Color(0xffA5BE00),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Text(
                    'Get Route',
                    style: TextStyle(
                        color: const Color(0xff1D1D1D),
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
