import 'package:first_flutter/douban/utils/utils.dart';
import 'package:first_flutter/http/http_request.dart';

import 'home_model.dart';

/// 首页网络请求
class HomeRequest {
  /// 请求top250电影列表
  static Future<List<MovieModel>> requestTop250(int start) async {
    // 1.构建url
    final url =
        "http://t.yushu.im/v2/movie/top250?start=$start&count=${Constant.HOME_PAGE_OFFSET}";

    // 2.发送网络请求
    final result = await HttpRequest.request(url);

    // 3.解析数据，Map转Model
    final subjects = result["subjects"];
    List<MovieModel> movies = [];
    for (var sub in subjects) {
      final item = MovieModel.fromMap(sub);
      print(item.toString());
      movies.add(item);
    }

    return movies;
  }
}
