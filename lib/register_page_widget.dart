/*
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
*/
//import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Services/auth.dart';
import 'Styles.dart';
import 'constants.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';
/*
import 'create_account_model.dart';
export 'create_account_model.dart';
*/
class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({super.key});

  @override
  State<CreateAccountWidget> createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  //late CreateAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TextEditingController _nomeController;
  late TextEditingController _email;
  late TextEditingController _password;
  var passwordVisibility = false;
  var passwordConfirmVisibility = false;
  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    //_model.dispose();

    super.dispose();
  }

  Future<void> signUp () async {
    try {
      await Auth().createUserWithEmailAndPassword(email: _email.text, password: _password.text);
    } on FirebaseException catch (error){

    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /*
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
       */
      child: Scaffold(
        key: scaffoldKey,
        //backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/CA_Background.png',
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 320, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Text(
                                      'Crea account',
                                      textAlign: TextAlign.start,
                                      style :
                                          TextStyle(
                                        fontFamily: 'MONT',
                                        fontSize: 45,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w600,
                                      )
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
                                        controller: _nomeController,
                                        //focusNode: _model.nomeFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.name],
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Nome',
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
                                          fillColor: primaryBackground,
                                        ),
                                        style: textStyleSmall.copyWith(
                                          fontFamily: 'MONT',
                                          letterSpacing: 0,
                                        ),
                                        keyboardType:
                                        TextInputType.text,
                                        /*
                                        BACKEND
                                        validator: _model
                                            .nomeControllerValidator
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
                                        controller: _password,
                                        //focusNode: _model.passwordFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.password],
                                        obscureText: passwordVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Password',
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
                                              color:colorErrors,
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
                                          fillColor: primaryBackground,
                                          suffixIcon: InkWell(
                                            onTap: () => setState(
                                              () => passwordVisibility =
                                              !passwordVisibility,
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
                                        style: textStyleSmall.copyWith(
                                          fontFamily: 'MONT',
                                          letterSpacing: 0,
                                        ),
                                        /*
                                        validator: _model
                                            .passwordControllerValidator
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
                                        //controller: _model.passwordConfirmController,
                                        //focusNode: _model.passwordConfirmFocusNode,
                                        autofocus: true,
                                        autofillHints: [AutofillHints.password],
                                        //obscureText: !_model.passwordConfirmVisibility,
                                        decoration: InputDecoration(
                                          labelText: 'Confirm Password',
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
                                                  () => passwordConfirmVisibility = !passwordConfirmVisibility,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      55, 0, 55, 16),

                                  child: ButtonTheme(
                                      minWidth: 200,
                                      height: 45,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      child : OutlinedButton(
                                          style : OutlinedButton.styleFrom(
                                            backgroundColor: secondaryBackground,
                                            side: BorderSide(
                                            color: tertiaryColor,
                                            width: 0,
                                          )
                                          ),
                                    onPressed: () async {

                                      /*
                                      GoRouter.of(context).prepareAuthEvent();
                                      if (_model.passwordController.text !=
                                          _model
                                              .passwordConfirmController.text) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Passwords don\'t match!',
                                            ),
                                          ),
                                        );
                                        return;
                                      }

                                      final user = await authManager
                                          .createAccountWithEmail(
                                        context,
                                        _model.emailAddressController.text,
                                        _model.passwordController.text,
                                      );
                                      if (user == null) {
                                        return;
                                      }

                                      context.pushNamedAuth(
                                          'LoginPage', context.mounted);
                                            */
                                    },
                                    child : Text(
                                        'Crea Account',
                                      style : textStyleSmall.copyWith(
                                        color: primaryColor,
                                          fontFamily: 'MONT',
                                          letterSpacing: 0,
                                        ),
                                      )
                                    ),
                                  ),
                                ),
                                // You will have to add an action on this rich text to go to your login page.
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 12),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        Navigator.of(context).pushNamedAndRemoveUntil(login, (route) => false);
                                        /*
                                        context.pushNamed(
                                          'LoginPage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                              PageTransitionType.scale,
                                              alignment: Alignment.bottomCenter,
                                              duration:
                                              Duration(milliseconds: 400),
                                            ),
                                          },
                                        );
                                         */
                                        return null;
                                      },
                                      child: RichText(
                                        textScaler:
                                        MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Hai già un Account? ',
                                              style: textStyleSmallinoMaNONTroppo.copyWith(
                                                fontFamily: 'MONT',
                                                color: Color(0xFF022B3A),
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'Accedi qui!',

                                              style: textStyleSmallinoMaNONTroppo.copyWith(
                                                fontFamily: 'Readex Pro',
                                                color: tertiaryColor,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          ],
                                          style: textStyleLarge.copyWith(
                                            fontFamily: 'MONT',
                                            letterSpacing: 0,
                                          ),
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
