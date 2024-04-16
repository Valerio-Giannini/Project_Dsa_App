
import 'package:flutter/material.dart';
import 'package:project_app/Services/auth.dart';
import 'package:project_app/register_page_widget.dart';
import 'constants.dart';
import 'login_page_widget.dart';
import 'welcome_page_widget.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      //MaterialApp(home: WelcomePageWidget()),
      MaterialApp(
        title : TITLE,
          theme : ThemeData(
          primarySwatch: Colors.lightBlue,
          primaryColor: Colors.blue,
      ),
          home: WelcomePageWidget(),

        routes : {
            login : (context) => const LoginPageWidget(),
            registration : (context) => const CreateAccountWidget(),
      },
      ),
  );
}
