import 'package:flutter/material.dart';
import 'package:food/detail.dart';
import 'package:food/model/class.dart';
import 'package:food/model/data.dart';
import 'package:food/widget/custom_widget.dart';
// Day la listviews card hozirol tu db cua Exclusive Offer,Best Selling,
class CustomCardhz extends StatefulWidget {
   CustomCardhz({super.key,required this.handler});
late DatabaseHandler handler;

  @override
  State<CustomCardhz> createState() => _CustomCardhzState();
}

class _CustomCardhzState extends State<CustomCardhz> {
  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 260,
                  child: FutureBuilder(
                      future: this.widget.handler.retrieveFruit(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Fruit>> snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: SizedBox(
                                    width: 180,
                                    child: Card(
                                      elevation: 0.4,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(21),
                                          side: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 197, 190, 190))),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(20),
                                        onLongPress: () async {
                                          await this.widget.handler.deleteFruit(
                                              snapshot.data![index].id!);
                                          setState(() {
                                            snapshot.data!
                                                .remove(snapshot.data![index]);
                                          });
                                        },
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Detail(
                                                      f: snapshot
                                                          .data![index])));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Image.asset(
                                                  "${snapshot.data![index].images.toString()}",
                                                  height: 100,
                                                  width: 100,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Column(
                                                children: [
                                                  CustomText(text:
                                                    "${snapshot.data![index].name.toString()}",
                                                   size: 19,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CustomText(text:
                                                    "S${snapshot.data![index].price.toString()} .",
                                                 
                                                  ),
                                                  SizedBox(
                                                    width: 14,
                                                  ),
                                                  Container(
                                                    height: 45,
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                        color: Color.fromRGBO(
                                                            83, 177, 117, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                        print("nam");
                                                      },
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                );
  }
}
// Day la listviews card hozirol tu db cua Groceries,
class CustomCardMinihz extends StatefulWidget {
   CustomCardMinihz({super.key,required this.hl});
late DatabaseHandler hl;

  @override
  State<CustomCardMinihz> createState() => _CustomCardMinihzState();
}

class _CustomCardMinihzState extends State<CustomCardMinihz> {
  @override
  Widget build(BuildContext context) {
    return  Container(
            height: 110,
            child: FutureBuilder(
                future: widget.hl.retrieveFruit(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Fruit>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10),
                            child: SizedBox(
                              width: 250,
                              child: Card(
                                color: snapshot.data![index].id!.isEven
                                    ? Color.fromARGB(255, 212, 155, 181)
                                    : Color.fromARGB(255, 242, 232, 203),
                                elevation: 0.4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(21),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                  onLongPress: () async {
                                    await widget
                                        .hl
                                        .deleteFruit(snapshot.data![index].id!);
                                    setState(() {
                                      snapshot.data!
                                          .remove(snapshot.data![index]);
                                    });
                                  },
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Detail(
                                                f: snapshot.data![index])));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "${snapshot.data![index].images.toString()}",
                                              height: 70,
                                              width: 70,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            CustomText(text:
                                              "${snapshot.data![index].name.toString()}",
                                             size: 19,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          );

  }}
