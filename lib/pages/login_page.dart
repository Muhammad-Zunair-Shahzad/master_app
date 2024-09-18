import 'package:flutter/material.dart';
import 'package:master_app/utils/routes.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/login_image.png',
              fit: BoxFit.cover,
              // height: 1000
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter Username',
                      labelText: 'Username',
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter password',
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 107, 122, 212),
                      minimumSize: const Size(150, 40), // (width, height)
                    ),
                    child: const Text("Login"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
--> SingleChildScrollView

        If the mobile screen is very small then may be some widgets are cut off... 😵
        This is called overflow error so to say...
        Solution: wrap the outermost column with SingleChildScrollView ✅
                     
--> Navigator.push(context, route)

        Like loginRoute & homeRoute in routes.dart, Push is also Static, if you go to its documentation... ✅
        Means that we are not creating a seperate object... ✅
        eg) if by default it is not static then whenever you push you have to create a new oject 😵 ...
            like: Navigator().push(context, route)


--> Working of Elevated Button
          
           Button Press: When the button in LogInPage is pressed, it triggers Navigator.pushNamed(context, MyRoutes.homeRoute);
           Route Lookup: Flutter looks up MyRoutes.homeRoute in the routes table and finds the corresponding widget (HomePage).
           Push Route: Flutter pushes the HomePage widget onto the navigation stack, displaying it on the screen.
           Basically we use static string routes name in routes.dart because of 2 purpose:-
           -> In main in route table String is required
           -> In loginpage Navigator.pushNamed is used which alos requires string


--> Navigator.push

       In this file, Navigator.pushNamed is used, this is also an method, but still I cannot use this...
       onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(), // Replace with your home page widget
                        ),
                      );
                    },
       Here note that HomePage() is creating an object ✅...
       As a result, routes.dart file use useless... 😥 
       Why ? Because MyRoutes contains static data members of type string ✅
     
 */

// ✅ ❌ 😵 🤗 😥 