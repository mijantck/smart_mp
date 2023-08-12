import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:smart_mp/utils/AppString.dart';

import '../../../models/respons/SliderModel.dart';

class AutoSliderScreen extends StatelessWidget {
  final List<SliderModel> sliders;
  AutoSliderScreen({required this.sliders});

  @override
  Widget build(BuildContext context) {
    sliders.forEach((element) {
      print('dfhgsdh ${element.imageUrl}');
    });
    return Scaffold(
      body: FlutterCarousel(
        options: CarouselOptions(
          height: 400.0,
          aspectRatio: 16 / 9,
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          controller: CarouselController(),
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
          pauseAutoPlayOnTouch: true,
          pauseAutoPlayOnManualNavigate: true,
          pauseAutoPlayInFiniteScroll: false,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          disableCenter: false,
          showIndicator: false,
          slideIndicator: CircularSlideIndicator(),
        ),
        items: sliders.map((slider) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                  child: Image.network('${AppString.IMAGE_URL}${slider.imageUrl}',fit: BoxFit.cover,));
            },
          );
        }).toList(),
      ),
    );
  }
}
