import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateUser {
  Dio dio = new Dio();

  signup(nome, telefone, endereco, email, senha) async {
    try {
      Dio dio = new Dio();
      return await dio
          .post('https://alugueai.herokuapp.com/anunciante/cadastrar', data: {
        "nome": nome,
        "telefone": telefone,
        "endereco": endereco,
        "email": email,
        "senha": senha
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
