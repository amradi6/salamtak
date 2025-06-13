import 'package:flutter/material.dart';

class FavoriteDoctorsCards extends StatelessWidget {
  const FavoriteDoctorsCards({
    super.key,
    required this.size, required this.name, required this.specialization, required this.isFavorite, required this.image,
  });

  final Size size;
  final String name;
  final String specialization;
  final bool isFavorite;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Color(0X06000000),
            blurRadius: 20,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding:EdgeInsets.only(right: size.width*0.065,top: size.height*0.0105),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width:size.width*0.0436,
                  height: size.height*0.0186,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite?Colors.red:Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height*0.0186),
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            child: Image.asset(
              image,
              height: size.height*0.1043,
              width: size.height*0.1043,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: size.height*0.0136),
          Text(
            name,
            style: TextStyle(
              fontSize: 15,
              color: Color(0XFF333333),
              fontWeight: FontWeight.normal,
              fontFamily: "Rubik",
            ),
          ),
          SizedBox(height: size.height*0.00496),
          Text(
            specialization,
            style: TextStyle(
              fontSize: 12,
              color: Color(0XFF0EBE7E),
              fontWeight: FontWeight.w300,
              fontFamily: "Rubik",
            ),
          ),
        ],
      ),
    );
  }
}