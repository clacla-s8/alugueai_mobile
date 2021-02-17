import 'package:alugueai_mobile/shared/constants.dart';
import 'package:alugueai_mobile/pages/models/Product.dart';
import 'package:flutter/material.dart';

class ButtonAlugar extends StatelessWidget {
  const ButtonAlugar({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Colors.lightBlue,
                onPressed: () {},
                child: Text(
                  "Alugar".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
