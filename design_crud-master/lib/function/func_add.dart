import 'package:crud_mysql/function/func_handleNull.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'func_isLoading.dart';

addData(context, tanggal, agenda, pathImg, file) async {
  //handle data kosong
  if (tanggal == null || agenda == null || pathImg == null) {
    handle("Semua data harus diisi!");
  } else {
    //jika data tidak kosong, loading lalu pushnamed ke fungsi read
    isLoading(context);
    String imgName = pathImg.path.split('/').last;
    FormData sendData = FormData.fromMap({
      "tanggal": tanggal.toString(),
      "agenda": agenda.toString(),
      "tempat": await MultipartFile.fromFile(pathImg.path,
          filename: imgName.toString()),
    });
    final response = await Dio().post(
"https://oasis2022.000webhostapp.com/add_akademik.php?",
        data: sendData);
    log("test send data:" + tanggal.toString());
    return Navigator.of(context)
        .pushNamedAndRemoveUntil('/read', (Route<dynamic> route) => false);
  }
}
