import 'package:alugueai_mobile/pages/models/Object.dart';
import 'package:alugueai_mobile/repositories/objetosRepository.dart';
import 'package:alugueai_mobile/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<ObjectModel>> objectFuture;
  ObjetoRepository _repository = ObjetoRepository();

  // Categories categories;
  List<String> categories = [
    "Tudo",
    "Ferramenta",
    "Festa",
    "Fotografia",
    "Tecnologia",
    "Outros"
  ];
  // By default our first item will be selected
  int selectedIndex = 0;

  String busca = "";
  bool _folded = false;
  TextEditingController _buscaController = TextEditingController();

  String get selecionado => categories[selectedIndex];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildCategory(),
            Expanded(
              child: FutureBuilder(
                future: this._repository.findAll(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<ObjectModel>> snapshot) {
                  print(snapshot.hasData);
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 60,
                          ),
                          Text('Error: ${snapshot.error}'),
                        ],
                      ),
                    );
                  } else {
                    return GridView.count(
                        crossAxisCount: 2,
                        children: snapshot.data
                            .where((d) {
                              if (busca.trim() == "") {
                                if (selecionado == "Tudo")
                                  return true;
                                else
                                  return d.categoria ==
                                      selecionado.toLowerCase();
                              } else if (selecionado != "Tudo") {
                                return d.nome
                                        .toLowerCase()
                                        .contains(busca.toLowerCase()) &&
                                    d.categoria == selecionado.toLowerCase();
                              } else
                                return d.nome
                                    .toLowerCase()
                                    .contains(busca.toLowerCase());
                            })
                            .map((item) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(kDefaultPaddin),
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlue[50],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Hero(
                                          tag: "${item.nome}",
                                          child: Icon(Icons.photo_camera),
                                          //child: Image.network(item.img),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: kDefaultPaddin),
                                      child: Text(
                                        item.nome,
                                        style: TextStyle(
                                            color: kTextLightColor,
                                            fontSize: 20),
                                      ),
                                    ),
                                    Text(
                                      "R\$${item.preco}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )
                                  ],
                                )) //exibido
                            .toList());
                  }
                },
              ),
            ),
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.lightBlue,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        buildSearch(context),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }

  Widget buildCategory() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      print(selectedIndex);
                      print(selecionado);
                    });
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          categories[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: selectedIndex == index
                                ? kTextColor
                                : kTextLightColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: kDefaultPaddin / 4), //top padding 5
                          height: 0,
                          width: 30,
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.transparent,
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }

  Widget buildSearch(BuildContext context) {
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
                    busca = _buscaController.text.trim();
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
