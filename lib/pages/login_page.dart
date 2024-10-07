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
      await Future.delayed(const Duration(seconds: 1)); //  Introduce a delay of 1 second in your Dart or Flutter code before continuing to the next line.
      if (context.mounted) { 
        await Navigator.pushNamed(context, MyRoutes.homeRoute); // Don't goes to next line instantly until the user oress back button in his mobile 
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


// ✅ ❌ 😵 🤗 😥 🤔 (⭕R) 💡 💬 💭 🚫
