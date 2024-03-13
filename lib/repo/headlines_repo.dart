import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news/data_class/top_headlines.dart';

import '../bloc/cache_bloc.dart';

class TopHeadlinesrepo

{
  Future <TopHeadlines> fetchheadlines(BuildContext context) async
  {
    // final cacheBloc = BlocProvider.of<CacheBloc>(context);

    // try {
    //   final result = await InternetAddress.lookup('google.co.in');
    //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    //     print('connected');
    //   }
    // } on SocketException catch (_) {
    //   print('not connected');
    //   cacheBloc.add(LoadDataEvent());
    //   final data = cacheBloc.sharedPreferences.getString('cached_data');
    //
    //   if(data==null){
    //     Map<String,dynamic> empty = {};
    //     return TopHeadlines.fromJson(empty);
    //   }
    //   else{
    //     final answer = jsonDecode(data);
    //     return TopHeadlines.fromJson(answer);
    //   }
    //
    // }

    String url ="https://newsapi.org/v2/top-headlines?country=us&apiKey=70ad3db619b4465fb6e814db7d83c25a";
    String url1 ="https://newsapi.org/v2/everything?q=bitcoin&apiKey=70ad3db619b4465fb6e814db7d83c25a";
    final response = await http.get(Uri.parse(url));
    print(response.body);

    if(response.statusCode==200)
      {
        final answer = jsonDecode(response.body);

        // cacheBloc.add(SaveDataEvent(data: response.body));

        return TopHeadlines.fromJson(answer);
      }
    throw Exception("Error Fetching Headlines");
  }
}