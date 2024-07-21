import 'package:flutter/material.dart';
import 'package:shopping_ui_flutter/colors.dart';
import 'package:shopping_ui_flutter/product_model.dart';
import 'package:shopping_ui_flutter/size.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Utk buttom
      backgroundColor: Colors.white,
      floatingActionButton: buyButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SizedBox(
        child: Column(children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 30),
            height: SizeConfig.screenHeight / 1.7,
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(product.image), fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 3,
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        constraints:
                            const BoxConstraints(minWidth: 10, maxWidth: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Colors.white,
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.arrow_back),
                      )),
                  Expanded(
                      child: Text(
                    "Detail",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                  Flexible(
                      flex: 3,
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        constraints: BoxConstraints(minWidth: 10, maxWidth: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Colors.white,
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.favorite_border),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              transform: Matrix4.translationValues(0, -30, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.verticalSize * 3.5,
                  ),
                  Text(
                    product.title,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                  ),
                  SizedBox(
                    height: SizeConfig.verticalSize * 2.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.price,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 25),
                      ),
                      SizedBox(
                        child: Row(children: [
                          RawMaterialButton(
                              onPressed: () {},
                              constraints: BoxConstraints(minWidth: 0),
                              fillColor: Colors.grey[200],
                              padding: EdgeInsets.all(5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.grey,
                              )),
                          Text(
                            "1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          RawMaterialButton(
                            onPressed: () {},
                            constraints: BoxConstraints(minWidth: 0),
                            fillColor: Colors.grey[200],
                            padding: EdgeInsets.all(5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.verticalSize * 3.5,
                  ),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 12, color: Colors.black38),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  ElevatedButton buyButtom() {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
        child: Text(
          "Buy Now",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ));
  }
}
