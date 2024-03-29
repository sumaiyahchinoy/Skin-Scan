import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../entities/product_entities.dart';

class SearchProvider extends ChangeNotifier {
  List<Product> searchProductList = [];
  List<Product> filteredList = [];
  List<Product> get search => searchProductList;
  bool isFilter = false;
  String dropdownvalue = 'No filter';
  List<Product> searchBarList = [];
  bool searchBarActive = false;

  void makeCopy(List<Product> categoryProductList) {
    searchProductList.clear();
    searchProductList.addAll(categoryProductList);

    notifyListeners();
  }

  List<Product> searchBar(
      String searchText, List<Product> categoryProductList) {
    searchBarList.clear();
    searchBarActive = true;

    for (int i = 0; i < categoryProductList.length; i++) {
      if (categoryProductList[i]
          .productName
          .toLowerCase()
          .contains(searchText)) {
        searchBarList.add(categoryProductList[i]);

      }
    }

    notifyListeners();
    return searchBarList;
  }

  List<Product> getSearchList() {
    print("searchbar ${searchBarList.length}");
    return searchBarList;
  }
  clearSearchList(){
    searchBarList.clear();
    notifyListeners();
  }

  String changeDropDownValue(String value) {
    dropdownvalue = value;
    return dropdownvalue;
  }

  List<Product> filterAccToPrice(
      String value, List<Product> categoryProductList) {
    filteredList.clear();
    //setIsFilter();

    if (value == 'No filter') {
      filteredList.clear();
      filteredList.addAll(categoryProductList);
    } else if (value.contains('<=3000')) {
      filteredList.clear();
      for (var product in searchProductList) {
        if (int.parse(product.productPrice) <= 3000) {
          filteredList.add(product);
        }
      }
    } else if (value.contains('>3000 & <=5000')) {
      filteredList.clear();
      for (var product in searchProductList) {
        if (int.parse(product.productPrice) > 3000 &&
            int.parse(product.productPrice) <= 5000) {
          filteredList.add(product);
        }
      }
    } else {
      filteredList.clear();
      for (var product in searchProductList) {
        if (int.parse(product.productPrice) > 5000) {
          filteredList.add(product);
        }
      }
    }
    notifyListeners();
    return filteredList;
  }

  // setIsFilter() {
  //   isFilter = true;
  //   //notifyListeners();
  // }

  List<Product> getFilteredList() {
    //notifyListeners();
    return filteredList;
  }
}
