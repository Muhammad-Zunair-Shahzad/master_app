import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  // NOTE1
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: false,
        cardColor: Colors.white,
        canvasColor: creamColor,
        colorScheme:
        ColorScheme.fromSwatch(accentColor: darkBluishColor), // NOTE3
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: darkBluishColor,
        ),
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),
      );

  // NOTE2
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        useMaterial3: false,
  // NOTE5
        cardColor: Colors.black,
        canvasColor: darkGrayColor,
        colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.white, brightness: Brightness.dark), // NOTE4
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: indigoColor,
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: Theme.of(context).textTheme.copyWith(
            titleLarge: const TextStyle(
              color: Colors.white, fontSize: 20)
            ).titleLarge, // NOTE8
          // NOTE6 
          // NOTE7 
          
        ),
      );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishColor = const Color(0xff403b58);
  static Color darkGrayColor = Vx.gray800;
  static Color indigoColor = Vx.indigo500;
}


/*
NOTE1:
     --> Light Theme
         False: buttonTheme: ButtonThemeData(buttonColor: darkBluishColor),
         True: Use FloatingActionButtonTheme

NOTE2:
      --> Dark Theme
          False: buttonTheme: ButtonThemeData(buttonColor: lightBluishColor),
          True: Use FloatingActionButtonTheme

NOTE3:
      --> accent color is deprecated
      --> So use colorSheem

NOTE4:
      --> "Catalog App".text.xl5.bold.color(MyThemes.darkBluishColor).make(),
      --> Instead of MyThemes.darkBluishColor I am using context.accentColor in catalog_header.dart
      --> What is the purpose of brightness: Brightness.dark ?
      --> Ans:- Bright the dark text on the screen.

NOTE5:
      --> brightness: Brightness.dark, and colorScheem both cannot be used at the same time
      --> colorScheem also provides the brightness
      --> brightness.dark only make the 'Trending Products' white, while the rest of the data insode the VxBox -> row -> column becomes ugly
      --> Inside catalog_list.dart inside CatalogItem class where outside the VxBox I change .white -> .color(context.cardColor)

NOTE6:
      --> foregroundColor: Colors.white, Not works because of some problem 

NOTE7:
      --> toolbarTextStyle:const TextStyle(color: Colors.white), Not work here beacause of some problem

NOTE8: 
      --> The textTheme is a part of the overall theme, containing predefined text styles like headline, 
          subtitle, bodyText, and in this case, titleLarge.
      --> The copyWith method allows you to create a copy of the current textTheme with specific changes. 
          In this case, it's creating a copy of the textTheme while modifying the titleLarge style.

NOTE9:
      --> .copyWith(titleLarge: const TextStyle(color: Colors.white)).titleLarge
      --> As textTheme has a property of .titleLarge, so also use titleLarge inside the .copywright to oveeride that title
 */