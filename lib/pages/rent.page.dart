import 'package:alugueai_mobile/shared/constants.dart';
import 'package:alugueai_mobile/pages/home/components/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
    );
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
        AnimatedSearchBar(),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
