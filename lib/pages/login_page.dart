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
  final _formkey = GlobalKey<FormState>(); 

  moveToHome(BuildContext context) async { 
    if (_formkey.currentState!.validate()) { 
      changeButton = true;
      setState(() {});
      await Future.delayed(const Duration(seconds: 1));
      if (context.mounted) { 
        await Navigator.pushNamed(context, MyRoutes.homeRoute); 
      }
      changeButton = false;
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key:_formkey, 
          child: Column(
            children: [
              Image.asset(
                'assets/images/login_image_2.png',
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Username',
                        labelText: 'Username',
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null; 
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                      ),
                      validator: (value) { 
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (value.length < 8) {
                          return "Password length should be atleast 8";
                        }
                        return null; 
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    // Creating an Animated Button
                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context), 
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
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
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// At first simply changeButton is false, basically this is for displaying an anaimated button.
// Button display and the validator inside TextFormField return null, which shows that correct data added.
// When user tap button, OnTap() function of InkWell call and we goes to moveToHome function
// Inside moveToHome function first changeButton = true and the setState Called
// Now again build method call and the button show animation, in such a way that 1stly button widths contract within 1 sec and shows the tick icon
// now we again goes back to moveToHome function and then await future delay line works, which simplay tells that do not go to next line instantly
// What is in the next Line ?
// Next Line contains, Navigator.pushNmaed as a result we goes to HomePage
// But wait we we use await with Navigator.pushNamed ? 
// Because when user press back button, button doesn't instantly expnaded or don't goes to next line iinstantly 
// next line will agian make changebutton = false and the setState is called
// ✅ ❌ 😵 🤗 😥 🤔 (⭕R) 💡 💬 💭 🚫
