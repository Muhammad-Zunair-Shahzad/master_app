import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imageURL =
      "https://static.vecteezy.com/system/resources/thumbnails/037/098/807/small/ai-generated-a-happy-smiling-professional-man-light-blurry-office-background-closeup-view-photo.jpg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple, // Full fill the Drawer
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  accountName:const Text('Muhammad Zunair Shahzad'),
                  accountEmail: const Text('zunairshahzad2004@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageURL), // Image.asset() & Image.network() are widgets not ImageProviders like NetworkImage
                  ),
                 // decoration: const BoxDecoration(color: Color.fromARGB(255, 128, 83, 206)), // Uncomment for difference
              ),
            ),
            // Divider....
          ],
        ),
      ),
    );
  }
}

/*
--> currentAccountPicture: Image.network(imageURL) ---> results in a square image 

--> currentAccountPicture: CircleAvator(child : Image.network(imageURL)) ---> ugly sq pic on circlular background

 */