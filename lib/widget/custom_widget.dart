import 'package:flutter/material.dart';
// text
class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, this.size});
  final String? text;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontFamily: "Gilroy", fontSize: size),
    );
  }
}
// text h2
class CustomTextH2 extends StatelessWidget {
  const CustomTextH2({super.key, required this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, fontFamily: "Gilroy"),
    );
  }
}
// text bt
class CustomTextBt extends StatelessWidget {
  const CustomTextBt({super.key, required this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      "See All",
      style: TextStyle(
          fontFamily: "Gilroy",
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 83, 177, 117)),
    );
  }
}
//Banner
class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(left: 10, right: 40),
      decoration: BoxDecoration(
        color: Color.fromRGBO(246, 221, 201, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/vegetable.png",
            height: 80,
            width: 80,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fresh Vegetables",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Get Up To 40% OFF",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 83, 177, 117)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
