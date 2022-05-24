import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkout")),
      body: Consumer<Cart>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.basketitem.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: Text("${value.basketitem[index].name}"),
              trailing: IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  value.remove(value.basketitem[index]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
