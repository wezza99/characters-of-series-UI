import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/Models/characters.dart';
import 'package:flutter_application_1/constants/colors.dart';

class characteritem extends StatelessWidget {
  const characteritem({
    Key? key,
    required this.mycharacter,
  }) : super(key: key);
  final Character mycharacter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: MyColors.myWhite,
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: Colors.black54,
          child: Text(
            mycharacter.name,
            style: const TextStyle(
              fontSize: 15,
              height: 1.3,
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: MyColors.myGrey,
          child: mycharacter.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: "assets/images/loading.gif",
                  height: double.infinity,
                  width: double.infinity,
                  image: mycharacter.image,
                  fit: BoxFit.cover,
                )
              : Image.asset("assets/images/myphoto.jpg"),
        ),
      ),
    );
  }
}
