import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateObject {
  Dio dio = new Dio();

  registerObj(nome, preco, img, categoria) async {
    try {
      Dio dio = new Dio();
      return await dio
          .post('https://alugueaimeu.herokuapp.com/objeto/cadastrar', data: {
        "nome": nome,
        "preco": preco,
        "img": img,
        "categoria": categoria
      });
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
