import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:food/detail.dart';
import 'package:food/widget/custom_widget.dart';
import 'package:food/model/class.dart';
import 'package:ionicons/ionicons.dart';
import 'model/data.dart';
import 'package:food/widget/custom_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage1(),
    );
  }
}

class Homepage1 extends StatefulWidget {
  const Homepage1({super.key});

  @override
  State<Homepage1> createState() => _Homepage1State();
}

class _Homepage1State extends State<Homepage1> {
  late DatabaseHandler handler;

  // add fruit
  Future<int> addFruit() async {
    Fruit fistFruit = Fruit(
        name: "Apple", images: "assets/apple.png", price: "500k", kg: "4");
    Fruit banana = Fruit(
        name: "Banana",
        images: "assets/banana.png",
        kg: "2kg",
        price: "10000.0");
    Fruit mango = Fruit(
        name: "Mango", images: "assets/mango.png", kg: "2kg", price: "10000.0");
    Fruit berrial = Fruit(
        name: "Berrial",
        images: "assets/berries.png",
        kg: "2kg",
        price: "10000.0");

    List<Fruit> listofFruit = [fistFruit, banana, mango, berrial];
    return await this.handler.insertFruit(listofFruit);
  }
// khoi tao khi Load man hinh
  @override
  void initState() {
    super.initState();
    this.handler = DatabaseHandler();
    this.handler.initializeDB().whenComplete(() async {
      // await this.addFruit();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appbar
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Column(
          children: [
            Image.asset(
              "assets/carrot.png",
              height: 30,
              width: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.place),
                CustomText(
                  text: "Dhaka, Banassre",
                )
              ],
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // form Seach store
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 243, 242, 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        label: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Icon(Icons.search),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(text: "Seach store")
                          ],
                        ),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomBanner(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextH2(text: "Exclusive Offer"),
                    CustomTextBt(text: "See All")
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //Listviews cua Exclusive Offer
                CustomCardhz(handler: handler),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextH2(text: "Best Selling"),
                    CustomTextBt(text: "See All")
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                //Listviews cua Best Selling
                CustomCardhz(handler: handler),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextH2(text: "Groceries"),
              CustomTextBt(text: "See All")
            ],
          ),
          SizedBox(
            height: 15,
          ),
          //Listviews cua Groceries
          CustomCardMinihz(hl: handler),
          SizedBox(
            height: 10,
          ),
          CustomCardhz(handler: handler)
        ],
      ),
      //bottom bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.heart_outline), label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Account"),
        ],
      ),
    );
  }
}
