import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetCourseCall {
  static Future<ApiCallResponse> call({
    String pagenumber = '30',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Course',
      apiUrl:
          'https://kawenter.net/wp-json/wp/v2/course?categories=23&per_page=${pagenumber}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic bW9zdGFmYWFsd2luX3h2ZWc0ZDF1OnY4RUJNN3IxayQ=',
      },
      params: {},
      returnBody: true,
    );
  }
}

class PromoCodeCall {
  static Future<ApiCallResponse> call({
    String pagenumber = '1',
    String search = 'null',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'PromoCode',
      apiUrl:
          'https://kawenter.net/wp-json/wp/v2/promocode?&slug=${search}&per_page=${pagenumber}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic bW9zdGFmYWFsd2luX3h2ZWc0ZDF1OnY4RUJNN3IxayQ=',
      },
      params: {},
      returnBody: true,
    );
  }
}

class DelatePromoCodeCall {
  static Future<ApiCallResponse> call({
    String pagenumber = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delate PromoCode ',
      apiUrl: 'https://kawenter.net/wp-json/wp/v2/promocode/${pagenumber}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Basic bW9zdGFmYWFsd2luX3h2ZWc0ZDF1OnY4RUJNN3IxayQ=',
      },
      params: {},
      returnBody: true,
    );
  }
}

class GetCourseDetailsCall {
  static Future<ApiCallResponse> call({
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Course Details',
      apiUrl: 'https://kawenter.net/wp-json/wp/v2/course/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic bW9zdGFmYWFsd2luX3h2ZWc0ZDF1OnY4RUJNN3IxayQ=',
      },
      params: {},
      returnBody: true,
    );
  }
}

class PromoCodeUpdateCall {
  static Future<ApiCallResponse> call({
    String categoriesid = '',
    String pagenumber = '',
  }) {
    final body = '''
{
  "status": "publish",
  "type": "promocode",
  "categories": [
    "${categoriesid}"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'PromoCode Update',
      apiUrl: 'https://kawenter.net/wp-json/wp/v2/promocode/${pagenumber}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Basic bW9zdGFmYWFsd2luX3h2ZWc0ZDF1OnY4RUJNN3IxayQ=',
      },
      params: {
        'categoriesid': categoriesid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
