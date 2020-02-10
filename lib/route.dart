import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/NowPage.dart';
import 'package:flutter_app/Pages/PreventPage.dart';
import 'package:flutter_app/Pages/LocalPage.dart';
import 'package:flutter_app/Pages/TrafficPage.dart';
import 'package:flutter_app/Pages/CommunityPage.dart';
import 'package:flutter_app/Pages/StudyPage.dart';
import 'package:flutter_app/Pages/SourcePage.dart';


final routes = {
  '/Local': (context) => LocalPage(),                 //本地疫情
  '/Now': (context) => NowPage(),                 //最新进展
  '/Prevent': (context) => PreventPage(),         //预防治疗
  '/Traffic': (context) => TrafficPage(),                 //同行程查询
  '/Community': (context) => CommunityPage(),                 //同小区查询
  '/Study': (context) => StudyPage(),                 //在家学习
  '/Source': (context) => SourcePage(),                 //资源搜索
};


// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context));
      return route;
    }
  }
};