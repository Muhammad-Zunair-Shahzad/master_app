import 'package:flutter/material.dart';
import 'package:master_app/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const CartList().p32().expand(), // NOTE1
          const Divider(),
          const CartTotal(),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  const CartList({super.key});
  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  final _cart = CartModel(); // NOTE3 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _cart.items.length, // NOTE4: List<Item> items, in the start the list will be null so nothing will display on the screen
        itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_circle_outline)),
              title: _cart.items[index].name.text.make(), // NOTE5: Instead of "item1".text.make(), we write _cart.items[index].name
            ));
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${cart.totalPrice}".text.color(context.accentColor).xl5.make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet.".text.make()));
            },
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    context.theme.floatingActionButtonTheme.backgroundColor)),
            child: "Buy".text.white.make(),
          ).w32(context), //NOTE2
        ],
      ),
    );
  }
}



/*

NOTE1
      --> It is ok to expand the Placeholder() inside the flex widgets like column, row, or flex
      --> wrapping Expanded or Flexible outside of a flex container (mean column, row, or flex) would result in that error. 
      --> Later on I replace PlaceHolder with CartList (stateful widget: because we may also add a function to remove things) 

NOTE2:
      --> giving a width of 32 inside the elevated button

NOTE3:
      --> Creating an obj of CartModel, so _cart behavees like object of CartModel

NOTE4:

 */
