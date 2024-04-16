import 'package:flutter/material.dart';

import 'constants.dart';


class WelcomePageWidget extends StatefulWidget {
  const WelcomePageWidget({super.key});

  @override
  State<WelcomePageWidget> createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget>
    with TickerProviderStateMixin {
  //late WelcomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  //Il codie sottostante  crea lo stile dei bottoni, colore, grandezza e forma
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.lightBlueAccent, backgroundColor: Colors.white,
    minimumSize: Size(200, 45),
    padding: EdgeInsets.symmetric(horizontal: 24),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(100)),
    ),
  );
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
         key: scaffoldKey,
         backgroundColor: Colors.white,

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome_background.png'),
              fit: BoxFit.cover,
            ),
          ),

          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //Inserimento Logo
                        Align(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Image.asset(
                              'assets/images/logo_blu.png',
                              width: 300,
                              height: 150,
                              fit: BoxFit.cover,
                              alignment: Alignment(0, 0),
                            ),
                           ),
                        ),

                      ],
                    ),
                  ),

                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [

                                    //Bottone 1: Registrati
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: ElevatedButton(
                                        style: raisedButtonStyle,
                                        onPressed: () async {
                                          Navigator.of(context).pushNamedAndRemoveUntil(registration, (route) => false); //funzione transizione
                                        },
                                        child: Text('Registrati'),
                                      ),
                                    ),

                                    //Bottone 2: Accedi
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: ElevatedButton(
                                        style: raisedButtonStyle,
                                        onPressed: () async {
                                         Navigator.of(context).pushNamedAndRemoveUntil(login, (route) => false);  //funzione transizione
                                        },
                                        child: Text('Accedi'),
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
            ],
          ),
        ),
      ),
    );
  }
}
