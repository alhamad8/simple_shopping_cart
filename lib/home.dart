
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:provider_learning/cart.dart';
import 'package:provider_learning/checkOut.dart';
import 'package:provider_learning/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Items> myItems = [
    Items(name: "A50", price: 150),
    Items(name: "Iphone x", price: 500),
    Items(name: "Huawi p50", price: 400),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy mobile"),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CheckOut(),
                    ));
                  },
                  icon: const Icon(Icons.add_shopping_cart)),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Consumer<Cart>(
                    builder: ((context, value, child) => Text(
                          "${value.count}",
                          style: const TextStyle(fontSize: 20),
                        )),
                  ),
                  ),
              Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Consumer<Cart>(
                    builder: ((context, value, child) => Text(
                          "${value.totalprice}",
                          style: const TextStyle(fontSize: 20),
                        )),
                  ),
                  ),
            ],
          )
        ],
      ),
      body: ListView.builder(
        itemCount: myItems.length,
        itemBuilder: (context, index) {
          return Card(
              child: Consumer<Cart>(
            builder: (context, value, child) => ListTile(
              title: Text("${myItems[index].name}"),
              trailing: IconButton(
                  onPressed: () {
                    value.add(myItems[index]);
                  },
                  icon: const Icon(Icons.add)),
            ),
          ));
        },
      ),
    );
  }
}
