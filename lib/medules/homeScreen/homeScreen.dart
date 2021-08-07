import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/medules/loginScreen/loginScreen.dart';

import 'package:todo_app/shared/components/componentes.dart';
import 'package:todo_app/shared/network/remote/firebase.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();
  int? index;
  int currentIndex = 0;
  User? user = FirebaseAuth.instance.currentUser;
  changecurrentindex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            changecurrentindex(index);
            print(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 25.0,
          selectedItemColor: HexColor("0F5AF2"),
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: currentIndex,
          items: bottomItems,
        ),
        backgroundColor: HexColor("F2F4F7"),
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: InkWell(
                onTap: () async {
                  Authentication.signout();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Icon(
                  Icons.menu,
                  color: HexColor('0F5AF2'),
                ),
              ),
            )
          ],
          title: user!.phoneNumber == null
              ? Text(
                  "Good everything " + user!.email!.split("@").first.toString(),
                  style: GoogleFonts.roboto(color: Colors.black, fontSize: 15))
              : Text("Good everything " + user!.displayName.toString(),
                  style: GoogleFonts.roboto(color: Colors.black, fontSize: 15)),
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              child: user != null
                  ? Text(user!.email!.split('').first.toUpperCase())
                  : Image(image: NetworkImage(user!.photoURL.toString())),
              radius: 26,
            ),
          ),
          elevation: 0,
          backgroundColor: HexColor("F2F4F7"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                margin: EdgeInsets.all(12),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "What aer you looking for ?",
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          isDense: true,
                        ),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Trending",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://7asreeat.com/wp-content/uploads/2021/07/%D8%B9%D8%B1%D9%88%D8%B6-%D8%B5%D9%8A%D8%AF%D9%84%D9%8A%D8%A7%D8%AA-%D8%A7%D9%84%D8%B9%D8%B2%D8%A8%D9%8A.jpg")),
                          borderRadius: BorderRadius.circular(6)),
                      width: double.infinity,
                      height: 150,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Our Service",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 85,
                      child: ListView.separated(
                          //physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return buildourservicseWeidget(index);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 20,
                            );
                          },
                          itemCount: names.length),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Reminders",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildremainderWeidget(
                        image: "assets/capsola.png",
                        title: "Dose Reminder",
                        desc: "Next Dosage"),
                    SizedBox(
                      height: 10,
                    ),
                    buildremainderWeidget(
                        image: "assets/remainder.png",
                        title: "Appointments",
                        desc: "See Your Next Appointment "),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Recommended For You",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        buildproductItem(
                            image:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ5O58qydIQE90O6rcFbVoKe2nAZevsLZP0g&usqp=CAU",
                            name: "Health Life V2500M Multi-Func…",
                            price: 6850),
                        SizedBox(
                          width: 15,
                        ),
                        buildproductItem(
                            image:
                                "https://cdn.al-ain.com/images/2021/7/23/135-122744-australia-pfizer-vaccine-children_700x400.jpg",
                            name:
                                "Vaccinations and Children – Can the Court force me to vaccinate my child",
                            price: 670),
                        SizedBox(
                          width: 15,
                        ),
                        buildproductItem(
                            image:
                                "https://images.yaoota.com/C1i-aCy9GnQURpV3atHxccePng4=/trim/yaootaweb-production/media/crawledproductimages/ee710dfe95f20f5c2ea50631a3abb6a9370a433d.jpg",
                            name:
                                "Herbal Essences Daily Detox Shine White Tea and Mint Shampoo 400ml",
                            price: 39),
                        SizedBox(
                          width: 15,
                        ),
                        buildproductItem(
                            image:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ5O58qydIQE90O6rcFbVoKe2nAZevsLZP0g&usqp=CAU",
                            name: "Health Life V2500M Multi-Func…",
                            price: 6850),
                      ]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Most Selling",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        buildproductItem(
                            image:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ5O58qydIQE90O6rcFbVoKe2nAZevsLZP0g&usqp=CAU",
                            name: "Health Life V2500M Multi-Func…",
                            price: 6850),
                        SizedBox(
                          width: 15,
                        ),
                        buildproductItem(
                            image:
                                "https://cdn.al-ain.com/images/2021/7/23/135-122744-australia-pfizer-vaccine-children_700x400.jpg",
                            name:
                                "Vaccinations and Children – Can the Court force me to vaccinate my child",
                            price: 670),
                        SizedBox(
                          width: 15,
                        ),
                        buildproductItem(
                            image:
                                "https://images.yaoota.com/C1i-aCy9GnQURpV3atHxccePng4=/trim/yaootaweb-production/media/crawledproductimages/ee710dfe95f20f5c2ea50631a3abb6a9370a433d.jpg",
                            name:
                                "Herbal Essences Daily Detox Shine White Tea and Mint Shampoo 400ml",
                            price: 39),
                        SizedBox(
                          width: 15,
                        ),
                        buildproductItem(
                            image:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ5O58qydIQE90O6rcFbVoKe2nAZevsLZP0g&usqp=CAU",
                            name: "Health Life V2500M Multi-Func…",
                            price: 6850),
                      ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
