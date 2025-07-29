import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/view/description.dart';

import 'explore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35,
                    width: 28,
                    child: Image.asset(
                      "assets/Group.png",
                      fit: BoxFit.fill,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on),
                  Text(
                    "Pune, Maharashtra",
                    style: GoogleFonts.dmSans(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(242, 243, 242, 1),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 2),
                          color: Color.fromRGBO(0, 0, 0, 0.04)),
                    ]),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromRGBO(242, 243, 242, 1),
                    )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color.fromRGBO(242, 243, 242, 1),
                    )),
                    hintText: "Search here",
                  ),
                  style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(24, 23, 37, 1)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 116,
                width: 388,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Image.asset(
                  "assets/banner.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Exclusive Offer",
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See all",
                    style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.green),
                  )
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 2), color: Colors.white),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 100,
                                width: 130,
                                child: Image.asset(
                                  "assets/92f1ea7dcce3b5d06cd1b1418f9b9413 3.png",
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Organic Bananas",
                            style: GoogleFonts.dmSans(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "7pcs Priceg",
                            style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(24, 23, 37, 1)

                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Row(
                            children: [
                              Text(
                                "₹60.00",
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                          
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.green,
                          
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 34,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 2), color: Colors.white),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context){
                                    return const Description();
                                  })
                                );
                              },
                              child: Container(
                                  height: 100,
                                  width: 130,
                                  child: Image.asset(
                                    "assets/apple.jpg",
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Red Apple",
                            style: GoogleFonts.dmSans(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "1Kg, Priceg",
                            style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(24, 23, 37, 1)

                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Row(
                            children: [
                              Text(
                                "₹60.00",
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                          
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.green,
                          
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 34,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
             
              const SizedBox(height: 25,),
              
               Row(
                children: [
                  Text(
                    "Best Selling",
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See all",
                    style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.green),
                  )
                ],
              ),
              const SizedBox(height: 17,),
               Row(
                children: [
                  Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 2), color: Colors.white),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 100,
                                width: 130,
                                child: Image.asset(
                                  "assets/chilli.jpg",
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Bell Pepper Red",
                            style: GoogleFonts.dmSans(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "1Kg, Priceg",
                            style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(24, 23, 37, 1)

                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Row(
                            children: [
                              Text(
                                "₹60.00",
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                          
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.green,
                          
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 34,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 2), color: Colors.white),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 100,
                                width: 130,
                                child: Image.asset(
                                  "assets/ginger.jpg",
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Ginger",
                            style: GoogleFonts.dmSans(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "250gm, Priceg",
                            style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(24, 23, 37, 1)

                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Row(
                            children: [
                              Text(
                                "₹60.00",
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                          
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.green,
                          
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 34,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              
               const SizedBox(height: 25,),
              
               Row(
                children: [
                  Text(
                    "Groceries",
                    style: GoogleFonts.dmSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "See all",
                    style: GoogleFonts.dmSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.green),
                  )
                ],
              ),
              const SizedBox(height: 18,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 110,
                      width: 270,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                      //  color:const Color.fromRGBO(248, 164, 76, 1)
                      ),
                      child: Image.asset(
                        "assets/Pulses.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Container(
                    height: 110,
                    width: 270,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color:const Color.fromARGB(255, 169, 219, 187)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 72,
                          width: 71,
                          //clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            "assets/8-82858_download-sack-of-rice-png 1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                          
                        ),
                        Text(
                          "Rice",
                          style: GoogleFonts.dmSans(
                            fontSize: 26,
                            fontWeight: FontWeight.w600
                          ),
                        )

                      ],
                    ),
                    
                  ),
                  ],
                ),
              ),
              const SizedBox(height: 25,),
               Row(
                children: [
                  Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 2), color: Colors.white),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 100,
                                width: 130,
                                child: Image.asset(
                                  "assets/92f1ea7dcce3b5d06cd1b1418f9b9413 3.png",
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Organic Bananas",
                            style: GoogleFonts.dmSans(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "1Kg, Priceg",
                            style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(24, 23, 37, 1)

                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Row(
                            children: [
                              Text(
                                "₹60.00",
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                          
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.green,
                          
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 34,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(offset: Offset(0, 2), color: Colors.white),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 100,
                                width: 130,
                                child: Image.asset(
                                  "assets/pngfuel 5.png",
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Boiler Chicken",
                            style: GoogleFonts.dmSans(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "1Kg, Priceg",
                            style: GoogleFonts.dmSans(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(24, 23, 37, 1)

                            ),
                          ),
                        ),
                        const SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Row(
                            children: [
                              Text(
                                "₹60.00",
                                style: GoogleFonts.dmSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                          
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.green,
                          
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 34,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              
             

            ],
          ),
        )
      ],
    ),
    bottomNavigationBar:  BottomNavigationBar(
          items:  [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.house_siding_outlined,
                color: Color.fromARGB(255, 59, 226, 104),
                size: 29,
              ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return Explore();
                    })
                  );
                },
                child: const Icon(
                  Icons.manage_search_outlined,
                  color: Colors.black,
                  size: 29,
                ),
              ),
              label: 'Explore',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
                size: 29,
              ),
              label: 'cart',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
                size: 29,
              ),
              label: 'Favourite',
            ),
          ],
        )
  
  );
  }
}
