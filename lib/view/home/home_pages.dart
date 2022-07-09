part of '../../view/landing_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;
    return Sizer(
      builder: (context, orientation, deviceType) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 145.sp,
                padding: EdgeInsets.only(left: 10.sp, right: 10.sp, top: 30.sp),
                color: Colors.transparent,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.loose,
                          child: Container(
                            width: 40.sp / 1.2,
                            height: 40.sp / 1.2,
                            decoration: BoxDecoration(
                                color: const Color(0xffEFEFEF),
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              size: 24.sp / 1.2,
                              ExploreBaliIsland.profile,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Current location',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Nunito',
                                    fontSize: 16.sp / 1.5),
                              ),
                              Row(children: [
                                Icon(
                                  ExploreBaliIsland.map_pin,
                                  color: Colors.blue.shade800,
                                  size: 16.sp / 1.2,
                                ),
                                SizedBox(
                                  width: 6.sp / 1.2,
                                ),
                                Text('Karangasem',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15.sp / 1.5,
                                        fontWeight: FontWeight.w700))
                              ]),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 40.sp / 1.2,
                                height: 40.sp / 1.2,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffABABAB)),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Icon(
                                  size: 24.sp / 1.2,
                                  ExploreBaliIsland.notification,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 80.sp,
                      padding: EdgeInsets.only(top: 30.sp, bottom: 10.sp),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(15.sp, 8.sp, 8.sp, 8.sp),
                          filled: true,
                          hintStyle: TextStyle(
                              fontSize: 14.sp, overflow: TextOverflow.fade),
                          hintText: 'Search destination',
                          alignLabelWithHint: true,
                          fillColor: const Color(0xffEFEFEF),
                          // fillColor: Color(0xffEFEFEF)
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(100)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.fromLTRB(15.sp, 10.sp, 15.sp, 10.sp),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nearby',
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              BlocBuilder<HomeBloc, InitialState>(
                                  builder: (context, state) {
                                if (state.newStatus == ApiRespond.fetchSucces) {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: state.popular.map((data) {
                                      return ImageBox(
                                        type: 'popular',
                                        map: data.map,
                                        img: data.img,
                                        place: data.place,
                                        star: data.star,
                                        dsc: data.desc,
                                        fav: data.favorite,
                                      );
                                    }).toList()),
                                  );
                                }
                                return Center(
                                  child: SizedBox(
                                    height: 200.sp,
                                    width: 200.sp,
                                    child: Container(
                                        padding: EdgeInsets.all(85.sp),
                                        child:
                                            const CircularProgressIndicator()),
                                  ),
                                );
                              }),
                              Text(
                                'Popular Places',
                                style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: listOfPlace.map<Widget>((e) {
                                    return Padding(
                                        padding: EdgeInsets.only(
                                            right: 10.sp,
                                            top: 5.sp,
                                            bottom: 10.sp),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffABABAB),
                                                  width: 1),
                                              color: isSelected == ''
                                                  ? const Color(0xffA5BE00)
                                                  : const Color(0xffABABAB)
                                                      .withOpacity(0),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          height: 24.sp,
                                          width: 60.sp,
                                          child: Center(
                                              child: Text(
                                            e.toString(),
                                            style: const TextStyle(
                                                color: Color(0xffABABAB)),
                                          )),
                                        ));
                                  }).toList())),
                              BlocBuilder<HomeBloc, InitialState>(
                                  builder: (context, state) {
                                if (state.newStatus == ApiRespond.fetchSucces) {
                                  return SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: state.nearby.map((data) {
                                      return ImageBox(
                                        type: 'nearby',
                                        distant: data.distant,
                                        img: data.img,
                                        place: data.place,
                                        star: data.star,
                                        dsc: data.desc,
                                        fav: data.favorite,
                                        map: data.map,
                                      );
                                    }).toList()),
                                  );
                                }
                                return Center(
                                  child: SizedBox(
                                    height: 200.sp,
                                    width: 200.sp,
                                    child: Container(
                                        padding: EdgeInsets.all(85.sp),
                                        child:
                                            const CircularProgressIndicator()),
                                  ),
                                );
                              }),
                            ]))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
