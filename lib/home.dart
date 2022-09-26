import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tinder_shopping_app/utils/models/product.dart';
import 'package:tinder_shopping_app/widgets/bottom_bar.dart';
import 'package:tinder_shopping_app/widgets/product_card.dart';
import 'package:tinder_shopping_app/widgets/top_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 70),
          const TopBar(),
          Expanded(
            child: FutureBuilder(
              future: fetchJsonData(),
              builder: (context, data) {
                if (data.hasError){
                  return Center(child: Text('${data.error}'));
                } else if (data.hasData) {
                  List<Product> products = data.data as List<Product>;
                  var productCards = products.map((product) => ProductCard(product: product)).toList();
                  for (var product in productCards) {
                    _swipeItems.add(SwipeItem(
                      content: Product(
                        gender: product.product.gender,
                        id: product.product.id,
                        sku: product.product.sku,
                        stockStatus: product.product.stockStatus,
                        imageUrl: product.product.imageUrl,
                        url: product.product.url,
                        price: product.product.price
                      )
                    ));
                  }

                  _matchEngine = MatchEngine(swipeItems: _swipeItems);
                  return Stack(
                    children: [
                        Container(
                          height: MediaQuery.of(context).size.height - kToolbarHeight,
                          child: SwipeCards(
                            matchEngine: _matchEngine!,
                            itemBuilder: (BuildContext context, int index) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(_swipeItems[index].content.imageUrl),
                                  fit: BoxFit.cover
                                )
                              ),
                              child: Text(
                                _swipeItems[index].content.id.toString(),
                                style: TextStyle(fontSize: 100),
                                ),
                              );
                            },
                            itemChanged: (SwipeItem item, int index) {
                          },
                          upSwipeAllowed: true,
                          fillSpace: true, onStackFinished: (){},
                        ),
                      ),
                    ]
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            ),
          ),
          const BottomBar()
        ],
      ),
    );
  }

  Future<List<Product>> fetchJsonData() async {
    final jsonData = await rootBundle.loadString('assets/sample-data.json');
    final products = json.decode(jsonData) as List<dynamic>;

    return products.map((productJson) => Product.fromJson(productJson)).toList();
  }
}

class Content {
  final String? text;
  Content({this.text});
}