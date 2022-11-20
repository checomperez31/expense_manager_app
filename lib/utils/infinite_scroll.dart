import 'package:flutter/cupertino.dart';

class InfiniteScroll extends ScrollController {
  final VoidCallback? onLoadMore;

  InfiniteScroll({this.onLoadMore}) {
    if(onLoadMore != null) addListener(_endListener);
  }

  void _endListener() {
    if (position.pixels == position.maxScrollExtent) {
      onLoadMore?.call();
    }
  }

  @override
  void dispose() {
    if(onLoadMore != null) removeListener(_endListener);
    super.dispose();
  }
}