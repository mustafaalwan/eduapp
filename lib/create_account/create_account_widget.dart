import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({Key key}) : super(key: key);

  @override
  _CreateAccountWidgetState createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget>
    with TickerProviderStateMixin {
  String dropDownValue1;
  TextEditingController fullnameController;
  TextEditingController phoneNumberController;
  String dropDownValue2;
  TextEditingController schoolnameController;
  TextEditingController emailAddressController;
  TextEditingController passwordController;
  bool passwordVisibility;
  TextEditingController password2Controller;
  bool password2Visibility;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 31),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 16),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 16),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 14),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 14),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 14),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 16),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 16),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation6': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 16),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation5': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 14),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'rowOnPageLoadAnimation7': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 12),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
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

    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
    password2Controller = TextEditingController();
    password2Visibility = false;
    fullnameController = TextEditingController();
    phoneNumberController = TextEditingController();
    schoolnameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Stack(
                children: [],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: Image.asset(
                'assets/images/bg_(3).webp',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 200, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F2F6),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25, 40, 25, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Text(
                                              'أنشاء حساب جديد',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Tajawal',
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ).animated([
                                        animationsMap['rowOnPageLoadAnimation1']
                                      ]),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 13, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(27, 0, 20, 0),
                                              child: Text(
                                                'لمعاينة الكورسات الدراسية يرجى أنشاء حساب طالب جديد عبر تقديم المعلومات التالية ادناة',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ).animated([
                                                animationsMap[
                                                    'textOnPageLoadAnimation1']
                                              ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25, 20, 20, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller:
                                                  emailAddressController,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                'emailAddressController',
                                                Duration(milliseconds: 2000),
                                                () => setState(() {}),
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'البريد الألكتروني',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              Color(0xFF2B343A),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                hintText:
                                                    'أدخل بريدك الألكتروني',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              Color(0xFF2B343A),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE2E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE2E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            19, 20, 0, 20),
                                                prefixIcon: Icon(
                                                  Icons.email_outlined,
                                                  color: Color(0xFF7882A7),
                                                ),
                                                suffixIcon:
                                                    emailAddressController
                                                            .text.isNotEmpty
                                                        ? InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () =>
                                                                  emailAddressController
                                                                      ?.clear(),
                                                            ),
                                                            child: Icon(
                                                              Icons.clear,
                                                              color: Color(
                                                                  0xFF7882A7),
                                                              size: 22,
                                                            ),
                                                          )
                                                        : null,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color: Color(0xFF7882A7),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return 'هذا الحقل مطلوب';
                                                }
                                                if (val.length < 5) {
                                                  return 'يرجى كتابة بريدك الألكتروني بطريقة صحيحة';
                                                }

                                                if (!RegExp(
                                                        kTextValidatorEmailRegex)
                                                    .hasMatch(val)) {
                                                  return 'يرجى كتابة بريدك الألكتروني بطريقة صحيحة';
                                                }
                                                return null;
                                              },
                                            ).animated([
                                              animationsMap[
                                                  'textFieldOnPageLoadAnimation1']
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25, 0, 20, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: passwordController,
                                              obscureText: !passwordVisibility,
                                              decoration: InputDecoration(
                                                labelText: 'كلمة المرور',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              Color(0xFF2B343A),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                hintText:
                                                    'أدخل كلمة المرور الخاصة بك',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              Color(0xFF2B343A),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE2E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE2E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            19, 20, 0, 20),
                                                prefixIcon: Icon(
                                                  Icons.lock_open_outlined,
                                                  color: Color(0xFF7882A7),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => passwordVisibility =
                                                        !passwordVisibility,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    passwordVisibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: Color(0xFF7882A7),
                                                    size: 22,
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color: Color(0xFF7882A7),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ).animated([
                                        animationsMap['rowOnPageLoadAnimation2']
                                      ]),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25, 0, 20, 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: password2Controller,
                                              obscureText: !password2Visibility,
                                              decoration: InputDecoration(
                                                labelText: 'تأكيد كلمة المرور',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              Color(0xFF2B343A),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                hintText:
                                                    'أدخل كلمة المرور الخاصة بك',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              Color(0xFF2B343A),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE2E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFDBE2E7),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            19, 20, 0, 20),
                                                prefixIcon: Icon(
                                                  Icons.lock_open_outlined,
                                                  color: Color(0xFF7882A7),
                                                ),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => password2Visibility =
                                                        !password2Visibility,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    password2Visibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: Color(0xFF7882A7),
                                                    size: 22,
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Cairo',
                                                    color: Color(0xFF7882A7),
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ).animated([
                                              animationsMap[
                                                  'textFieldOnPageLoadAnimation2']
                                            ]),
                                          ),
                                        ],
                                      ).animated([
                                        animationsMap['rowOnPageLoadAnimation3']
                                      ]),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25, 0, 20, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        fullnameController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'الأسم الكامل',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Color(
                                                                    0xFF2B343A),
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText:
                                                          'أدخل اسمك الكامل ',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Color(
                                                                    0xFF2B343A),
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFDBE2E7),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFDBE2E7),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(19, 20,
                                                                  0, 20),
                                                      prefixIcon: Icon(
                                                        Icons.person_outline,
                                                        color:
                                                            Color(0xFF7882A7),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              Color(0xFF7882A7),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'الأسم الكامل مطلوب';
                                                      }
                                                      if (val.length < 4) {
                                                        return 'يرجى كتابة اسمك الكامل بطريقة صحيحة';
                                                      }

                                                      return null;
                                                    },
                                                  ).animated([
                                                    animationsMap[
                                                        'textFieldOnPageLoadAnimation3']
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        phoneNumberController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'رقم الهاتف',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Color(
                                                                    0xFF2B343A),
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText:
                                                          'أدخل رقم هاتفك',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Color(
                                                                    0xFF2B343A),
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFDBE2E7),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFDBE2E7),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(19, 20,
                                                                  0, 20),
                                                      prefixIcon: Icon(
                                                        Icons.phone_iphone,
                                                        color:
                                                            Color(0xFF7882A7),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              Color(0xFF7882A7),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'رقم الهاتف مطلوب';
                                                      }
                                                      if (val.length < 9) {
                                                        return 'يرجى كتابة رقم هاتفك بطريقة صحيحة';
                                                      }
                                                      if (val.length > 11) {
                                                        return 'يرجى كتابة رقم هاتفك بطريقة صحيحة';
                                                      }

                                                      return null;
                                                    },
                                                  ).animated([
                                                    animationsMap[
                                                        'textFieldOnPageLoadAnimation4']
                                                  ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: FlutterFlowDropDown(
                                                    options: ['ذكر', 'أنثى'],
                                                    onChanged: (val) =>
                                                        setState(() =>
                                                            dropDownValue1 =
                                                                val),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 50,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black,
                                                        ),
                                                    hintText:
                                                        'يرجى أختيار الجنس',
                                                    fillColor: Colors.white,
                                                    elevation: 0,
                                                    borderColor:
                                                        Color(0xFFDBE2E7),
                                                    borderWidth: 2,
                                                    borderRadius: 8,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                55, 6, 12, 4),
                                                    hidesUnderline: true,
                                                  ),
                                                ),
                                              ],
                                            ).animated([
                                              animationsMap[
                                                  'rowOnPageLoadAnimation4']
                                            ]),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: FlutterFlowDropDown(
                                                    options: [
                                                      'بغداد',
                                                      'البصرة',
                                                      'نينوى',
                                                      'الأنبار',
                                                      'المثنى',
                                                      'النجف',
                                                      'كربلاء',
                                                      'واسط',
                                                      'بابل',
                                                      'ديالى',
                                                      'القادسية',
                                                      'ذي قار',
                                                      'صلاح الدين',
                                                      'كركورك',
                                                      'ميسان',
                                                      'السلمانية',
                                                      'اربيل',
                                                      'دهوك'
                                                    ],
                                                    onChanged: (val) =>
                                                        setState(() =>
                                                            dropDownValue2 =
                                                                val),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 50,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color: Colors.black,
                                                        ),
                                                    hintText:
                                                        'يرجى أختيار المدينة',
                                                    fillColor: Colors.white,
                                                    elevation: 0,
                                                    borderColor:
                                                        Color(0xFFDBE2E7),
                                                    borderWidth: 2,
                                                    borderRadius: 8,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                55, 6, 12, 4),
                                                    hidesUnderline: true,
                                                  ),
                                                ),
                                              ],
                                            ).animated([
                                              animationsMap[
                                                  'rowOnPageLoadAnimation5']
                                            ]),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: TextFormField(
                                                    controller:
                                                        schoolnameController,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText: 'اسم مدرستك',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Color(
                                                                    0xFF2B343A),
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      hintText:
                                                          'أدخل اسم مدرستك',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Cairo',
                                                                color: Color(
                                                                    0xFF2B343A),
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFDBE2E7),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFDBE2E7),
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(19, 20,
                                                                  0, 20),
                                                      prefixIcon: Icon(
                                                        Icons.phone_iphone,
                                                        color:
                                                            Color(0xFF7882A7),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Cairo',
                                                          color:
                                                              Color(0xFF7882A7),
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'يرجى كتابة اسم مدرستك';
                                                      }
                                                      if (val.length < 3) {
                                                        return 'يرجى كتابة اسم مدرستك بطريقة صحيحة';
                                                      }

                                                      return null;
                                                    },
                                                  ).animated([
                                                    animationsMap[
                                                        'textFieldOnPageLoadAnimation5']
                                                  ]),
                                                ),
                                              ],
                                            ).animated([
                                              animationsMap[
                                                  'rowOnPageLoadAnimation6']
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25, 13, 25, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (formKey.currentState ==
                                                        null ||
                                                    !formKey.currentState
                                                        .validate()) {
                                                  return;
                                                }

                                                if (dropDownValue1 == null) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'يرجى أختيار الجنس',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Tajawal',
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  );
                                                  return;
                                                }
                                                if (dropDownValue2 == null) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'يرجى أختيار المدينة',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Tajawal',
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 2000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                  );
                                                  return;
                                                }

                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'جار أنشاء الحساب...',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Tajawal',
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 2000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .customColor1,
                                                  ),
                                                );
                                                if (passwordController?.text !=
                                                    password2Controller?.text) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Passwords don\'t match!',
                                                      ),
                                                    ),
                                                  );
                                                  return;
                                                }

                                                final user =
                                                    await createAccountWithEmail(
                                                  context,
                                                  emailAddressController.text,
                                                  passwordController.text,
                                                );
                                                if (user == null) {
                                                  return;
                                                }

                                                final usersCreateData =
                                                    createUsersRecordData(
                                                  email: emailAddressController
                                                      .text,
                                                  createdTime:
                                                      getCurrentTimestamp,
                                                  displayName:
                                                      fullnameController.text,
                                                  phoneNumber:
                                                      phoneNumberController
                                                          .text,
                                                  city: dropDownValue2,
                                                  schoolname:
                                                      schoolnameController.text,
                                                  gender: dropDownValue1,
                                                  userid: functions.userIDGEN(),
                                                );
                                                await UsersRecord.collection
                                                    .doc(user.uid)
                                                    .update(usersCreateData);

                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        NavBarPage(
                                                            initialPage:
                                                                'HomePage'),
                                                  ),
                                                );
                                              },
                                              text: 'أنشاء حساب جديد',
                                              options: FFButtonOptions(
                                                width: 190,
                                                height: 50,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                        ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 7,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                              text: 'عودة',
                                              options: FFButtonOptions(
                                                width: 90,
                                                height: 50,
                                                color: Color(0xFFF1F2F6),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          fontSize: 13,
                                                        ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 7,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ).animated([
                                        animationsMap['rowOnPageLoadAnimation7']
                                      ]),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 40, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    27, 0, 9, 0),
                                            child: Text(
                                              'لديك حساب سابق؟',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Tajawal',
                                                        color:
                                                            Color(0xB5303030),
                                                      ),
                                            ).animated([
                                              animationsMap[
                                                  'textOnPageLoadAnimation2']
                                            ]),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 20, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPageWidget(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'تسجيل الدخول',
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                              ),
                                            ).animated([
                                              animationsMap[
                                                  'textOnPageLoadAnimation3']
                                            ]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25, 30, 25, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              'عند تسجيلك فإنك تُقر وتضمن وتوافق',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Tajawal',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(3, 0, 0, 0),
                                              child: Text(
                                                'سياسة الخصوصية',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color:
                                                              Color(0xFF2346C7),
                                                          fontSize: 12,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25, 6, 25, 50),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'و',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Tajawal',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                'شروط الأستخدام',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Tajawal',
                                                          color:
                                                              Color(0xFF2346C7),
                                                          fontSize: 12,
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
