import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../payment_done/payment_done_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplyCodeWidget extends StatefulWidget {
  const ApplyCodeWidget({
    Key key,
    this.jsonfile,
  }) : super(key: key);

  final dynamic jsonfile;

  @override
  _ApplyCodeWidgetState createState() => _ApplyCodeWidgetState();
}

class _ApplyCodeWidgetState extends State<ApplyCodeWidget>
    with TickerProviderStateMixin {
  ApiCallResponse apicall;
  TextEditingController textController;
  bool checkboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'buttonOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      duration: 560,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
    setupTriggerAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );

    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final applyCodeUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primaryColor,
                          FlutterFlowTheme.of(context).alternate
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0.03, -1),
                        end: AlignmentDirectional(-0.03, 1),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Color(0x00EEEEEE),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(
                                            Icons.arrow_back_sharp,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-0.1, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'شراء الكورس الدراسي',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Tajawal',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 16,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 5, 0),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ).animated(
                                [animationsMap['rowOnPageLoadAnimation']]),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1F2F6),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 20, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 10, 15, 0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 5,
                                                    color: Color(0x44111417),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(4, 4, 4, 4),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 4, 8, 4),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        2,
                                                                        0,
                                                                        0),
                                                            child: Icon(
                                                              Icons
                                                                  .credit_card_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Theme(
                                                                data: ThemeData(
                                                                  checkboxTheme:
                                                                      CheckboxThemeData(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25),
                                                                    ),
                                                                  ),
                                                                  unselectedWidgetColor:
                                                                      Color(
                                                                          0xFF95A1AC),
                                                                ),
                                                                child:
                                                                    CheckboxListTile(
                                                                  value:
                                                                      checkboxListTileValue ??=
                                                                          true,
                                                                  onChanged: (newValue) =>
                                                                      setState(() =>
                                                                          checkboxListTileValue =
                                                                              newValue),
                                                                  title: Text(
                                                                    'الرمز السري',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                  tileColor: Color(
                                                                      0xFFF5F5F5),
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                  dense: true,
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .trailing,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (checkboxListTileValue ??
                                                        true)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    15, 12, 20),
                                                        child: TextFormField(
                                                          controller:
                                                              textController,
                                                          onChanged: (_) =>
                                                              EasyDebounce
                                                                  .debounce(
                                                            'textController',
                                                            Duration(
                                                                milliseconds:
                                                                    20),
                                                            () =>
                                                                setState(() {}),
                                                          ),
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'أدخل الرمز السري للبطاقة...',
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                                width: 2,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14, 16, 14, 16),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        apicall =
                                                            await PromoCodeCall
                                                                .call(
                                                          pagenumber: '1',
                                                          search: textController
                                                              .text,
                                                        );
                                                        _shouldSetState = true;
                                                        if ((getJsonField(
                                                              (apicall?.jsonBody ??
                                                                  ''),
                                                              r'''$..slug''',
                                                            ) !=
                                                            null)) {
                                                          if (functions
                                                              .promocodeif(
                                                                  getJsonField(
                                                            (apicall?.jsonBody ??
                                                                ''),
                                                            r'''$..categories..[0]''',
                                                          ))) {
                                                            await PromoCodeUpdateCall
                                                                .call(
                                                              categoriesid:
                                                                  '21',
                                                              pagenumber:
                                                                  getJsonField(
                                                                (apicall?.jsonBody ??
                                                                    ''),
                                                                r'''$..id''',
                                                              ).toString(),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'تم شراء الكورس بنجاح',
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
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                              ),
                                                            );
                                                          } else {
                                                            await DelatePromoCodeCall
                                                                .call(
                                                              pagenumber:
                                                                  getJsonField(
                                                                (apicall?.jsonBody ??
                                                                    ''),
                                                                r'''$..id''',
                                                              ).toString(),
                                                            );
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'تم شراء الكورس بنجاح',
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
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                              ),
                                                            );
                                                          }

                                                          final courseCreateData =
                                                              createCourseRecordData(
                                                            courseTitle:
                                                                getJsonField(
                                                              widget.jsonfile,
                                                              r'''$..acf..course_title''',
                                                            ).toString(),
                                                            courseImg:
                                                                getJsonField(
                                                              widget.jsonfile,
                                                              r'''$..acf..img''',
                                                            ),
                                                            courseID:
                                                                getJsonField(
                                                              widget.jsonfile,
                                                              r'''$..id''',
                                                            ).toString(),
                                                            userID: functions
                                                                .userIDGEN(),
                                                            courseDate:
                                                                getCurrentTimestamp,
                                                            enddate:
                                                                getJsonField(
                                                              widget.jsonfile,
                                                              r'''$..enddate''',
                                                            ).toString(),
                                                          );
                                                          await CourseRecord
                                                              .collection
                                                              .doc()
                                                              .set(
                                                                  courseCreateData);
                                                          await Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  PaymentDoneWidget(),
                                                            ),
                                                          );
                                                        } else {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'الكود الذي ادخلتة غير صالح',
                                                                style:
                                                                    GoogleFonts
                                                                        .getFont(
                                                                  'Tajawal',
                                                                  fontSize: 14,
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              action:
                                                                  SnackBarAction(
                                                                label:
                                                                    'تواصل معنا',
                                                                textColor: Color(
                                                                    0x00000000),
                                                                onPressed:
                                                                    () async {
                                                                  await launchURL(
                                                                      '');
                                                                },
                                                              ),
                                                            ),
                                                          );
                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                      },
                                                      text:
                                                          'شراء الكورس الدراسي',
                                                      icon: Icon(
                                                        Icons.lock_outline,
                                                        size: 18,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 300,
                                                        height: 55,
                                                        color:
                                                            Color(0xF220A216),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Tajawal',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        elevation: 0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 0,
                                                        ),
                                                        borderRadius: 10,
                                                      ),
                                                    ).animated([
                                                      animationsMap[
                                                          'buttonOnActionTriggerAnimation']
                                                    ]),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
