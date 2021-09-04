import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:praxis/models/cover.dart';
import 'package:praxis/screens/home_screen.dart';

class GalleryPageView extends StatefulWidget {
  final List<Cover> covers;

  GalleryPageView({Key? key, required this.covers});

  @override
  State<StatefulWidget> createState() => _GalleryPageViewState();
}

class _GalleryPageViewState extends State<GalleryPageView> {
  PageController _pageController = PageController();
  int _currentPage = 1;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => _nextPage());
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300, child:
        PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: widget.covers.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            widget.covers[index].url ?? ""))));
          },
        )),
        SizedBox(height: 20,),
        Text("$_currentPage de ${widget.covers.length}")
      ],
    );
  }
  
  void _nextPage(){
    if (_currentPage < widget.covers.length) {

      setState(() => _currentPage++);

      _pageController.animateToPage(
      _currentPage-1,
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
      );

    } else {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));  
    }

  }

}
