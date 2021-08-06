import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildloginheader() {
  return Stack(
    children: [
      Container(
        color: HexColor("#0E69A7"),
        width: double.infinity,
        height: 200,
      ),
      Column(
        children: [
          Stack(
            children: [
              Center(
                  child: Image(image: AssetImage("assets/Ellipse 80@1X.png"))),
              Center(
                  child: Image(image: AssetImage("assets/Ellipse 81@1X.png"))),
            ],
          ),
        ],
      )
    ],
  );
}

defaulttextformfield({
  @required String? label,
  @required TextEditingController? controller,
  @required TextInputType? type,
  bool isPassword = false,
  Widget? suffix,
  required String? Function(String?) validate,
}) {
  return TextFormField(
    controller: controller,
    validator: validate,
    keyboardType: type,
    obscureText: isPassword,
    style: TextStyle(
        color: HexColor("#707070"), fontSize: 18, fontWeight: FontWeight.bold),
    decoration: InputDecoration(
      suffixIcon: suffix,
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 16,
        color: HexColor('B1B1B1'),
      ),
    ),
  );
}

builddefaultContainerbutton(
    {@required String? text,
    Function? ontap,
    //@required Widget? weidget,
    BuildContext? context}) {
  return InkWell(
    onTap: () => ontap!(),
    child: Container(
      child: Center(
          child: Text(text.toString(),
              style: TextStyle(color: Colors.white, fontSize: 20))),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: HexColor("#0E69A7"),
      ),
    ),
  );
}

Widget custumIcon({@required Function? ontap}) => InkWell(
    onTap: () => ontap!(), child: Image(image: AssetImage("assets/icon.png")));

List<String> images = [
  "assets/pills.png",
  "assets/microscope.png",
  "assets/doctor.png",
  "assets/hospital.png"
];
List<String> names = ["Products", "Labs", "Doctors", "Hospitals"];
buildourservicseWeidget(int index) {
  return Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Column(
      children: [
        Container(
          child: Center(child: Image(image: AssetImage(images[index]))),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(6)),
          width: 70,
          height: 60,
        ),
        SizedBox(
          height: 5,
        ),
        Text(names[index], style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
  );
}

buildremainderWeidget(
    {@required String? image,
    @required String? title,
    @required String? desc}) {
  return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image(image: AssetImage(image!)),
          SizedBox(
            width: 15,
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title!,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                Text(desc!, style: TextStyle())
              ],
            ),
          )
        ]),
      ));
}

List<BottomNavigationBarItem> bottomItems = [
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
    ),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.record_voice_over_rounded),
    label: 'Record',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.explore),
    label: 'Explore',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.shield),
    label: 'Insurance',
  ),
  const BottomNavigationBarItem(
    icon: Icon(
      Icons.person,
    ),
    label: 'Profile',
  ),
];
buildproductItem(
    {@required String? image, @required String? name, @required int? price}) {
  return Stack(alignment: AlignmentDirectional.topCenter, children: [
    Container(
      width: 170,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 85),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 16,
                  // itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    size: 16,
                    color: HexColor("F4C035"),
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                Spacer(),
                Text(
                  "(7 reviews) ",
                  style: TextStyle(fontSize: 11),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${price!.toDouble()}" + " EGP",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: HexColor("0F5AF2")),
            )
          ],
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Image(image: NetworkImage(image!)),
      ),
    )
  ]);
}
  /*
  InkWell(
                    onTap: _changerate,
                    child: _israted
                        ? Icon(
                            Icons.star,
                            size: 16,
                            color: HexColor("F4C035"),
                          )
                        : Icon(
                            Icons.star_border,
                            size: 16,
                            color: HexColor("F4C035"),
                          ),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.star,
                      size: 16,
                      color: HexColor("F4C035"),
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.star,
                      size: 16,
                      color: HexColor("F4C035"),
                    ),
                  ),
                  InkWell(
                    child: Icon(
                      Icons.star,
                      size: 16,
                      color: HexColor("F4C035"),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.star_border,
                      size: 16,
                      color: HexColor("F4C035"),
                    ),
                  ),*/