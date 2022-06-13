import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CouseVideoWidget extends StatefulWidget {
  const CouseVideoWidget({
    Key key,
    this.title,
    this.videoURL,
    this.userID,
    this.description,
  }) : super(key: key);

  final String title;
  final String videoURL;
  final String userID;
  final dynamic description;

  @override
  _CouseVideoWidgetState createState() => _CouseVideoWidgetState();
}

class _CouseVideoWidgetState extends State<CouseVideoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F2F6),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/bg.webp',
                  width: double.infinity,
                  height: 130,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0x0014181B), Color(0x6D101213)],
                        stops: [0, 0.9],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).black600,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 52, 16, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 8,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  fillColor: Color(0x9A202529),
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Text(
                                    widget.title,
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Tajawal',
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: FlutterFlowVideoPlayer(
                    path: widget.videoURL,
                    videoType: VideoType.network,
                    width: MediaQuery.of(context).size.width,
                    autoPlay: true,
                    looping: false,
                    showControls: true,
                    allowFullScreen: false,
                    allowPlaybackSpeedMenu: true,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.85, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Text(
                      widget.userID,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Tajawal',
                            color: Color(0x5DFFFFFF),
                            fontSize: 25,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Html(
                        data: getJsonField(
                          widget.description,
                          r'''$..description''',
                        ).toString(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
