import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  List<CardItem> items = [
    CardItem(urlImage: 'images/poubeille.png', title: 'dechets sauvages'),
    CardItem(urlImage: 'images/nettoyage.png', title: 'dechets normes'),
    CardItem(urlImage: 'images/nettoyage.png', title: 'dechets normes'),
    CardItem(urlImage: 'images/nettoyage.png', title: 'dechets normes'),
    CardItem(urlImage: 'images/nettoyage.png', title: 'dechets normes'),
    CardItem(urlImage: 'images/nettoyage.png', title: 'dechets normes'),
    CardItem(urlImage: 'images/nettoyage.png', title: 'dechets normes'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(13),
      child: Container(
        child: Row(children: [
          Image.asset('images/imageenvi.png'),
        ]),
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 22, 156, 22)),
      ),
    );
  }
}

class CardItem {
  final String urlImage;
  final String title;
  CardItem({
    required this.urlImage,
    required this.title,
  });
}
