import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_app/welcome_page_widget.dart';
import 'package:project_app/Services/auth.dart';

import 'Styles.dart';
import 'constants.dart';

class LoginPageWidget extends WelcomePageWidget{
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

    //Il codie sottostante  crea lo stile dei bottoni, colore, grandezza e forma
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: Colors.lightBlueAccent,
      backgroundColor: Colors.white,
      minimumSize: Size(200, 45),
      padding: EdgeInsets.symmetric(horizontal: 24),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
    );

    Future<void> signIn () async {
      try {
        await Auth().signInWithEmailAndPassword(email: _email.text, password: _password.text);
      } on FirebaseException catch (error){
          if (error.code  == "user-not-found"){
              ERROR = "User not found";
          } else if (error.code == "invalid-password" || error.code == "invalid-email"){
            ERROR = "Invalid Password or Email";
          }
      }
    }

    @override
    void initState(){
      _email = TextEditingController();
      _password= TextEditingController();
      super.initState();
    }

    @override
    Widget build(BuildContext context) {
      return GestureDetector(

        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,

          body: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),

                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/welcome_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 450, 0, 0),

                  child: Container(
                    width: 400,
                    height: double.infinity,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(32, 30, 32, 0),

                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,

                            children: [
                              Opacity(
                                opacity: 0.7,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: SizedBox(
                                    width: labelSizeWidth,
                                    height : labelSizeHeight,
                                    child: TextFormField(
                                      controller: _email,
                                      //focusNode: _model.emailAddressFocusNode,
                                      autofocus: true,
                                      autofillHints: [AutofillHints.email],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                          labelText: 'Email',
                                          labelStyle: labelMedium.copyWith(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryBackground,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(100),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: primaryColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(100),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: colorErrors,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(100),
                                          ),
                                          focusedErrorBorder:
                                          OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: colorErrors,
                                              width: 2,
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(100),
                                          ),
                                          filled: true,
                                          fillColor: primaryBackground
                                      ),
                                      style: textStyleSmall.copyWith(
                                        fontFamily: 'MONT',
                                        letterSpacing: 0,
                                      ),
                                      keyboardType:
                                      TextInputType.emailAddress,
                                      /*
                                        BACKEND
                                        validator: _model
                                            .emailAddressControllerValidator
                                            .asValidator(context),
                                         */
                                    ),
                                  ),
                                ),
                              ),

                              Opacity(
                                opacity: 0.7,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: SizedBox(
                                    width: labelSizeWidth,
                                    height : labelSizeHeight,
                                    child: TextFormField(
                                      autofocus: true,
                                      autofillHints: [AutofillHints.password],
                                      //obscureText: !_model.passwordConfirmVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: labelMedium.copyWith(
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primaryBackground,
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(100),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: primaryColor,
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(100),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: colorErrors,
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(100),
                                        ),
                                        focusedErrorBorder:
                                        OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: colorErrors,
                                            width: 0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(100),
                                        ),
                                        filled: true,
                                        fillColor: primaryBackground,
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                                () => passwordVisibility = !passwordVisibility,
                                          ),
                                          focusNode:
                                          FocusNode(skipTraversal: true),
                                          child: Icon(
                                            Icons.visibility_outlined, // da trasformare in dinamico
                                            color: secondaryTextColor,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                      style: textStyleSmall
                                          .copyWith(
                                        fontFamily: 'MONT',
                                        letterSpacing: 0,
                                      ),
                                      minLines: 1,
                                      //validator: _model.passwordConfirmControllerValidator.asValidator(context),
                                    ),
                                  ),
                                ),
                              ),

                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: ElevatedButton(
                                  style: raisedButtonStyle,
                                  onPressed: () async {
                                    signIn();
                                  },
                                  child: Text('Accedi'),
                                ),
                              ),

                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Container(
                                      width: 325,
                                      height: 36,
                                      decoration: BoxDecoration(),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          //Qui inserire la checkbox Ricordami e il link password dimenticata
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: TextButton(onPressed:  () async {
                                    Navigator.of(context).pushNamedAndRemoveUntil(registration, (route) => false); //funzione transizione
                                  },
                                      child: Text('Non hai un Account? Registrati qui!'),
                                  ),
                              ),


                              Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                              child: Text (
                                ERROR,
                                style: labelMedium.copyWith(
                                  color: Colors.red,
                                )
                                ,)
                              )
                            ]
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),


      );
    }
  }
