import 'package:flutter/material.dart';
import 'package:salamtak/core/constants/widgets/circle_for_bg.dart';
import 'package:salamtak/core/constants/widgets/text_form_for_search.dart';

class FavoriteDoctorsScreen extends StatelessWidget {
  const FavoriteDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CircleForBg(
            size: size,
            width: size.width * 0.56,
            height: size.width * 0.56,
            top: size.height * -0.0397,
            left: size.width * -0.1875,
            color: Color(0X4361CEFF),
          ),
          CircleForBg(
            size: size,
            width: size.width * 0.56,
            height: size.width * 0.56,
            bottom: size.height * 0.0062,
            left: size.width * 0.4896,
            color: Color(0X1E0EBE7E),
          ),
          Positioned(
            top: size.height * 0.0447,
            left: size.width * 0.052,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: size.width * 0.078,
                      height: size.width * 0.078,
                      decoration: BoxDecoration(
                        color: Color(0XFFFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0XFF677294),
                      ),
                    ),
                    SizedBox(width: size.width * 0.049),
                    Text(
                      "Favourite Doctors",
                      style: TextStyle(
                        color: Color(0XFF222222),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Rubik",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.042),
                TextFormForSearch(
                  size: size,
                  textInputType: TextInputType.text,
                  filled: true,
                  hintText: "Find your favorite doctor",
                  suffixIcon: Icon(Icons.cancel),
                ),
                SizedBox(height: size.height * 0.029),
                SizedBox(
                  width: size.width*0.8723,
                  height: size.height*0.62088,
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 160,
                      mainAxisSpacing:size.height*0.019,
                      crossAxisSpacing:size.height*0.019,
                      childAspectRatio: 0.8888,
                    ),
                    itemBuilder: (context, index) {
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
                                      icon: Icon(Icons.favorite),
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
                                "assets/images/AmrAdi.jpg",
                                height: size.height*0.1043,
                                width: size.height*0.1043,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: size.height*0.0136),
                            Text(
                              "Dr. Shouey",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0XFF333333),
                                fontWeight: FontWeight.normal,
                                fontFamily: "Rubik",
                              ),
                            ),
                            SizedBox(height: size.height*0.00496),
                            Text(
                              "Specalist Cardiology",
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
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
