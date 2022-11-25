import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class HomeWidget extends StatefulWidget {


  const HomeWidget( {Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();

}

class _HomeWidgetState extends State<HomeWidget> {

  _HomeWidgetState();

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => const WelcomeScreen()),
    // );
  }

  Widget _buildFullscreenImageName(String assetName) {
    return Image.asset(
      'assets/images/$assetName',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('logo.png', 100),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          titleWidget: const SizedBox(height: 0),
          bodyWidget: Container(
            margin:const EdgeInsets.only(bottom: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEEEEE)),
              child: Text(
                'discover the collection'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins-Italic',
                    backgroundColor: Color(0xFFEEEEEE),
                    color: Colors.black),
              ),
              onPressed: () {},
            ),
          ),
          image: _buildFullscreenImageName('image1.png'),
          decoration: const PageDecoration(
            fullScreen: true,
            bodyFlex: 0,
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox(height: 0),
          bodyWidget: Container(
            margin:const EdgeInsets.only(bottom: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEEEEE)),
              child: Text(
                'discover the collection'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins-Italic',
                    backgroundColor: Color(0xFFEEEEEE),
                    color: Colors.black),
              ),
              onPressed: () {},
            ),
          ),
          image: _buildFullscreenImageName('image2.png'),
          decoration: const PageDecoration(
            fullScreen: true,
            bodyFlex: 0,
          ),
        ),
        PageViewModel(
          titleWidget: const SizedBox(height: 0),
          bodyWidget: Container(
            margin:const EdgeInsets.only(bottom: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEEEEE)),
              child: Text(
                'discover the collection'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Poppins-Italic',
                    backgroundColor: Color(0xFFEEEEEE),
                    color: Colors.black),
              ),
              onPressed: () {},
            ),
          ),
          image: _buildFullscreenImageName('image3.png'),
          decoration: const PageDecoration(
            fullScreen: true,
            bodyFlex: 0,
          ),
        )
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      isProgress: false,
      //rtl: true, // Display as right-to-left
      // next: Transform.rotate(
      //   angle: 270 * pi/180,
      //   child: Icon(Icons.keyboard_double_arrow_down , color: Colors.black),
      // ),

      next: const Icon(Icons.keyboard_double_arrow_down, color: Colors.white),

      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600 , color:Colors.white )),
      pagesAxis: Axis.vertical,

      controlsMargin: const EdgeInsets.all(16),



    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: Container(
//             padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
//             child:
//             Stack(
//                 children: [
//                   //align to top center using Container();
//                   Container(
//                       alignment: Alignment.topCenter,
//                       child:Container(
//                         height:100,
//                         width:100,
//                         child: const Image(
//                             key: Key(WidgetKey.KEY_SPLASH_SPLASH_IMAGE),
//                             image: AssetImage('assets/images/logo_white.png')),
//
//                       )
//                   ),
//
//                   //Alignment at Center
//                   Container(
//                       alignment: Alignment.center,
//                       child:IntrinsicHeight(
//                         child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         color: const Color(0xFFEEEEEE),
//                         child: Padding(
//                           padding: const EdgeInsets.all(10),
//                           child: Row(
//                             children: <Widget>[
//                               Expanded(
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: SizedBox.fromSize(
//                                         size: const Size(
//                                             56, 56), // button width and height
//                                         child: ClipOval(
//                                           child: Material(
//                                             color: Colors.white, // button color
//                                             child: InkWell(
//                                               splashColor:
//                                               Colors.green, // splash color
//                                               onTap: () {
//                                                 PersistentNavBarNavigator
//                                                     .pushNewScreen(
//                                                   context,
//                                                   screen: const SkinsVideo(),
//                                                   withNavBar:
//                                                   true, // OPTIONAL VALUE. True by default.
//                                                   // pageTransitionAnimation: PageTransitionAnimation.cupertino,
//                                                 );
//                                               },
//                                               child: const ImageIcon(
//                                                 AssetImage(
//                                                     'assets/images/video.png'),
//                                                 color: Colors.black,
//                                               ), // icon
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Text('Video')
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: SizedBox.fromSize(
//                                         size: const Size(
//                                             56, 56), // button width and height
//                                         child: ClipOval(
//                                           child: Material(
//                                             color: Colors.white, // button color
//                                             child: InkWell(
//                                               splashColor:
//                                               Colors.green, // splash color
//                                               onTap: () {
//                                                 PersistentNavBarNavigator
//                                                     .pushNewScreen(
//                                                   context,
//                                                   screen: const SkinsImage(),
//                                                   withNavBar:
//                                                   true, // OPTIONAL VALUE. True by default.
//                                                   // pageTransitionAnimation: PageTransitionAnimation.cupertino,
//                                                 );
//                                               },
//                                               child: const ImageIcon(
//                                                 AssetImage(
//                                                     'assets/images/images.png'),
//                                                 color: Colors.black,
//                                               ), // icon
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Text('photo')
//                                   ],
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: SizedBox.fromSize(
//                                         size: const Size(
//                                             56, 56), // button width and height
//                                         child: ClipOval(
//                                           child: Material(
//                                             color: Colors.white, // button color
//                                             child: InkWell(
//                                               splashColor:
//                                               Colors.green, // splash color
//                                               onTap: () {
//                                                 PersistentNavBarNavigator
//                                                     .pushNewScreen(
//                                                   context,
//                                                   screen: const SkinsColor(),
//                                                   withNavBar:
//                                                   true, // OPTIONAL VALUE. True by default.
//                                                   // pageTransitionAnimation: PageTransitionAnimation.cupertino,
//                                                 );
//                                               },
//                                               child: const ImageIcon(
//                                                 AssetImage(
//                                                     'assets/images/color.png'),
//                                                 color: Colors.black,
//                                               ), // icon
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     Text('color')
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                     ),
//                       ),
//                   ),
//
//                   //manual position with left, top, right, bottom
//                   Positioned(
//                       left:0,
//                       right:0,
//                       bottom:20,
//                       //you can use "right" and "bottom" too
//                       child: Container(
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               'presets'.toUpperCase(),
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                   fontFamily: 'Poppins-Italic'),
//                             ),
//                             const Spacer(),
//                             Text(
//                               'all >'.toUpperCase(),
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                   fontFamily: 'Poppins-Italic'),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Card(
//                                 child: Column(
//                                   children: [
//                                     Image.asset(
//                                       'assets/images/back1.png',
//                                     ),
//                                     Text(
//                                       'study time'.toUpperCase(),
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(
//                                           color: Colors.black, fontFamily: 'Poppins'),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                                 child: Card(
//                                   child: Column(
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/back2.png',
//                                       ),
//                                       Text(
//                                         'social media'.toUpperCase(),
//                                         textAlign: TextAlign.center,
//                                         style: const TextStyle(
//                                             color: Colors.black, fontFamily: 'Poppins'),
//                                       ),
//                                     ],
//                                   ),
//                                 )),
//                             Expanded(
//                                 child: Card(
//                                   child: Column(
//                                     children: [
//                                       Image.asset(
//                                         'assets/images/back3.png',
//                                       ),
//                                       Text(
//                                         'summer beach'.toUpperCase(),
//                                         maxLines: 1,
//                                         textAlign: TextAlign.center,
//                                         style: const TextStyle(
//                                             color: Colors.black, fontFamily: 'Poppins'),
//                                       ),
//                                     ],
//                                   ),
//                                 )),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   ),
//
//                   // //alignment at veritically center, and at left horizontally
//                   // Align(
//                   //     alignment: Alignment.centerLeft,
//                   //     child:Container(
//                   //       height:100,
//                   //       width:100,
//                   //       color: Colors.orangeAccent,
//                   //       child: Text("Box IV"),
//                   //     )
//                   // ),
//                   //
//                   // //alignment at veritically center, and at right horizontally
//                   // Align(
//                   //     alignment: Alignment.centerRight,
//                   //     child:Container(
//                   //       height:100,
//                   //       width:100,
//                   //       color: Colors.greenAccent,
//                   //       child: Text("Box V"),
//                   //     )
//                   // ),
//                   //
//                   // //manual position with left, top, right, bottom
//                   // Positioned(
//                   //     left:0,
//                   //     top:0,
//                   //     //you can use "right" and "bottom" too
//                   //     child:Container(
//                   //       height:100,
//                   //       width:100,
//                   //       color: Colors.purple,
//                   //       child: Text("Box VI"),
//                   //     )
//                   // ),
//                 ]
//             )
//         )
//     );
//   }
// }