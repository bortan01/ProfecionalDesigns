import 'package:dis/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutProvider extends ChangeNotifier {

  Widget _currentPage = const SlideshowPage();
  Widget get currentPage => _currentPage;
  set currentPage(Widget value) {
    _currentPage = value;
    notifyListeners();
  }
}
