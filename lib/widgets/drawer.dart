import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  final imageURL =
      "https://static.vecteezy.com/system/resources/thumbnails/037/098/807/small/ai-generated-a-happy-smiling-professional-man-light-blurry-office-background-closeup-view-photo.jpg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple, 
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  accountName:const Text('Muhammad Zunair Shahzad'),
                  accountEmail: const Text('zunairshahzad2004@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageURL),
                  ),
                decoration: const BoxDecoration(color: Color.fromARGB(255, 113, 62, 202)),
                margin: EdgeInsets.zero,
              ),
            ),
            // Add devider to see the problem... 
            const ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text("Home", textScaler: TextScaler.linear(1.2),style: TextStyle(color: Colors.white),),
            ),
             const ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text("Profile", textScaler: TextScaler.linear(1.2),style: TextStyle(color: Colors.white),),
            ),
             const ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text("Email me", textScaler: TextScaler.linear(1.2),style: TextStyle(color: Colors.white),),
            ),
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