import 'package:first_flutter/douban/pages/home/home_model.dart';
import 'package:first_flutter/douban/widgets/dashed_line.dart';
import 'package:first_flutter/douban/widgets/star_rating.dart';
import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final MovieModel movieModel;

  HomeItem(this.movieModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 10, 6, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(
            height: 8,
          ),
          buildContent(),
        ],
      ),
    );
  }

  /// 1 头部
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "No.${movieModel.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  /// 2 内容
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        buildContentInfo(),
      ],
    );
  }

  /// 2.1 内容的图片
  Widget buildContentImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FadeInImage(
          height: 150,
          width: 100,
          placeholder: AssetImage("assets/images/holder.png"),
          image: NetworkImage(
            movieModel.imageURL,
          ),
        ));
  }

  /// 2.2 内容的信息
  Widget buildContentInfo() {
    // Expanded
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          buildContentInfoYear(),
          SizedBox(
            height: 3,
          ),
          buildContentInfoRate(),
          SizedBox(
            height: 3,
          ),
          buildContentInfoOther(),
        ],
      ),
    );
  }

  /// 2.2.1 内容的信息中的标题
  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
        text: movieModel.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// 2.2.2 内容的信息中的年份
  Widget buildContentInfoYear() {
    return Text(
      movieModel.playDate,
      style: TextStyle(fontSize: 18, color: Colors.grey),
    );
  }

  /// 2.2.3 内容的信息中的分数
  Widget buildContentInfoRate() {
    return Row(
      children: <Widget>[
        StarRating(
          rating: movieModel.rating,
          size: 20,
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          "${movieModel.rating}",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  /// 2.2.4 内容的信息中的其他信息
  Widget buildContentInfoOther() {
    final genresString = movieModel.genres.join(" ");
    final directorString = movieModel.director.name;
    final actorString = movieModel.casts.map((item) => item.name).join(" ");

    return Text(
      "$genresString / $directorString / $actorString",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }
}
