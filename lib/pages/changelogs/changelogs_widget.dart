import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'changelogs_model.dart';
export 'changelogs_model.dart';

class ChangelogsWidget extends StatefulWidget {
  const ChangelogsWidget({Key? key}) : super(key: key);

  @override
  _ChangelogsWidgetState createState() => _ChangelogsWidgetState();
}

class _ChangelogsWidgetState extends State<ChangelogsWidget> {
  late ChangelogsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChangelogsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.pushNamed('Home');
          },
          backgroundColor: Color(0xFF6AE937),
          elevation: 8.0,
          child: Icon(
            Icons.home,
            color: Colors.black,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, -1.00),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Container(
                            width: double.infinity,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Text(
                                'Changelogs',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Oswald',
                                      fontSize: 30.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SwitchListTile.adaptive(
                                value: _model.switchListTileValue1 ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue1 = newValue!);
                                },
                                title: Text(
                                  'V 1.0',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Oswald',
                                        fontSize: 20.0,
                                      ),
                                ),
                                subtitle: Text(
                                  'click to see Version 1.0 Changelogs',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                tileColor: FlutterFlowTheme.of(context).primary,
                                activeColor:
                                    FlutterFlowTheme.of(context).secondary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).info,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              if (valueOrDefault<bool>(
                                _model.switchListTileValue1,
                                false,
                              ))
                                FlutterFlowWebView(
                                  content:
                                      '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Version 1.0 Changelog</title>\n    <style>\n        *{\n            background-color:black;\n            color: white;\n        }\n    </style>\n</head>\n<body>\n=========================================================== <br>\nCodeEx Version 1.0 - 21/Oct/2023 -By: Shivam Ingale <br>\n=========================================================== <br>\n* initial version <br>\n* made everything work <br>\n* <a href=\"https://github.com/Shivamingale3/CodeEx.git\">Github</a> <br>\n=========================================================== <br>\n</body>\n</html>',
                                  height: 200.0,
                                  verticalScroll: false,
                                  horizontalScroll: false,
                                  html: true,
                                ),
                              SwitchListTile.adaptive(
                                value: _model.switchListTileValue2 ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchListTileValue2 = newValue!);
                                },
                                title: Text(
                                  'V 2.0',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Oswald',
                                        fontSize: 20.0,
                                      ),
                                ),
                                subtitle: Text(
                                  'Clike to see Version 2.0 Changelogs',
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                tileColor: FlutterFlowTheme.of(context).primary,
                                activeColor:
                                    FlutterFlowTheme.of(context).secondary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).info,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                              if (_model.switchListTileValue2 ?? true)
                                FlutterFlowWebView(
                                  content:
                                      '<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Version 1.0 Changelog</title>\n    <style>\n        *{\n            background-color:black;\n            color: white;\n        }\n    </style>\n</head>\n<body>\n=========================================================== <br>\nCodeEx Version 2.0 - 31/Oct/2023 -By: Shivam Ingale <br>\n=========================================================== <br>\n* changed icon and splash screen <br>\n* fixed layout <br>\n* no overlapping <br>\n* no interfearence with the notch <br>\n* made everything look a bit spacious <br>\n* added seperate compiler for C <br>\n* added seperate compiler for C++ <br>\n* added seperate compiler for Java <br>\n* added seperate compiler for Python <br>\n* changed profile panel <br>\n* added changelogs button in about app section <br>\n* <a href=\"https://github.com/Shivamingale3/CodeEx.git\">Github</a> <br>\n=========================================================== <br>\n</body>\n</html>',
                                  height: 400.0,
                                  verticalScroll: false,
                                  horizontalScroll: false,
                                  html: true,
                                ),
                            ],
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
      ),
    );
  }
}
