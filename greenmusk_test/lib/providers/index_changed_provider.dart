import 'package:flutter/material.dart';

class IndexChangedProvider extends ValueNotifier<int> {
  int _pageIndex;
  bool isDispose = false;

  IndexChangedProvider(this._pageIndex) : super(0);

  int get getPageIndex => _pageIndex;

  void changePageIndex(int newIndex) {
    _pageIndex = newIndex;
  }

  @override
  void dispose() {
    _pageIndex = 0;
    super.dispose();
  }
}
