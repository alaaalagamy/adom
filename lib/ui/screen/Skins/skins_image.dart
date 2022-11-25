import 'package:adom/shared/shared_values.dart';
import 'package:adom/ui/screen/Skins/objects/image_object.dart';
import 'package:adom/ui/screen/Skins/objects/images_videos_object.dart';
import 'package:adom/ui/screen/Skins/objects/video_object.dart';
import 'package:adom/ui/screen/Skins/skin_carousel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import '../commons/api_client.dart';
import '../commons/widget_keys.dart';

class SkinsImage extends StatefulWidget {
  final String type;
  const SkinsImage({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  State<SkinsImage> createState() => _SkinsImageState();
}

class _SkinsImageState extends State<SkinsImage> {
  final ApiClient _client = ApiClient(Dio(BaseOptions(contentType: "application/json")));
  List<VideoObject> videosList = [];
  List<ImageObject> imgList = [];
  bool showLoadingWidget = false; // this will be shown when the user uploads video or image
  bool initFinished = false;
  final ImagePicker picker = ImagePicker();
  double progress = 0;
  late FToast fToast;

  @override
  void initState() {
    getImagesAndVideos();
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  getImagesAndVideos() async {
    var res = await _client.getImagesAndVideos();
    await differenceImagesFromVideo(res);
  }

  dynamic file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Amr change here, we will difference the images from videos
              initFinished
                  ? Container(
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
              )
                  : SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              loadingWidget()
            ],
          ),
        ));
  }

  loadingWidget() {
    Size size = MediaQuery.of(context).size;
    return Visibility(
      visible: showLoadingWidget,
      child: AbsorbPointer(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.black.withOpacity(0.7),
          child: Center(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(30), color: Colors.white),
                  height: 150,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                          value: (progress / 100.0),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${progress.toStringAsFixed(2)} %',
                        style: const TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  differenceImagesFromVideo(List<ImagesAndVideos> data) async {
    // clear before difference to avoid duplicating items
    imgList.clear();
    videosList.clear();
    // difference images from videos process
    for (int i = 0; i < data.length; i++) {
      final type = lookupMimeType(data[i].path);
      if (type!.startsWith('image/')) {
        imgList.add(ImageObject(imagePath: data[i].path, id: data[i].id, label: data[i].label));
      } else {
        videosList.add(VideoObject(id: data[i].id, thumbPath: data[i].thumbFile, duration: 15, label: data[i].label));
      }
    }
    initFinished = true;
    setState(() {});
  }

  Widget videosListTitleWidget() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
    return videosList.isNotEmpty
        ? Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 160,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: videosList.map((e) {
                String label = e.label;
                return Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
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
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            editLabelIcon(e.id.toString(), false)
                          ],
                        ),
                      ),
                      GestureDetector(
                        onDoubleTap: () async {
                          Map<String, dynamic> map = {
                            "playlist_type": "item",
                            "is_horizontal": SharedValues.device!.d_category == 1 ? false : true,
                            "device_id": SharedValues.device!.id,
                            "playlist_items": [
                              {"item": e.id, "duration": e.duration}
                            ]
                          };
                          // send request
                          bool res = await _client.uploadCarouselPlayList(data: map);
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

                          // showCarosalDialog(
                          //   e,
                          //   isImage: false,
                          // );
                        },
                        child: Image(
                            width: MediaQuery.of(context).size.width / 2.3,
                            height: 105,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            image: NetworkImage(e.thumbPath)),
                      ),
                    ],
                  ),
                );
              }).toList())),
    )
        : emptyListWidget(isImage: false);
  }

  // showCarosalDialog(
  //   var e, {
  //   required bool isImage,
  // }) {
  //   String? selected;
  //   bool showError = false;
  //
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return StatefulBuilder(builder: (context, dialogState) {
  //           return AlertDialog(
  //             title: const Text('Please select orientation'),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 GestureDetector(
  //                   onTap: () {
  //                     showError = false;
  //                     selected = 'Vertical';
  //                     dialogState(() {});
  //                   },
  //                   child: Container(
  //                     width: 200,
  //                     height: 50,
  //                     decoration: BoxDecoration(
  //                         border: Border.all(color: selected != null && selected == 'Vertical' ? Colors.white : Colors.black),
  //                         color: selected != null && selected == 'Vertical' ? Colors.deepPurpleAccent : Colors.white,
  //                         borderRadius: BorderRadius.circular(30)),
  //                     child: Center(
  //                         child: Text(
  //                       'Vertical',
  //                       style: TextStyle(color: selected != null && selected == 'Vertical' ? Colors.white : Colors.black),
  //                     )),
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     showError = false;
  //                     selected = 'Horizontal';
  //                     dialogState(() {});
  //                   },
  //                   child: Container(
  //                     width: 200,
  //                     height: 50,
  //                     decoration: BoxDecoration(
  //                         border: Border.all(color: selected != null && selected == 'Horizontal' ? Colors.white : Colors.black),
  //                         color: selected != null && selected == 'Horizontal' ? Colors.deepPurpleAccent : Colors.white,
  //                         borderRadius: BorderRadius.circular(30)),
  //                     child: Center(
  //                         child: Text(
  //                       'Horizontal',
  //                       style: TextStyle(color: selected != null && selected == 'Horizontal' ? Colors.white : Colors.black),
  //                     )),
  //                   ),
  //                 ),
  //                 Visibility(
  //                     visible: showError,
  //                     child: const Text(
  //                       'Please select orientation',
  //                       style: TextStyle(color: Colors.red),
  //                     ))
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                   onPressed: () => Navigator.of(context).pop(),
  //                   child: const Text(
  //                     'Cancel',
  //                     style: TextStyle(color: Colors.black),
  //                   )),
  //               ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     backgroundColor: Colors.deepPurpleAccent,
  //                   ),
  //                   onPressed: () async {
  //                     if (selected != null) {
  //                       Map<String, dynamic> map = {
  //                         "playlist_type": "item",
  //                         "is_horizontal": selected == 'Horizontal' ? true : false,
  //                         "device_id": SharedValues.device!.id,
  //                         "playlist_items": [
  //                           {"item": e.id, "duration": isImage ? 10 : e.duration}
  //                         ]
  //                       };
  //                       // send request
  //                       bool res = await _client.uploadCarouselPlayList(data: map);
  //                       if (res) {
  //                         showSnackBar('Carousel added successfully');
  //                         if (!mounted) return;
  //                         Navigator.pop(context);
  //                       } else {
  //                         showSnackBar('Error during carousel uploading');
  //                       }
  //                     } else {
  //                       showError = true;
  //                       dialogState(() {});
  //                     }
  //                   },
  //                   child: const Text(
  //                     'Save',
  //                   ))
  //             ],
  //           );
  //         });
  //       }
  //       );
  // }

  Widget editLabelIcon(String id, bool isImage) {
    // isImage to know its image or video to change the item text on the list
    return IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: () {
          TextEditingController? controller = TextEditingController();
          final formKey = GlobalKey<FormState>();

          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(hintText: 'Enter your new label'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter label';
                        }
                        return null;
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                        ),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // send request
                            bool res = await _client.updateLabel(newData: controller.text, id: id);
                            if (res) {
                              if (isImage) {
                                imgList.where((element) => element.id == num.parse(id)).first.label = controller.text;
                              } else {
                                videosList.where((element) => element.id == num.parse(id)).first.label = controller.text;
                              }
                              setState(() {});
                            }
                            // else {
                            //   showSnackBar('Error happened, please try again');
                            // }
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop();
                          }
                        },
                        child: const Text('Save'))
                  ],
                );
              });
        },
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 14,
        ));
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
      ),
    );
  }

  Widget bottomButtonsWidget() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent, // This is what you need!
                ),
                child: Text(
                  'Upload'.toUpperCase(),
                ),
                onPressed: () async {
                  if (widget.type == 'image') {
                    final image = await picker.pickImage(source: ImageSource.gallery, maxHeight: 1000, maxWidth: 1000);
                    if (image != null) {
                      showLoadingWidget = true;
                      progress = 0;
                      setState(() {});
                      // send API request
                      var res = await _client.uploadFile(
                        file: image,
                        sendProgress: (count, total) {
                          progress = ((count.toDouble() / total.toDouble()) * 100.0);
                          setState(() {});
                        },
                      );
                      if (res) {
                        // get the new list after uploading file done
                        await getImagesAndVideos();
                      }
                      showLoadingWidget = false;
                      setState(() {});
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
                  } else {
                    final video = await picker.pickVideo(source: ImageSource.gallery);
                    if (video != null) {
                      showLoadingWidget = true;
                      progress = 0;
                      setState(() {});
                      // send API request
                      var res = await _client.uploadFile(
                        file: video,
                        sendProgress: (count, total) {
                          progress = ((count.toDouble() / total.toDouble()) * 100.0);
                          setState(() {});
                        },
                      );
                      if (res) {
                        // get the new list after uploading file done
                        await getImagesAndVideos();
                      }
                      showLoadingWidget = false;
                      setState(() {});
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
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2), side: const BorderSide(width: 3, color: Colors.deepPurpleAccent)))),
                child: Text(
                  'Text'.toUpperCase(),
                ),
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2), side: const BorderSide(width: 3, color: Colors.deepPurpleAccent)))),
                child: Text(
                  'Carousel'.toUpperCase(),
                  maxLines: 1,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return SkinCarousel(
                      videoList: videosList,
                      imgList: imgList,
                    );
                  }));
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
    return imgList.isNotEmpty
        ? SizedBox(
        height: 160,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: imgList.map((e) {
              //     String label = 'Image ${imgList.indexOf(e) + 1}';
              String label = e.label;
              return Container(
                margin: const EdgeInsets.only(right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 130,
                            child: Center(
                              child: Text(
                                label,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Poppins-Italic'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          editLabelIcon(e.id.toString(), true)
                        ],
                      ),
                    ),
                    GestureDetector(
                      onDoubleTap: () async {
                        Map<String, dynamic> map = {
                          "playlist_type": "item",
                          "is_horizontal": SharedValues.device!.d_category == 1 ? false : true,
                          "device_id": SharedValues.device!.id,
                          "playlist_items": [
                            {"item": e.id, "duration": 10}
                          ]
                        };
                        // send request
                        bool res = await _client.uploadCarouselPlayList(data: map);
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

                        // showCarosalDialog(
                        //   e,
                        //   isImage: false,
                        // );
                      },
                      child: Image(
                          width: MediaQuery.of(context).size.width / 2.3,
                          height: 105,
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
                  ],
                ),
              );
            }).toList()))
        : emptyListWidget(isImage: true);
  }
}

