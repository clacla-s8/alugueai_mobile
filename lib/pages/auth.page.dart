import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Auth {
  Dio dio = new Dio();

  login(email, senha) async {
    Dio dio = Dio();
    try {
      return await dio.post('https://alugueai.herokuapp.com/sessao/anunciante',
          data: {"mail": email, "senhaEntrada": senha},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
