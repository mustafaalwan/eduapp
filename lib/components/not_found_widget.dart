import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NotFoundWidget extends StatefulWidget {
  const NotFoundWidget({
    Key key,
    this.title,
    this.desc,
  }) : super(key: key);

  final String title;
  final String desc;

  @override
  _NotFoundWidgetState createState() => _NotFoundWidgetState();
}

class _NotFoundWidgetState extends State<NotFoundWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/notfound.webp',
                width: 300,
                height: 150,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 14),
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Tajawal',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 15),
          child: Text(
            widget.desc,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Tajawal',
                  lineHeight: 1.6,
                ),
          ),
        ),
      ],
    );
  }
}
