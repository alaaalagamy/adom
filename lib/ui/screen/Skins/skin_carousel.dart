import 'package:adom/shared/shared_values.dart';
import 'package:adom/ui/screen/Skins/objects/carousel_object.dart';
import 'package:adom/ui/screen/Skins/objects/image_object.dart';
import 'package:adom/ui/screen/Skins/objects/video_object.dart';
import 'package:adom/ui/screen/commons/api_client.dart';
import 'package:adom/ui/screen/commons/widget_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SkinCarousel extends StatefulWidget {
  const SkinCarousel({super.key, required this.imgList, required this.videoList});
  final List<ImageObject> imgList;
  final List<VideoObject> videoList;

  @override
  State<SkinCarousel> createState() => _SkinCarouselState();
}

class _SkinCarouselState extends State<SkinCarousel> {
  List<CarouselObject> carouselObjects = [];
  final ApiClient _client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: const Align(
                alignment: Alignment.topCenter,
                child: Image(key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE),
                    width: 100,
                    height: 100,
                    image: AssetImage('assets/images/logo_white.png')),
              ),
            ),
            videosListTitleWidget(),
            videosListWidget(),
            const SizedBox(height: 30),
            imagesListTitleWidget(),
            imagesListWidget(),
            const SizedBox(height: 30),
            bottomButtonsWidget()
          ]),
        ),
      ),
    );
  }

  Widget videosListTitleWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: [
          Text(
            'videos'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins-Italic'),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget videosListWidget() {
    return widget.videoList.isNotEmpty
        ? SizedBox(
            height: 160,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.videoList.map((e) {
                  List<CarouselObject> tempList = carouselObjects.where((element) => element.id == e.id).toList();
                  return Column(
                    children: [
                      Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 0),
                        child: label(e.label),
                  ),

                      GestureDetector(
                        onTap: () {
                          if (carouselObjects.length < 10) {
                            if (carouselObjects.where((element) => element.id == e.id).toList().isEmpty) {
                              carouselObjects.add(CarouselObject(e.duration, e.id));
                              setState(() {});
                            }
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                                height: 105,
                                width: MediaQuery.of(context).size.width / 2.3,
                                margin: const EdgeInsets.only(right: 15),
                                child: Image(width: 100, fit: BoxFit.cover, filterQuality: FilterQuality.high, image: NetworkImage(e.thumbPath))),
                            Visibility(
                              visible: tempList.isNotEmpty,
                              child: Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width / 2.3,
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 10,
                                    child: Text(
                                      '${carouselObjects.indexWhere((element) => element.id == e.id) + 1}',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList()))
        : emptyListWidget(isImage: false);
  }

  label(String label) {
    return SizedBox(
      width: 130,
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins-Italic'),
        ),
      ),
    );
  }
  Widget emptyListWidget({required bool isImage}) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Text(
          isImage ? 'No images uploaded' : 'No videos uploaded',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget imagesListTitleWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        children: [
          Text(
            'images'.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins-Italic'),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget bottomButtonsWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2), side: const BorderSide(width: 3, color: Colors.deepPurpleAccent)))),
                onPressed: null,
                child: Text(
                  'Upload'.toUpperCase(),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent, // This is what you need!
                ),
                child: Text(
                  'Carousel'.toUpperCase(),
                  maxLines: 1,
                ),
                onPressed: () async {
                  if (carouselObjects.isNotEmpty) {
                    // send API
                    Map<String, dynamic> map = {
                      "playlist_type": "item",
                      "is_horizontal": SharedValues.device!.d_category == 1 ? false : true,
                      "device_id": SharedValues.device!.id,
                      "playlist_items": carouselObjects.map(
                        (e) {
                          Map itemMap = {"item": e.id, "duration": e.duration};
                          return itemMap;
                        },
                      ).toList()
                    };
                    var res = await _client.uploadCarouselPlayList(data: map);
                    if (res) {
                      fToast.showToast(
                        toastDuration: const Duration(milliseconds: 2000),
                        child: SizedBox.fromSize(
                          size: const Size(40, 40), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Colors.green, // button color
                              child: InkWell(
                                splashColor: Colors.green, // splash color
                                onTap: () {},
                                child: const Icon(Icons.check , color: Colors.white,), // icon
                              ),
                            ),
                          ),
                        ),
                        gravity: ToastGravity.TOP_RIGHT,
                      );
                      // if (!mounted) return;
                      // Navigator.pop(context);
                    } else {
                      fToast.showToast(
                        toastDuration: const Duration(milliseconds: 2000),
                        child: SizedBox.fromSize(
                          size: const Size(40, 40), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Colors.green, // button color
                              child: InkWell(
                                splashColor: Colors.green, // splash color
                                onTap: () {},
                                child: const Icon(Icons.error , color: Colors.white,), // icon
                              ),
                            ),
                          ),
                        ),
                        gravity: ToastGravity.TOP_RIGHT,
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Widget imagesListWidget() {
    // showing list of images
    return widget.imgList.isNotEmpty
        ? SizedBox(
            height: 160,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.imgList.map((e) {
                  List<CarouselObject> tempList = carouselObjects.where((element) => element.id == e.id).toList();

                  return Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 0),
                            child: label(e.label),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (carouselObjects.length < 10) {
                                // avoid duplicate
                                if (carouselObjects.where((element) => element.id == e.id).toList().isEmpty) {
                                  carouselObjects.add(CarouselObject(10, e.id));
                                  setState(() {});
                                }
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15),
                              child: Image(
                                  height: 105,
                                  width: MediaQuery.of(context).size.width / 2.3,
                                  fit: BoxFit.cover,
                                  filterQuality: FilterQuality.high,
                                  image: NetworkImage(e.imagePath),
                                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: tempList.isNotEmpty,
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.3,
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                            child: CircleAvatar(
                              backgroundColor: Colors.blue,
                              radius: 10,
                              child: Text(
                                '${carouselObjects.indexWhere((element) => element.id == e.id) + 1}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }).toList()))
        : emptyListWidget(isImage: true);
  }
}
