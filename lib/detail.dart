import 'package:flutter/material.dart';
import 'package:food/model/class.dart';
import 'package:food/widget/custom_widget.dart';
import 'package:ionicons/ionicons.dart';

int sl = 1;

// day la man hinh chi tiet
class Detail extends StatefulWidget {
  const Detail({super.key, required this.f});
  final Fruit f; // luu du lieu tu click

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(  // khu vuc anh
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 233, 231, 231),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.keyboard_return)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share))
                  ],
                ),
                Center(
                  child: Image.asset("${widget.f.images}",
                      height: 250, width: 250),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: "${widget.f.name}",
                      size: 25,
                    ),
                    Icon(
                      Ionicons.heart_outline,
                      size: 30,
                    )
                  ],
                ),
                Text("1kg,Price"),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              sl++;
                            });
                          },
                          icon: Icon(Ionicons.add),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Color.fromARGB(255, 197, 188, 188),
                                  width: 1)),
                          child: Center(
                              child: CustomText(
                            text: "$sl",
                          )),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              sl--;
                            });
                          },
                          icon: Icon(Icons.exposure_minus_1_outlined),
                        ),
                      ],
                    ),
                    CustomText(
                      text: "S${widget.f.price}",
                      size: 25,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Product Detail",
                            size: 17,
                          ),
                          Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                        style: TextStyle(fontFamily: "Gilroy", fontSize: 17),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Nutritions",
                            size: 17,
                          ),
                          Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Review",
                            size: 17,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                              ),
                              Icon(Icons.chevron_right_rounded),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      //button
      floatingActionButton: GestureDetector(
        onTap: () {
          print("hihi");
        },
        child: Container(
          height: 57,
          width: 350,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 83, 177, 117),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              "Add To Basket",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
