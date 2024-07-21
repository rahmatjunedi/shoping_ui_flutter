import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_ui_flutter/category.dart';
import 'package:shopping_ui_flutter/colors.dart';
import 'package:shopping_ui_flutter/detail_product.dart';
import 'package:shopping_ui_flutter/product_model.dart';
import 'package:shopping_ui_flutter/size.dart';
import 'package:size_config/size_config.dart';
import 'package:flutter_config/flutter_config.dart';

class EccomerceHomeScreen extends StatefulWidget {
  const EccomerceHomeScreen({super.key});

  @override
  State<EccomerceHomeScreen> createState() => _EccomerceHomeScreenState();
}

class _EccomerceHomeScreenState extends State<EccomerceHomeScreen> {
  int selectedIndex = 0;

  List<List<Product>> selcetedCategory = [
    chairs,
    sofas,
    cupboards,
    table,
    wardrobe
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // 5. list of category item

    //1.  membuat gambar bagian atas kiri
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 2),
          child: RawMaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              constraints: BoxConstraints(minWidth: 8),
              fillColor: Colors.white,
              onPressed: () {},
              child: SvgPicture.asset(
                "images/menu-alt-02-svgrepo-com.svg",
                width: 30,
              )),
        ),
      ),
      // 2. membuat judul
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              "Discover your bast Furniture",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          // 3. text field search
          Padding(
              padding: EdgeInsets.all(25),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    filled: true,
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    fillColor: Colors.grey[100]),
              ))

          // 4. category atiem
          ,
          selectCategory(),
          Padding(
            padding: EdgeInsets.all(25),
            child: Row(children: [
              Text(
                "Populer",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              Spacer(),
              Text(
                "View All",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w500, color: primary),
              )
            ]),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(selcetedCategory[selectedIndex].length,
                    (index) {
                  final product = selcetedCategory[selectedIndex][index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                    product: product,
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: (SizeConfig.screenWidth - 80) / 2,
                      height: SizeConfig.verticalSize * 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(product.image),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
// 6. utk gambar dan harga
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.title,
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      product.price,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                  bottom: 5,
                                  right: 10,
                                  child: RawMaterialButton(
                                    onPressed: () {},
                                    constraints: BoxConstraints(minWidth: 0),
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(5),
                                    fillColor: primary,
                                    child: Icon(Icons.add,
                                        size: 16, color: Colors.white),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })),
          )
        ],
      ),
    );
  }

  SizedBox selectCategory() {
    return SizedBox(
      height: SizeConfig.verticalSize * 7.5,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 20),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor:
                          selectedIndex == index ? primary : Colors.grey[200]),
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Text(
                    categoryList[index].title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:
                            selectedIndex == index ? Colors.white : textGray),
                  )),
            );
          }),
    );
  }
}
