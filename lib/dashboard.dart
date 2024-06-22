import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_app/model/bouquet_list.dart';
import 'detail_item.dart';
import 'cart.dart';
import 'package:provider/provider.dart';
import 'package:project_app/resources/color.dart';
import 'package:project_app/data_holder.dart';

class dashboardPage extends StatefulWidget {
  const dashboardPage({super.key});

  @override
  State<dashboardPage> createState() => _dashboardPageState();
}

class _dashboardPageState extends State<dashboardPage> {
  final TextEditingController _textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cart = context.read<Cart>();
    final bouquetMenu = cart.bouquetMenu;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 175,
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Text(
                        'Hai, ${DataHolder.storedTextName}',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: secondaryColor,
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          height: 45,
                          child: CupertinoSearchTextField(
                            backgroundColor: Colors.white,
                            controller: _textcontroller,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Special',
              style: TextStyle(
                  fontSize: 23,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
            height: 210,
            child: CarouselWithIndicatorDemo(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Bouquet',
              style: TextStyle(
                  fontSize: 23,
                  color: primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: BouquetList(),
          ),
        ],
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

class BouquetList extends StatelessWidget {
  const BouquetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: bouquetList.map((item) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(item: item);
                  },
                ),
              );
            },
            child: Card(
              shadowColor: secondaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.asset(
                      item.imgAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          child: Center(
                            child: Card(
                              color: primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Rp. ${item.price}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
