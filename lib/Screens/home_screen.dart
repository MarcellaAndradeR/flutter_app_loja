import 'package:flutter/material.dart';
import 'package:flutter_app_loja/Tabs/home_tab.dart';
import 'package:flutter_app_loja/Tabs/product_tab.dart';
import 'package:flutter_app_loja/Widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductTab(),
        ),
        Container(color: Colors.green,),
        Container(color: Colors.red,),
      ],
    );
  }
}
