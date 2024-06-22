import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class carousel extends StatelessWidget {
  const carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
              height: 210,
              child: CarouselWithIndicatorDemo(),
            ),
            Container(
              margin: EdgeInsets.all(20),
              color: Colors.red,
              height: 30,
            ),
            // Card(
            //   color: Colors.blue,
            //   child: SizedBox(
            //     height: 50,
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [               
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.hotel),
                          ],
                        ),
                        color: Colors.red,
                      ),
                    ),
                    Text('data'),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.hotel),
                          ],
                        ),
                        color: Colors.red,
                      ),
                    ),
                    Text('data'),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.hotel),
                          ],
                        ),
                        color: Colors.red,
                      ),
                    ),
                    Text('data'),
                  ],
                ),
              ],
            ),
            // Container(
            //   color: Colors.black,
            //   child: Stack(
            //     children: [
            //       Row(
            //         children: [
            //           Container(
            //             height: 30,
            //             color: Colors.blue,
            //           ),
            //           Container(
            //             height: 30,
            //             color: Colors.blue,
            //           ),
            //           Container(
            //             height: 30,
            //             color: Colors.blue,
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // )
            // Container(
            //   color: Colors.amber,
            //   height: 50,
            //   child: Stack(
            //     children: [
            //       Center(
            //         child: Container(
            //           color: Colors.red,
            //           height: 20,
            //           child: Row(
            //             children: [
            //               Container(
            //                 height: 30,
            //                 color: Colors.white,
            //               ),
            //               Container(
            //                 height: 30,
            //                 color: Colors.white,
            //               ),
            //               Container(
            //                 height: 30,
            //                 color: Colors.white,
            //               ),
            //             ],
            //           ),
            //         ),
            //       )
            //       // Row(
            //       //   children: [
            //       //     Container(
            //       //       height: 30,
            //       //       color: Colors.black,
            //       //     ),
            //       //     Container(
            //       //       height: 30,
            //       //       color: Colors.black,
            //       //     ),
            //       //     Container(
            //       //       height: 30,
            //       //       color: Colors.black,
            //       //     ),
            //       //   ],
            //       // ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<String> assetImages = [
    'images/banner-app-1.png',
    'images/banner-app-2.png',
    'images/banner-app-3.png',
    // tambahkan path ke semua gambar di sini
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      assetImages.forEach((assetPath) {
        precacheImage(AssetImage(assetPath), context);
      });
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider.builder(
        itemCount: assetImages.length,
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (context, index, realIdx) {
          return Container(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  assetImages[index],
                  fit: BoxFit.cover,
                  width: 1000,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
