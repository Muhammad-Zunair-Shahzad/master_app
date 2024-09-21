import 'package:flutter/material.dart';
import 'package:master_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item}); // Every named parameter is opearnd, like this.item, and operand can never be null
  final Item item; // we are accessing and instance from the List<Item> indexwise or 1 by 1 item. I name it as item instead of items 

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: const Color.fromARGB(255, 235, 232, 232),
      // shadowColor: Colors.red, // Card Elevation
      // shape:const StadiumBorder(),
      child: ListTile(
        onTap: (){
          print('${item.name} pressed');
        },
        leading: Image.network(item.image), // image of list<Item> items[0]
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
                  textScaler: const TextScaler.linear(1.5),
                  style: const TextStyle(color: Colors.deepPurple,
                  fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

/*
--> Old Flutter version

        * const ItemWidget({Key? key, required this.item})
          : assert(item != null),
            super(key: key);
            final Item item;

        * key is nullable or not in old versison so add ?
        * not sure about named paramter, wether it is null or not
        * assert(item != null) will work at run time only

--> New Flutter version

        * const ItemWidget({super.key, required this.item});
        * named parameter will not be nullable always

--> Point
     
        * Whenever use ListView we use ListTile : ListView for scroll, ListTile for an empty tile in ListView
        * Whenever use ListView.builder we use ListTile : ListView.builder is used to iterate over the list<Item> items using index, 
          ListTile is used for each specific item
        * 
*/
