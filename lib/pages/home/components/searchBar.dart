import 'package:alugueai_mobile/pages/models/Object.dart';
import 'package:alugueai_mobile/repositories/objetosRepository.dart';
import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = false;
  Future<List<ObjectModel>> objectFuture;
  ObjetoRepository _repository = ObjetoRepository();
  TextEditingController _buscaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: _folded ? 56 : 250,
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: !_folded
                  ? TextFormField(
                      controller: _buscaController,
                      decoration: InputDecoration(
                          hintText: 'Pesquisar',
                          hintStyle: TextStyle(color: Colors.lightBlue),
                          border: InputBorder.none),
                    )
                  : null,
            ),
          ),
          Container(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(_folded ? 32 : 0),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    _folded ? Icons.search : Icons.search,
                    color: Colors.lightBlue,
                  ),
                ),
                onTap: () {
                  setState(() {
                    if (_buscaController.text.isEmpty) {
                      objectFuture = _repository.findAll();
                      print("findall");
                    } else {
                      objectFuture =
                          _repository.findFilter(_buscaController.text);
                      print("filter");
                    }
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
