import 'package:alugueai_mobile/pages/bottomNavigation.page.dart';
import 'package:alugueai_mobile/repositories/object.dart';

import 'package:flutter/material.dart';

class RegisterObject extends StatefulWidget {
  @override
  _RegisterObjectState createState() => _RegisterObjectState();
}

class _RegisterObjectState extends State<RegisterObject> {
  var nome, preco, img, categoria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.grey[50],
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Cadastrar objeto',
                  style: TextStyle(
                    fontFamily: 'Cardo',
                    fontSize: 30,
                    color: Color(0XFF03A9F4),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                //
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              onChanged: (val) {
                nome = val;
              },
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Preço",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              onChanged: (val) {
                preco = val;
              },
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Imagem",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              onChanged: (val) {
                img = val;
              },
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Categoria",
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              onChanged: (val) {
                categoria = val;
              },
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Color(0XFF03A9F4),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Cadastrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    CreateObject()
                        .registerObj(nome, preco, img, categoria)
                        .then((val) {
                      if (val.data['success']) {
                        print("entrei");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    BottomNavigation()));
                      }
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
