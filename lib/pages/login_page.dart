import 'package:flutter/material.dart';
import 'package:master_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      await Future.delayed(const Duration(seconds: 1)); //  NOTE6
      if (context.mounted) { 
        await Navigator.pushNamed(context, MyRoutes.homeRoute); // NOTE7
      }
      changeButton = false;
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor, // NOTE1
      child: SingleChildScrollView(
        child: Form(
          key:_formkey, 
          child: Column( 
            children: [ 
              VxArc(
                height: 10,
                arcType: VxArcType.convey,
                child: Container(
                  color: context.theme.floatingActionButtonTheme.backgroundColor,  
                  child: Image.asset( 
                    'assets/images/login_image_2_3.png',
                    fit: BoxFit.cover,
                  ),
                ),
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
                      decoration: InputDecoration(
                        hintText: 'Enter Username',
                        labelText: 'Username',
                        labelStyle: TextStyle(color: context.accentColor), // NOTE3 
                        enabledBorder: UnderlineInputBorder( // NOTE4
                          borderSide: BorderSide(color: context.accentColor)
                        ),
                        focusedBorder: UnderlineInputBorder( // NOTE5
                          borderSide: BorderSide(color: context.accentColor)
                        )
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
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                        labelStyle: TextStyle(color: context.accentColor), // NOTE3 
                        enabledBorder: UnderlineInputBorder( // NOTE4
                          borderSide: BorderSide(color: context.accentColor)
                        ),
                        focusedBorder: UnderlineInputBorder( // NOTE5
                          borderSide: BorderSide(color: context.accentColor)
                        )
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
                    // Creating animated Button
                    Material(
                      color: context.theme.floatingActionButtonTheme.backgroundColor, // NOTE2
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


/*

NOTE1:
      --> color: Colors.white

NOTE2:
      --> color: Colors.deepPurple changes to color: context.theme.floatingActionButtonTheme.backgroundColor

NOTE3:
      --> label name previously is light white, I explicitely give the lable style context.accentColor 

NOTE4:
      --> White underline instead of light grey white, when not focused (mean when user not write any name and password)
  
NOTE5:
      --> White underline instead of light grey white, when not focused (mean when user write any name and password)

NOTE6:
      --> Introduce a delay of 1 second in your Dart or Flutter code before continuing to the next line.
    
NOTE7:
      --> Don't goes to next line instantly until the user oress back button in his mobile.
 */