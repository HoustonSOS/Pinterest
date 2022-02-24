import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.image, required this.id}) : super(key: key);

  final Image image;
  final int id;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          alignment: Alignment.topCenter,
          height: size.height * 0.95,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onVerticalDragDown: (details){
                    Navigator.of(context).pop();
                  },
                  child: Hero(
                    tag: "$id",
                    child: Container(
                      height: image.height,
                      width: image.width,
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.antiAlias,
                      child: image,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(50.0), left: Radius.circular(50)),
          ),
        ),
      ),
    );
  }
}

