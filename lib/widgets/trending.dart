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
          modtext(text:"Trending Movies",color: Colors.white,size:30,),
          Container(height: 270,
          child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trending.length,
            itemBuilder: (context,index){
              return InkWell(
                onTap: (){},
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height:200,
                        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(
                          'http://image.tmdb.org/t/p/w500'+trending[index]['poster_path']
                        ),),),
                      ),
                      Container(
                        child: modtext(text:trending[index]['title']!=null?
                            trending[index]['title']:'loading',color: Colors.white,size: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          ),
          )
        ],
      ),
    );
  }
}
