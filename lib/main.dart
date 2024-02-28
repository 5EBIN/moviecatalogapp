import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:moviecatalogapp/utils/textstyle.dart';
import 'dart:convert';
import 'package:tmdb_api/tmdb_api.dart';
import '/utils/textstyle.dart';
import 'widgets/trending.dart';

void main()=>runApp(new MyApp());


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List trendingmovies=[];
  List topratedmovies=[];
  List tv=[];
  final String apikey="506b3f6384b76a41177b217730151741";
  final readaccesstoken="eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDZiM2Y2Mzg0Yjc2YTQxMTc3YjIxNzczMDE1MTc0MSIsInN1YiI6IjY1ZGYyNGM1OThmMWYxMDE2NDk5MWYzNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.a_npYqKumqzcWC1wf4K8s30FObZ1QMUcJx-e4x6Hn84";
  @override
  void initState(){
    loadmovies();
    super.initState();
  }
  loadmovies()async{
  TMDB tmdbWithCustomLogs=TMDB(ApiKeys(apikey,readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ),
  );
  Map trendingresult=await tmdbWithCustomLogs.v3.trending.getTrending();
  Map topratedresult=await tmdbWithCustomLogs.v3.movies.getTopRated();
  Map tvresult=await tmdbWithCustomLogs.v3.tv.getPopular();
  setState(() {
    trendingmovies=trendingresult['results'];
    topratedmovies=topratedresult['results'];
    tv=tvresult['results'];
  });
  print(trendingmovies);
  }

  //@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:modtext(text:"Movie Catalog",color: Colors.black,size: 40,),
        backgroundColor: Colors.cyan,
      ),
      body: ListView(
        children: [
          TrendingMovies(trending:trendingmovies),],
      ),
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     //
      //     // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
      //     // action in the IDE, or press "p" in the console), to see the
      //     // wireframe for each widget.
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
