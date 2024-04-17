import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app/welcome_page_widget.dart';
import 'package:project_app/Services/auth.dart';
import 'Styles.dart';
import 'constants.dart';

class CreateAccountWidget extends WelcomePageWidget {
  const CreateAccountWidget({super.key});

  @override
  State<CreateAccountWidget> createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late final TextEditingController _name;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;
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

  Future<void> signUp() async {
    if (_password.text == _confirmPassword.text) {
      try {
        await Auth().createUserWithEmailAndPassword(
          //name: _name.text,
          email: _email.text,
          password: _password.text,
        );
      } on FirebaseException catch (error) {
        if (error.code == "weak-password") {
          ERROR = "Password troppo debole";
        } else if (error.code == "email-already-in-use") {
          ERROR = "Email già in uso";
        }
      }
    } else {
      ERROR = "Le password non corrispondono";
    }
  }

  @override
  void initState() {
    //_name = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
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
              image: AssetImage('assets/images/CA_Background.png'),
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
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            //controller: _name,
                            decoration: InputDecoration(
                              labelText: 'Nome',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
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
                        Padding(
                          padding: EdgeInsets.all(10),
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
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: _confirmPassword,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Conferma Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ElevatedButton(
                            style: raisedButtonStyle,
                            onPressed: signUp,
                            child: Text('Registrati'),
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