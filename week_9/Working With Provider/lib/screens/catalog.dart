import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:working_with_provider/models/cart.dart';
import 'package:working_with_provider/models/catalog.dart';

class CatalogScreen extends StatelessWidget{
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers : [
          _MyAppBar(),
          const SliverToBoxAdapter( child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index),
            ),
          )
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget{

  final Item item;
  const _AddButton({required this.item});

  @override
  Widget build(BuildContext context) {

    //The following method will let the provider know to only rebuild
    //the widget only when the item is not in the cart
    var isInCart = context.select<CartModel, bool>(
      //it will check if the item is in the cart or not.
        (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
        ? null
        : () {
          var cart =  context.read<CartModel>();
          cart.add(item);
        },
        style : ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states){
            if(states.contains(MaterialState.pressed)){
              return Theme.of(context).primaryColor;
            }
            return null;
          }),
        ),
      child: isInCart
        ? const Icon(Icons.check, semanticLabel: 'ADDED',)
        :const Text('ADD'),
      );
  }
}

class _MyAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.displayLarge,),
      floating: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          // onPressed: () => context.go('/catalog/cart'),
          onPressed: () => context.go('/cart'),
        )
      ],
    );
  }
}

class _MyListItem extends StatelessWidget{

  final int index;
  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {

    var item = context.select<CatalogModel, Item>(
        (catalog) => catalog.getByPosition(index),
    );

    var textTheme = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(item.name, style: textTheme),
            ),
            const SizedBox(width: 24),
            _AddButton(item: item)
          ],
        ),
      ),
    );
  }
}
