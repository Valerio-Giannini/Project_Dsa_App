import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_app/Styles.dart';
import 'package:provider/provider.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  //late ForgotPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    /*
    super.initState();
    _model = createModel(context, () => ForgotPasswordModel());

    _model.emailAddressController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
     */
  }

  @override
  void dispose() {
    //_model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: primaryBackground,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/ForgotPassword_Background.png',
            ).image,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Opacity(
                opacity: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, -1),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        constraints: BoxConstraints(
                          minWidth: 570,
                          minHeight: 300,
                          maxWidth: double.infinity,
                        ),
                        decoration: BoxDecoration(),
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(35, 0, 35, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                                child: Text(
                                  'Password dimenticata?',
                                  textAlign: TextAlign.center,
                                  style: titleSmall.copyWith(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 10, 16, 10),
                                child: Text(
                                  'Ti invieremo nella tua casella di posta un link per resettare la tua password. Ti preghiamo di inserire la tua email associata al tuo account nel riquadro qua sotto.',
                                  textAlign: TextAlign.center,
                                  style: textStyleMedium.copyWith(
                                    fontFamily: 'MONT',
                                    letterSpacing: 0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 20, 16, 0),
                                child: Container(
                                  width: double.infinity,
                                  child: TextFormField(
                                    autofillHints: [AutofillHints.email],
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Il tuo indirizzo email...',
                                      labelStyle: labelSmall
                                          .copyWith(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0,
                                      ),
                                      hintText: 'Inserisci la tua email qui...',
                                      hintStyle: labelSmall.copyWith(
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
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: colorErrors,
                                          width: 2,
                                        ),
                                        borderRadius:
                                        BorderRadius.circular(100),
                                      ),
                                      filled: true,
                                      fillColor: secondaryBackground,
                                      contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 20, 24),
                                    ),
                                    style: textStyleMedium.copyWith(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0,
                                    ),
                                    maxLines: null,
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: primaryColor,
                                   // validator: _model.emailAddressControllerValidator.asValidator(context),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 24, 0, 0),

                                  child: ButtonTheme(
                                    minWidth: 200,
                                    height: 45,
                                  child : TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0))),
                                      backgroundColor: MaterialStateProperty.resolveWith((states) => tertiaryBackground)
                                    ),
                                    onPressed: () async {
                                      /*
                                      if (_model.emailAddressController.text
                                          .isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Email required!',
                                            ),
                                          ),
                                        );
                                        return;
                                      }
                                      await authManager.resetPassword(
                                        email:
                                        _model.emailAddressController.text,
                                        context: context,
                                      );

                                      context.pushNamed('LoginPage');
                                       */
                                    },

                                    child : Text(
                                      'Invia il Link',
                                      style : textStyleMedium.copyWith(
                                        color: tertiaryColor,
                                          fontFamily: 'Readex Pro',
                                          letterSpacing: 0,
                                        ),
                                    ),
                                    ),
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                  ),
                                  ),
                                ),
                            ],
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
    );
  }
}
