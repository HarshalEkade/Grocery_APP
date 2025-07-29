import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int item = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 325,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromRGBO(242, 243, 242, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                   Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(Icons.arrow_back_ios_new),
                        ),
                      const Spacer(),
                      const RotatedBox(
                        quarterTurns: 3,
                        child: Icon(Icons.logout_rounded),
                      )
                    ],
                  ),
                  Center(
                    child: Image.asset(
                      "assets/Vector (4).png",
                      height: 200,
                      width: 330,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Naturel Red Apple",
                      style: GoogleFonts.dmSans(
                          fontSize: 23, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    const Icon(Icons.favorite_border_outlined)
                  ],
                ),
                Text(
                  "1kg, Price",
                  style: GoogleFonts.dmSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(124, 124, 124, 1)),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (item > 0) {
                          item--;
                        }

                        setState(() {});
                      },
                      child: const Icon(
                        Icons.remove,
                        color: Color.fromRGBO(83, 177, 117, 1),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17),
                          color: const Color.fromRGBO(226, 226, 226, 1)),
                      child: Center(child: Text("$item")),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          item++;
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        color: Color.fromRGBO(83, 177, 117, 1),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$4.99",
                      style: GoogleFonts.dmSans(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Product Details",
                  style: GoogleFonts.dmSans(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Apples are nutritious. Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color:const Color.fromRGBO(124, 124, 124, 1)
                    ),
                  ),
                ),
                const SizedBox(height:20),
                Container(
                  height: 78,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been 1500s, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color:const Color.fromRGBO(124, 124, 124, 1)
                    ),
                  ),
                ),
                const SizedBox(height: 60,),
                Container(
                  height: 70,
                  width: 374,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(83, 177, 117, 1),
                  ),
                  child: Center(
                    child: Text(
                      "Add To Basket",
                      style: GoogleFonts.dmSans(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
