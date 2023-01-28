import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';

class ListCloud {
  String id, tanggal, agenda, tempat,img;
  ListCloud(
      {required this.id,
      required this.tanggal,
      required this.agenda,
      required this.tempat,
      required this.img});
}

Future<List<ListCloud>> read(query) async {
  List<ListCloud> dataList = <ListCloud>[];
  ListCloud tmpData;
  final response = await Dio().get(
"https://oasis2022.000webhostapp.com/list_akademik.php",
      queryParameters: {
        "key": query.toString(),
      });
  log("test query : $query");
  log("test read data : ${response.data[0]}");
  var data = response.data;
  log("test decode: ${data[0]}");

  if (data.length == 0) {
    return dataList;
  } else {
    List<ListCloud> tdata = [];
    data.forEach((item) {
      tmpData = ListCloud(
          id: item["id"]!,
          tanggal: item["tanggal"]!,
          agenda: item["agenda"]!,
          tempat: item["tempat"]!,
          img: item["img"]!);
      dataList.add(tmpData);
    });
    return dataList;
  }
}
