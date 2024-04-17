import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app/welcome_page_widget.dart';
import 'package:project_app/Services/auth.dart';
import 'Styles.dart';
import 'constants.dart';

class LoginPageWidget extends WelcomePageWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late final TextEditingController _email;
  late final TextEditingController _password;
  String ERROR = "";
  bool passwordVisibility = false;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.lightBlueAccent,
    backgroundColor: Colors.white,
    minimumSize: Size(200, 45),
    padding: EdgeInsets.symmetric(horizontal: 24),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
  );

  Future<void> signIn() async {
    try {
      await Auth().signInWithEmailAndPassword(email: _email.text, password: _password.text);
    } on FirebaseException catch (error) {
      if (error.code == "user-not-found") {
        ERROR = "User not found";
      } else if (error.code == "invalid-password" || error.code == "invalid-email") {
        ERROR = "Invalid Password or Email";
      }
    }
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Casella di testo per l'email
                        Padding(
                          padding: EdgeInsets.fromLTRB(200, 0, 200, 10),
                          child: TextField(
                            controller: _email,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        // Casella di testo per la password
                        Padding(
                          padding: EdgeInsets.fromLTRB(200, 0, 200, 10),
                          child: TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        // Bottone "Accedi"
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: signIn,
                            child: Text('Accedi'
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}