import 'package:flutter/material.dart';
import 'package:master_app/utils/routes.dart';

// Stateful class Analogy
// State<LogInPage> -> tells Widget Class that there i some changing inside me -> Widget Class tells flutter about this change to make Ui change  


class LogInPage extends StatefulWidget { 
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> { 
  String name = "";
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>(); 

// Form is a widget
// GlobalKey allows you to use the form's state at any time***
// FormState tells i keep record of each TextFormField uniquely, but for this I need a key
// that is why I assign like key : _formkey = GlobalKey<FormState>();
  
  moveToHome(BuildContext context) async { // By default BuiltContext is written inside ()
    if (_formkey.currentState!.validate()) { 
      changeButton = true;
      setState(() {});
      await Future.delayed(const Duration(seconds: 1));
      if (context.mounted) { // Mounted keep track of everything is still on its place before going inside of body ??? If (True) go inside
        await Navigator.pushNamed(context, MyRoutes.homeRoute); // Wait Please! do not instantly goes to next line (changeButton = false) until Zunair himself goes back
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
          key:_formkey, // key : _formkey = GlobalKey<FormState>();
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
                      validator: (value) {// Here the reciever means Dart not sure about value can be null or not null so add ! with value
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null; // Return null if the value is valid (no error), otherwise you got warning under { of validator
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                      ),
                      validator: (value) { // Here the reciever (value) can be null or not null not sure... so add ! with value
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (value.length < 8) {
                          return "Password length should be atleast 8";
                        }
                        return null; // Return null if the value is valid (no error), otherwise Flutter gives me warning under curley { of validator, that u don't tell me that I am correct/null (means I am entering correct data)  
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
                        onTap: () => moveToHome(context), // By default context is written inside ()
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

/*

--> Mounted check comes in, making sure everything is still in place before using BuildContext.

--> To add appBar ?
          
                Use Scaffold and inside this use appBar Instead of Material widget at the top

--> purpose of 2nd await
          
                The second await ensures that the button (which is controlled by changeButton) will stay 
                in its "true" state while the user is on the new screen (navigated by Navigator.pushNamed).

                After the user navigates back to the previous screen (the one you're on), changeButton = false 
                will be executed, changing the button state back to its original state.

                If you don't use await, the Navigator.pushNamed function will trigger the navigation, but the 
                following lines (like changeButton = false;) will be executed immediately rather than waiting 
                for the user to finish with the new screen.

--> Validator
                
                No, you cannot use validator without a Form widget in Flutter.

                The validator is a feature of the Form widget, specifically designed to validate fields within a form 
                (like TextFormField). Here’s why:

                validator is a property of TextFormField and other form-related widgets, and it's used to validate the form field's input. 
                However, it only works when the field is wrapped in a Form widget because the Form provides the validation framework and 
                keeps track of all the fields inside it.

                I use 2 TextFormFields, these are the fields of Form

--> Ripple Approach1 : 

                  When I use only 'Container widget' inside 'InkWell widget' as a button...
                  I preffer not to use container widget in this case, instead use 'Ink widget' in place of
                  that, but ink widget doen't takes (duration & alignment)...

                   child: Ink(
                      //duration: const Duration(seconds: 1), 
                      width: changeButton ? 50 : 150,
                      height: 50,
                      //alignment: Alignment.center, 
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 107, 122, 212),
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                      ),
                      child: changeButton

                🚫 Ink widget will not support duration... Morever it seems to be very slow...


--> Ripple Approach2 : 

             Wrap InkWell inside Material widget, and remove Boxdecoration from animated container, and add color and border radius 
             just before the Material widget...

     
        
*/

// ✅ ❌ 😵 🤗 😥 🤔 (⭕R) 💡 💬 💭 🚫
