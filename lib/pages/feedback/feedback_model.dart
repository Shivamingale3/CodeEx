import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'feedback_widget.dart' show FeedbackWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedbackModel extends FlutterFlowModel<FeedbackWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for feedb widget.
  FocusNode? feedbFocusNode;
  TextEditingController? feedbController;
  String? Function(BuildContext, String?)? feedbControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    feedbFocusNode?.dispose();
    feedbController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
