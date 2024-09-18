import 'package:flutter/material.dart';
import 'package:master_app/utils/routes.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  String name = "";
  bool changeButton = false;
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
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name ",
              style: const TextStyle(
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
                    onChanged: (value) {// Welcome Zun.... , value is of type String
                      name = value;
                      setState(() {});
                    },
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
                  InkWell(
                    onTap: () async {
                      changeButton = true;
                      setState(() {});
                      await Future.delayed(const Duration(seconds: 1));
                      if (!mounted) {
                        return;
                      } 
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    }, // onTap
                    child: AnimatedContainer(                    
                      duration: const Duration(seconds: 1),     
                      width: changeButton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 107, 122, 212),
                        borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                      ),
                      child: changeButton
                          ? const Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                    ),
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
--> Wrapping a container inside GestureDetuctor ✅🤔 || InkWell ✅🤗

--> onChanged: (value) { 
        name = value;  
        setState(() {
      });
    },
    You can also write (name = value) inside setState curley brackets 🤗


--> We use AnimatedContainer wrap with InkWell instead of ElevatedButton... 🤗
     ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 107, 122, 212),
                      minimumSize: const Size(150, 40),
                    ),
                    child: const Text("Login"),
       ),

      Animatted Container can only use 1 thing at a time either shape (⭕R) borderRadius

      shape: changeButton ? BoxShape.circle: BoxShape.rectangle, (⭕R)
      borderRadius: BorderRadius.circular(changeButton? 50 : 8),

--> What is async ?
    
      In easy words, async is a way to tell Dart, "Hey, this part of the code might take some time, 
      but don't stop everything else—keep doing other tasks while you wait."

      When you mark a function as async, it means that the function can pause when it reaches something like 
      await (which waits for a result) but allows the rest of your app to keep running smoothly.

      Think of it like ordering food at a restaurant. You place your order (async), the chef starts cooking, 
      but in the meantime, you can do other things (like chat with friends) until the food is ready (await).

--> Why we need mounted ?
     
      Even if everything seems to be running smoothly, an asynchronous operation (like await) can cause a delay, 
      and during that time, the widget using BuildContext might get removed from the screen or replaced.

      Imagine you're waiting in line for food (await), but during that time, the restaurant (widget) closes or 
      changes ownership (the widget gets disposed or rebuilt). Now, you can't use your order ticket (BuildContext) 
      at the new place—it’s no longer valid because the restaurant that gave you that ticket doesn’t exist anymore.

--> What is Mounted ?

      Mounted is a property that indicates whether the widget is still part of the widget tree.

      The if (!mounted) return; line ensures that context is only used if the widget is still mounted 
      (i.e., it hasn't been removed or disposed of).
       

*/

// ✅ ❌ 😵 🤗 😥 🤔 (⭕R) 