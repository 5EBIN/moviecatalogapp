import 'package:flutter/material.dart';
import '/utils/textstyle.dart';

class TrendingMovies extends StatelessWidget {
  //const TrendingMovies({super.key});
  final List trending;

  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          modtext(text:"Trending Movies",color: Colors.white,size:30,)
        ],
      ),
    );
  }
}
