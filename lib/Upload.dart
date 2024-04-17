
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_app/constants.dart';
import 'package:http/http.dart' as http;
import 'Styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadWidget extends StatefulWidget {
  const UploadWidget({super.key});

  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}



class _UploadWidgetState extends State<UploadWidget> {

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> uploadPdf(String fileName, file) async {
    final reference = FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");

    final uploadTask = reference.putFile(file);

    await uploadTask.whenComplete(() => {});

    final downloadLink = await reference.getDownloadURL();

    return downloadLink;
  }

  void pickFile() async {

    final pickedFile = await FilePicker.platform.pickFiles(
      type : FileType.custom,
      allowedExtensions: ["pdf"]
    );


    if ( pickedFile != null){
      String fileName = pickedFile.files[0].name;

      File file = File(pickedFile.files[0].path!);

      final downloadLink = await uploadPdf(fileName, file);

      _firebaseFirestore.collection("pdfs").add({
        'name' : fileName,
        'link' : downloadLink,

      });
    }
  }


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.8,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: primaryBackground,
        appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          title: Text(
            'Carica File',
            style: textStyleMedium.copyWith(
              fontFamily: 'Outfit',
              color: Colors.white,
              fontSize: 22,
              letterSpacing: 0,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: Container(
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: double.infinity,
            maxWidth: double.infinity,
            maxHeight: double.infinity,
          ),
          decoration: BoxDecoration(
            color: secondaryBackground,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, -1),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: ButtonTheme(
                            minWidth: 200,
                            height: 40,
                            padding:
                            EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            //showLoadingIndicator: false,
                            child : TextButton(
                              onPressed: () async {
                                pickFile();
                              },
                              child: Text(
                                  'Scegli File',
                                  style : titleSmall
                                  .copyWith(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                  color: primaryColor
                              )
                              ),
                              style : ButtonStyle(
                                //elevation: 3.0,
                                shape : MaterialStateProperty.all(RoundedRectangleBorder(
                                side : BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                                ),
                          ),
                          ),
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(16, 10, 16, 0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              //controller: _model.nomeFileController,
                              //focusNode: _model.nomeFileFocusNode,
                              autofillHints: [AutofillHints.email],
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Nome del PDF',
                                labelStyle: labelMedium
                                    .copyWith(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                                hintText: 'Inserisci nome file...',
                                hintStyle: labelMedium
                                    .copyWith(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: tertiaryColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: primaryColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: colorErrors,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: colorErrors,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                filled: true,
                                fillColor: secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 20, 24),
                              ),
                              style: textStyleMedium
                                  .copyWith(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                              ),
                              maxLines: null,
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: primaryColor,
                              //validator: _model.nomeFileControllerValidator.asValidator(context),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                            child: ButtonTheme(
                              minWidth: 200,
                              height: 40,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24, 0, 24, 0),
                              child : TextButton(
                                style: ButtonStyle(
                                  shape : MaterialStateProperty.all(RoundedRectangleBorder(
                                    side : BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                ),
                                ),
                                ),
                              onPressed: () async {
                                Navigator.of(context).pushNamedAndRemoveUntil(home, (route) => false);
                              },
                                child: Text(
                                    'Home',
                                  style : titleSmall
                                      .copyWith(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0,
                                  ),

                                ),
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
    );
  }
}
