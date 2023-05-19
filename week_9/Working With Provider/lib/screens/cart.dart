import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:working_with_provider/models/cart.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.displayLarge),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        color: Colors.yellowAccent,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 24, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var itemNameStyle = Theme.of(context).textTheme.displayLarge;
    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: (){
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var hugeStyle = Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 40);

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<CartModel>(
            builder: (context, cart, child) =>
                Text('\$${cart.totalPrice}',style: hugeStyle),
          ),
          const SizedBox(width:24),
          FilledButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Buying not supported yet.'))
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Buy')
          )
        ],
      ),
    );

  }
}



