import 'package:anup_oak_assignment/widgets/aftertext.dart';
import 'package:anup_oak_assignment/widgets/dishes.dart';
import 'package:anup_oak_assignment/widgets/foodcarousel.dart';
import 'package:anup_oak_assignment/widgets/fristtext.dart';
import 'package:anup_oak_assignment/widgets/platewidget.dart';
import 'package:anup_oak_assignment/widgets/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> photoUrls = [
    'assets/carousel1.png',
    'assets/carousel2.png',
  ];
  List<Widget> widgetList = [
    Stack(
      children: [
        Image.asset(
          'assets/carousel1.png', // Replace with your image URL
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Row(
            children: [
              Text(
                'Enjoy your first\norder, the taste of\nour delicious food!',
                style: GoogleFonts.lexend(
                    color: Colors.white,
                    fontSize: 16 // Adjust the font size proportionally
                    ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(1),
            dashPattern: [10, 10],
            color: Colors.grey,
            strokeWidth: 1,
            child: Container(
              width: 148,
              height: 43,
              child: Center(
                child: Text(
                  'FIRSTPLATE01',
                  style: GoogleFonts.lexend(
                      color: Color(0XFFF7E5B7),
                      fontSize: 13 // Adjust the font size proportionally
                      ),
                ),
              ),
            ),
          ),
        )
      ],
    ),
    Stack(
      children: [
        Image.asset(
          'assets/carousel2.png', // Replace with your image URL
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          bottom: 22,
          left: 22,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(1),
            dashPattern: [10, 10],
            color: Colors.grey,
            strokeWidth: 1,
            child: Container(
              width: 148,
              height: 43,
              child: Center(
                child: Text(
                  'FIRSTPLATE01',
                  style: GoogleFonts.lexend(
                      color: Color(0XFFF7E5B7),
                      fontSize: 13 // Adjust the font size proportionally
                      ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 22,
          left: 22,
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  text: 'Delicious food\n',
                  style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: 24 // Adjust the font size proportionally
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'for happy life',
                      style: GoogleFonts.lexend(
                          color: Colors.white,
                          fontSize: 20 // Adjust the font size proportionally
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Text(
                      "Hi, Monica!",
                      style: GoogleFonts.lexend(
                          color: Color(0xff6318AF),
                          fontSize: 22 // Adjust the font size proportionally
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Current location",
                          style: GoogleFonts.lexend(
                              color: Color(0xff7B7B7B),
                              fontSize:
                                  13 // Adjust the font size proportionally
                              ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff6318AF),
                            ),
                            Text(
                              "Hyderabad",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.lexend(
                                  color: Colors.black,
                                  fontSize:
                                      13 // Adjust the font size proportionally
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Icon(
                            Icons.play_circle_outline_rounded,
                            color: Color(0xff6318AF),
                            size: 35,
                          ),
                          Text(
                            "How it works?",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.lexend(
                                color: Colors.black,
                                fontSize:
                                    12 // Adjust the font size proportionally
                                ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 190,
                child: Stack(
                  children: [
                    PageView.builder(
                      itemCount: photoUrls.length,
                      controller: PageController(
                          viewportFraction:
                              0.94), // Adjust the viewportFraction
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: widgetList[index],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            hintText: 'Search food or events',
                            hintStyle: GoogleFonts.lexend(
                                fontWeight: FontWeight.w300,
                                color: Color(0xff7B7B7B),
                                fontSize:
                                    15 // Adjust the font size proportionally
                                ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.search,
                          color: Color(0xff7F1FE0),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Text(
                      "Start crafting",
                      style: GoogleFonts.lexend(
                          color: Color(0xff6318AF),
                          fontSize: 21 // Adjust the font size proportionally
                          ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 30),
                  child: Row(
                    children: [
                      DishesWidget(
                        width: 220,
                        height: 160,
                        image: 'assets/dish1.png',
                        title: 'Default Platters',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 220,
                        height: 160,
                        image: 'assets/dish2.png',
                        title: 'Craft Your Own',
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: 240,
                  child: Row(
                    children: [
                      PlateWidget(title: "Default menu 1"),
                      SizedBox(
                        width: 10,
                      ),
                      PlateWidget(title: "Default menu 2"),
                      SizedBox(
                        width: 10,
                      ),
                      PlateWidget(title: "Default menu 3"),
                      SizedBox(
                        width: 10,
                      ),
                      PlateWidget(title: "Default menu 4"),
                      SizedBox(
                        width: 10,
                      ),
                      PlateWidget(title: "Default menu 5"),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Row(
                  children: [
                    Text(
                      "Top Categories",
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 20 // Adjust the font size proportionally
                          ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      FoodCarousel(
                        ontap: () {},
                        image: 'assets/frankie.png',
                        title: 'Starters',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FoodCarousel(
                        ontap: () {},
                        image: 'assets/drink.png',
                        title: 'Drinks',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FoodCarousel(
                        ontap: () {},
                        image: 'assets/rice.png',
                        title: 'Rice',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FoodCarousel(
                        ontap: () {},
                        image: 'assets/curry.png',
                        title: 'Curry',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FoodCarousel(
                        ontap: () {},
                        image: 'assets/cake.png',
                        title: 'Desserts',
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FoodCarousel(
                        ontap: () {},
                        image: 'assets/hello.png',
                        title: 'Starters',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Starters",
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 20 // Adjust the font size proportionally
                          ),
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Text(
                        "More Starters",
                        style: GoogleFonts.lexend(
                            color: Color(0xff6318AF),
                            fontSize: 14 // Adjust the font size proportionally
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
                  child: Row(
                    children: [
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/grill chicken.png',
                        title: 'Grill Chicken',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/mushroom.png',
                        title: 'Mushroom Fry',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/pakoda.png',
                        title: 'Veggies Fry',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/mushroom.png',
                        title: 'Grill Chicken',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/mushroom.png',
                        title: 'Grill Chicken',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/mushroom.png',
                        title: 'Grill Chicken',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/mushroom.png',
                        title: 'Mushroom Fry',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Main Course",
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 20 // Adjust the font size proportionally
                          ),
                    ),
                    InkWell(
                      onTap: () => {},
                      child: Text(
                        "More Main Courses",
                        style: GoogleFonts.lexend(
                            color: Color(0xff6318AF),
                            fontSize: 14 // Adjust the font size proportionally
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
                  child: Row(
                    children: [
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/biryani.png',
                        title: 'Biryani',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/dough.png',
                        title: 'Bread',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/plain rice.png',
                        title: 'Plain Rice',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/mushroom.png',
                        title: 'Grill Chicken',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/mushroom.png',
                        title: 'Grill Chicken',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/mushroom.png',
                        title: 'Grill Chicken',
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DishesWidget(
                        width: 190,
                        height: 155,
                        image: 'assets/mushroom.png',
                        title: 'Mushroom Fry',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Services",
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 20 // Adjust the font size proportionally
                          ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Row(
                    children: [
                      services(
                        title: "Signature",
                        img: 'assets/prime1.png',
                        logo: "assets/s sign.png",
                        text1: "High Quality Disposable Cutlery",
                        text2: "Elegant Decorations & Table\nSettings",
                        text3: "Served by Waitstaff",
                        text4: "Best for Weddings, Corporate\nEvents etc",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      services(
                        title: "Value",
                        img: 'assets/prime2.png',
                        logo: "assets/v badge.png",
                        text1: "Disposable Cutlery",
                        text2: "Basic Decorations & Table\nSettings",
                        text3: "Served in Buffet Style",
                        text4: "Best for Birthdays, Family\nGathering etc",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      services(
                        title: "Luxury",
                        img: 'assets/prime3.png',
                        logo: "assets/l badge.png",
                        text1: "High Quality Disposable Cutlery",
                        text2: "Elegant Decorations & Table\nSettings",
                        text3: "Served by Professional Waitstaff",
                        text4:
                            "Best for Celebrity Parties,\nPolitical Events etc",
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "How does it work ?",
                      style: GoogleFonts.lexend(
                          color: Colors.black,
                          fontSize: 20 // Adjust the font size proportionally
                          ),
                    ),
                  ],
                ),
              ),
              aftertext(
                image: 'assets/work1.svg',
                title: "Customize Menu",
                text: "Select items for a single event or multiple events",
              ),
              firsttext(
                title: "Choose Services",
                text:
                    "Select the type of services from varying cutlery, mode of serving options, & more",
                image: 'assets/work2.svg',
              ),
              aftertext(
                image: 'assets/work3.svg',
                title: "Dynamic Pricing",
                text:
                    "Price per plate varies with no. of items in a plate and no. of plates selected",
              ),
              firsttext(
                title: "Track Your Order",
                text:
                    "Track the order status and seek help from the executives anytime",
                image: 'assets/work4.svg',
              ),
              aftertext(
                image: 'assets/work5.svg',
                title: "Taste Your Samples",
                text:
                    "Explode your taste bud with samples of what you order(on request for eligible orders)",
              ),
              firsttext(
                title: "Enjoy Food and Services",
                text: "Enjoy event with delicious and customized food  ",
                image: 'assets/work6.svg',
              ),
              Container(
                color: Color.fromARGB(26, 136, 135, 135),
                height: 150,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Delicious food with professional service !",
                        style: GoogleFonts.lexend(
                            color: Colors.black,
                            fontSize: 25 // Adjust the font size proportionally
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
