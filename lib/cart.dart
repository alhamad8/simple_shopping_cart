import 'package:flutter/material.dart';
import 'package:provider_learning/item.dart';

class Cart with ChangeNotifier {
  final List<Items> _items = [];
  double _price = 0;
  void add(Items iteme) {
    _items.add(iteme);
    _price += iteme.price!;
    notifyListeners();
  }
  void remove(Items iteme) {
    _items.remove(iteme);
    _price -= iteme.price!;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalprice {
    return _price;
  }

  List<Items> get basketitem {
    return _items;
  }
}
