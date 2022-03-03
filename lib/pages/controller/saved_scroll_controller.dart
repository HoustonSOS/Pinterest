import 'package:flutter/material.dart';

//Manually saves ScrollController to the closest PageStorage widget
class SavedScrollController{
  final ScrollController _controller = ScrollController(keepScrollOffset: false);

  ScrollController get controller => _controller;

  void saveScrollPosition(BuildContext context){
    //making sure controller is attached to the widget

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      //getting scroll position from the storage
      var pixels = PageStorage.of(context)?.readState(context, identifier: "${context.widget.key}");
      if(pixels != null){
        _controller.jumpTo(pixels);
      }
    });

    //saving scroll position to the storage
    controller.addListener(() {
      var pixels = controller.position.pixels;
      PageStorage.of(context)?.writeState(context, pixels, identifier: "${context.widget.key}");
    });
  }
}