import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:wallify/utils/colors.dart';
import 'package:wallify/utils/icons.dart';
import 'package:wallify/utils/images.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({super.key, this.title});

  final String? title;

  @override
  _ViewAllState createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _imagePaths = [
    'assets/images/waterfalls/Victoria.jpg',
    'assets/images/waterfalls/ange.jpg',
    'assets/images/waterfalls/Iguazu.jpg',
    'assets/images/waterfalls/Plitvice.jpg',
    'assets/images/waterfalls/NiagaraFalls.jpg',
  ];

  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  bool _showHeart = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeSwipeItems();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
  }

  void _initializeSwipeItems() {
    _swipeItems.clear();
    for (int i = 0; i < _imagePaths.length; i++) {
      _swipeItems.add(SwipeItem(
        content: Content(imagePath: _imagePaths[i]),
        likeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.pink,
            content: Text("Liked image ${i + 1}"),
            duration: const Duration(milliseconds: 500),
          ));
        },
        nopeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("Nope image ${i + 1}"),
            duration: const Duration(milliseconds: 500),
          ));
        },
        superlikeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey,
            content: Text("Superliked image ${i + 1}"),
            duration: const Duration(milliseconds: 500),
          ));
        },
      ));
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleDoubleTap() {
    setState(() {
      _showHeart = true;
    });

    // Start the animation
    _controller.forward(from: 0);

    // Hide the heart icon after 1 seconds
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _showHeart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_matchEngine == null || _swipeItems.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Positioned.fill(
            child: Stack(
              children: [
                Image.asset(
                  AppImage.splash1,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: Container(color: Colors.green.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70.h,
            left: 10.w,
            right: 10.w,
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppIcons.back,
                      height: 35.h,
                      width: 35.w,
                      color: AppColors.whitecolor,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Trending Wallpapers",
                    style: TextStyle(
                      color: AppColors.whitecolor,
                      fontSize: 20.sp,
                      fontFamily: 'Kodchasan',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 130.h,
            left: 10.w,
            right: 10.w,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - kToolbarHeight,
              child: SwipeCards(
                matchEngine: _matchEngine!,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onDoubleTap: _handleDoubleTap,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 400.h,
                          width: 400.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            _swipeItems[index].content.imagePath!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (_showHeart)
                          ScaleTransition(
                            scale: _scaleAnimation,
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 100,
                            ),
                          ),
                      ],
                    ),
                  );
                },
                onStackFinished: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Stack Finished"),
                    duration: Duration(milliseconds: 500),
                  ));
                  setState(() {
                    _initializeSwipeItems();
                  });
                },
                itemChanged: (SwipeItem item, int index) {
                  print("item: Image ${index + 1}");
                },
                leftSwipeAllowed: true,
                rightSwipeAllowed: true,
                upSwipeAllowed: true,
                fillSpace: true,
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              height: 50.h,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Set Wallpaper',
                  style: TextStyle(
                    color: AppColors.whitecolor,
                    fontSize: 20.sp,
                    fontFamily: 'Kodchasan',
                    fontWeight: FontWeight.bold,
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

class Content {
  final String? imagePath;

  Content({this.imagePath});
}
