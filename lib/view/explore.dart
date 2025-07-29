import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/view/homescreen.dart';
import 'package:grocery_app/view/product.dart';



class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> categories = [
    {"title": "Fresh Fruits & Vegetable", "image": "assets/fruits.png"},
    {"title": "Cooking Oil & Ghee", "image": "assets/oil.png"},
    {"title": "Meat & Fish", "image": "assets/meat.png"},
    {"title": "Bakery & Snacks", "image": "assets/bakery.png"},
    {"title": "Dairy & Eggs", "image": "assets/dairy.png"},
    {"title": "Beverages", "image": "assets/beverages.png"},
  ];

  List mycolors=[
    const Color.fromRGBO(83, 177, 117, 0.1),
    const Color.fromRGBO(248, 164, 76, 0.1),
    const Color.fromRGBO(247, 165, 147, 0.1),
    const Color.fromRGBO(211, 176, 224, 0.25),
    const Color.fromRGBO(253, 229, 152, 0.25),
    const Color.fromRGBO(183, 223, 245, 0.25),



  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Find Products",
                  style: GoogleFonts.dmSans(
                      fontSize: 20, fontWeight: FontWeight.w700),
                )
              ],
            ),
            const SizedBox(
              height: 10,
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
                  hintText: "Search Store",
                ),
                style: GoogleFonts.dmSans(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(24, 23, 37, 1)),
              ),
            ),
            
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                   
                    onTap: (){
                      if(index==6 || categories[index]["title"]=="Beverages"){
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return ProductScreen();
                          })
                        );
                      }
                    },
                    child: Container(
                      
                      decoration: BoxDecoration(
                        
                        color: mycolors[index],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: mycolors[index],
                          style: BorderStyle.solid,
                          width: 5
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 2)
                        ],
                      
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(categories[index]["image"]!, height: 80),
                          const SizedBox(height: 30),
                          Text(
                            categories[index]["title"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
          bottomNavigationBar:  BottomNavigationBar(
          items:  [
             BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context){
                      return HomeScreen();
                    })
                  );
                },
                child:const Icon(
                  Icons.house_siding_outlined,
                  color: Colors.black,
                  size: 29,
                  
                ),
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
                  color: Color.fromARGB(255, 59, 226, 104),
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
