import 'package:flutter/material.dart';
import 'package:master_app/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    int days = 30;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
      ),
      body: Center(
        child: Text(context.runtimeType.toString()),
      ),
      drawer: const MyDrawer(),
    );
  }
}


/*
--> Using body:Center Widgit

        Center takes a full screen 

--> Using body: Container Widgit

        Box is shown on the left side why ?
        On ctrl + right on container widget
        By default, container widget wrap inside column with property .max
        As a result, Container will be on the left side in the start

--> Wrapping container inside container

        Inner Container forgets its height and width
        Consequently, inner container adopts the height and width of outer container

--> profile pic on Drawer

        Profile picture is fixed due to Sized Box condition
        If radius inside circularAvator widget will be inc or dec
        Profile picture remains same 

--> Constraints goes down 
       
        Constraits applies to its child with some flexibility 
        Like maxLength, minLenth, maxWidth and minWidth
        These property help the inner widget to expand or contract itself acc to the constraints of Parent container
        Due to constraint, by default inner container takes the maxLength & maxWidth
        But if inner container has its own height and width having range b/w or = to (maxLength and minLength && maxWidth and minWidth)

        body: Container(
        constraints: const BoxConstraints(
          maxHeight: 300,
          maxWidth: 300,
          minHeight: 40,
          minWidth: 40,
        ),
        child: Container(
          color: Colors.red,
        ),
        
--> widget tree - Element Tree - Rander Tree

  * widget tree is immutable
  * element tree calls the buildcontext and find the Statelesselements position
  * then element tree goes to Rander Tree...
  * for every change element tree calls the buildcontext for that immutable widget 
  * as a result, previous widget gets destroyed and the new immutable widget formed

--> Context

  * Context is a statelessElement which helps the element tree to find the position
    or location inside that immutable widgit...
 
  * As, immutable widget like container, contains several properties, these properties
    are also immutable, and for this context (statelessElement plays a role) to point
    to that immutable or stateless property
    
  * StatelessElement gives the new element location form the widget tree -> to the element tree...
    
  * Immutable itself is statelss, so definatly it requires some stalessElement to find its location...  
   
  * Always statelesselement points to immutable widgit tree, as a result because statelessEelement 
    points to it, so we will get the desired location 

 */