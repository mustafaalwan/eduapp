import '../backend/api_requests/api_calls.dart';
import '../couse_video/couse_video_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CouseDetailsWidget extends StatefulWidget {
  const CouseDetailsWidget({
    Key key,
    this.id,
    this.userid,
    this.cusredate,
    this.enddate,
  }) : super(key: key);

  final String id;
  final String userid;
  final DateTime cusredate;
  final String enddate;

  @override
  _CouseDetailsWidgetState createState() => _CouseDetailsWidgetState();
}

class _CouseDetailsWidgetState extends State<CouseDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: GetCourseDetailsCall.call(
        id: widget.id,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitSquareCircle(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final couseDetailsGetCourseDetailsResponse = snapshot.data;
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
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0x0014181B), Color(0xFFF1F2F6)],
                            stops: [0, 0.9],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                          border: Border.all(
                            color: Color(0xFFF1F2F6),
                          ),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 52, 16, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Text(
                                      getJsonField(
                                        (couseDetailsGetCourseDetailsResponse
                                                ?.jsonBody ??
                                            ''),
                                        r'''$..acf..course_title''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Tajawal',
                                            color: Colors.white,
                                          ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 8,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: Color(0x9A202529),
                                      icon: Icon(
                                        Icons.ios_share,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
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
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          labelColor: FlutterFlowTheme.of(context).primaryText,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelPadding:
                              EdgeInsetsDirectional.fromSTEB(32, 0, 32, 0),
                          labelStyle: FlutterFlowTheme.of(context).subtitle1,
                          indicatorColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          tabs: [
                            Tab(
                              text: 'الدروس',
                            ),
                            Tab(
                              text: 'لمحة عامة',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (functions.showdate(
                                          widget.enddate, widget.cusredate) ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 30),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 20, 0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final listofcorse =
                                                        getJsonField(
                                                              (couseDetailsGetCourseDetailsResponse
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$..videos''',
                                                            )?.toList() ??
                                                            [];
                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          listofcorse.length,
                                                      itemBuilder: (context,
                                                          listofcorseIndex) {
                                                        final listofcorseItem =
                                                            listofcorse[
                                                                listofcorseIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 10),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              if (getJsonField(
                                                                listofcorseItem,
                                                                r'''$..video_vis''',
                                                              )) {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .bottomToTop,
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            300),
                                                                    reverseDuration:
                                                                        Duration(
                                                                            milliseconds:
                                                                                300),
                                                                    child:
                                                                        CouseVideoWidget(
                                                                      title:
                                                                          getJsonField(
                                                                        listofcorseItem,
                                                                        r'''$..video_title''',
                                                                      ).toString(),
                                                                      videoURL:
                                                                          getJsonField(
                                                                        listofcorseItem,
                                                                        r'''$..video_url''',
                                                                      ),
                                                                      userID: widget
                                                                          .userid,
                                                                      description:
                                                                          listofcorseItem,
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'هذة المحاظرة غير متوفرة في الوقت الحالي',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Tajawal',
                                                                        fontSize:
                                                                            14,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                  ),
                                                                );
                                                                return;
                                                              }
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              height: 80,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        2,
                                                                    color: Color(
                                                                        0x2F7F7F7F),
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            1),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                border:
                                                                    Border.all(
                                                                  color: Color(
                                                                      0x00D7D7D7),
                                                                  width: 2,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            13,
                                                                            12,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 4, 0, 0),
                                                                              child: Text(
                                                                                'المحاظرة ${formatNumber(
                                                                                  listofcorseIndex,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                )}',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Tajawal',
                                                                                      color: Color(0xFF353535),
                                                                                      fontSize: 13,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 4, 0, 0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  listofcorseItem,
                                                                                  r'''$..video_title''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Tajawal',
                                                                                      color: Color(0xFF353535),
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.w600,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        if (!(getJsonField(
                                                                              listofcorseItem,
                                                                              r'''$..video_vis''',
                                                                            )) ??
                                                                            true)
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                    ),
                                                                                    child: Icon(
                                                                                      Icons.access_time,
                                                                                      color: Colors.white,
                                                                                      size: 24,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (getJsonField(
                                                                              listofcorseItem,
                                                                              r'''$..video_vis''',
                                                                            ) ??
                                                                            true)
                                                                          Expanded(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 50,
                                                                                    height: 50,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                    ),
                                                                                    child: Icon(
                                                                                      Icons.play_circle_fill_rounded,
                                                                                      color: Colors.white,
                                                                                      size: 24,
                                                                                    ),
                                                                                  ),
                                                                                ],
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
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  if (!(functions.showdate(
                                          widget.enddate, widget.cusredate)) ??
                                      true)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 30, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 20, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE53935),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 2,
                                                      color: Color(0x1EDEDB3C),
                                                      offset: Offset(1, 1),
                                                      spreadRadius: 1,
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(14, 16, 14, 16),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Image.asset(
                                                        'assets/images/eorrr.png',
                                                        width: 20,
                                                        height: 20,
                                                        fit: BoxFit.cover,
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'أنتهت صلاحية الكورس الدراسي يرجى أعادة شراء هذا الكورس، اذا كانت لديك أي استفسارات يرجى التواصل مع الدعم التقني عبر صفحة حسابي',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Tajawal',
                                                                  color: Colors
                                                                      .white,
                                                                  lineHeight:
                                                                      1.6,
                                                                ),
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
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 30, 0, 0),
                                      child: Text(
                                        'معلومات عن الكورس الدراسي',
                                        style:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 12, 16, 0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x2B202529),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 12, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(3, 20,
                                                                    0, 8),
                                                        child: Text(
                                                          getJsonField(
                                                            (couseDetailsGetCourseDetailsResponse
                                                                    ?.jsonBody ??
                                                                ''),
                                                            r'''$..acf..description2''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle2,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 16, 0, 16),
                                      child: Text(
                                        'معلومات عن المدرس',
                                        style:
                                            FlutterFlowTheme.of(context).title3,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 0, 16, 12),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x411D2429),
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8, 8, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 1, 1, 1),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image.network(
                                                    'https://kawenter.net/wp-content/uploads/2022/05/profile.jpeg',
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 4, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'مدرس المادة',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 8, 0),
                                                        child: AutoSizeText(
                                                          'مهند السوداني',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2,
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
                                  ],
                                ),
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
        );
      },
    );
  }
}
