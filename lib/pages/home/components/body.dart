import 'package:alugueai_mobile/pages/home/components/categorries.dart';
import 'package:alugueai_mobile/pages/home/components/searchBar.dart';
import 'package:alugueai_mobile/pages/models/Object.dart';
import 'package:alugueai_mobile/repositories/objetosRepository.dart';
import 'package:alugueai_mobile/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<List<ObjectModel>> objectFuture;
  ObjetoRepository _repository = ObjetoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Categories(),
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
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        var item = snapshot.data[index];
                        return ListTile(
                          title: Text(item.nome),
                          subtitle: Text(item.preco),
                        );
                      },
                    );
                  }
                },
              ),

              /*   child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: GridView.builder(
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: kDefaultPaddin,
              crossAxisSpacing: kDefaultPaddin,
              childAspectRatio: 0.75,
            ),
            
              itemBuilder: (context, index) => ItemCard(
                    product: products[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            product: products[index],
                          ),
                        )),
                  ) 
          ),
        ), */
            ),
          ],
        ));
  }
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
    actions: <Widget>[AnimatedSearchBar(), SizedBox(width: kDefaultPaddin / 2)],
  );
}
