import 'package:database/pages/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int _index = 0;
  var suggestionsScroll = ScrollController(keepScrollOffset: false);
  final List<String> sortings = [
    "For you",
    "Today",
    "Following",
    "Health",
    "Renderplex"
  ];
  List<Image> images = [];

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  void loadImages() {
    for (int i = 0; i < 10; i++) {
      var image = Image.asset("assets/images/$i.jpeg");
      images.add(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Container(
            height: size.height * 0.11,
            child: Padding(
              padding: const EdgeInsets.only(top: 45.0),
              child: ListView.builder(
                  controller: suggestionsScroll,
                  scrollDirection: Axis.horizontal,
                  itemCount: sortings.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          images.shuffle();
                          _index = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 30,
                          width: 80,
                          alignment: Alignment.center,
                          child: Text(
                            sortings[index],
                            style: _index != index
                                ? const TextStyle(color: Colors.black)
                                : const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                          ),
                          decoration: _index != index
                              ? null
                              : const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0))),
                        ),
                      ),
                    );
                  }),
            ),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10.0,
                  spreadRadius: 1.0)
            ]),
          ),
        ),
        preferredSize: const Size.fromHeight(70),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: MasonryGridView.count(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10.0, bottom: 100),
            itemCount: 10,
            crossAxisCount: 2,
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    child: Hero(
                      tag: "$index",
                      child: Container(
                        height: images[index].height,
                        width: images[index].width,
                        child: images[index],
                        clipBehavior: Clip.hardEdge,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (context, animation, anim) =>
                              DetailsPage(image: images[index], id: index),
                          transitionDuration: const Duration(milliseconds: 400),
                          transitionsBuilder: (context, anim1, anim2, child) {
                            return FadeTransition(opacity: anim1, child: child);
                          },
                          fullscreenDialog: true));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Something"),
                      Icon(Icons.more_horiz),
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
  @override
  void dispose() {
    suggestionsScroll.dispose();
    super.dispose();
  }
}