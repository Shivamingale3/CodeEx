import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pythonterminal_model.dart';
export 'pythonterminal_model.dart';

class PythonterminalWidget extends StatefulWidget {
  const PythonterminalWidget({Key? key}) : super(key: key);

  @override
  _PythonterminalWidgetState createState() => _PythonterminalWidgetState();
}

class _PythonterminalWidgetState extends State<PythonterminalWidget> {
  late PythonterminalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PythonterminalModel());
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
          backgroundColor: FlutterFlowTheme.of(context).success,
          elevation: 8.0,
          child: Icon(
            Icons.home_rounded,
            color: FlutterFlowTheme.of(context).primary,
            size: 24.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: FlutterFlowWebView(
              content: 'https://www.jdoodle.com/python3-programming-online',
              bypass: false,
              height: 2400.0,
              verticalScroll: true,
              horizontalScroll: true,
            ),
          ),
        ),
      ),
    );
  }
}
