import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skin_scan/ingredient_scan_feature/ingredient_list.dart';
import 'package:skin_scan/provider/user_provider.dart';
import '../entities/scanned_product_entities.dart';
import '../main.dart';
import '../product_categories_feature/product_detail.dart';
import '../utilities/utility.dart';


class ScannedProducts extends StatefulWidget {
  const ScannedProducts({Key? key}) : super(key: key);

  @override
  _ScannedProductsState createState() => _ScannedProductsState();
}

class _ScannedProductsState extends State<ScannedProducts> {
  List <ScannedProduct> products = [];
  @override
  Widget build(BuildContext context) {
    products = context.read<UserProvider>().ScannedProductlist;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDF4),
      appBar: AppBarDetails(screenName: "Scanned Products"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: displayHeight(context) * 0.02),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => IngredientsList(IngredientList: products[index].ingredientList)));
                      },
                      child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDADBC6),
                            borderRadius:
                            BorderRadius.circular(20), //border corner radius
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: Image(
                                      image: AssetImage('assets/Favourite.png'),
                                      fit: BoxFit.fill,
                                      height: displayHeight(context) * 0.085,
                                      width: displayWidth(context) * 0.085),
                                  minRadius: 35,
                                  backgroundColor: Color(0xffC4C4C4),
                                ),
                                ReemKufi_Green(textValue: products[index].productName, size: displayHeight(context)*0.0225),
                                Container(
                                  height: displayHeight(context)*0.07,
                                  width: displayWidth(context)*0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xffC4C4C4),
                                    border: Border.all(
                                      color: Color(0xffC4C4C4),  // red as border color
                                    ),
                                  ),
                                  child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          child: ReemKufi_Green(textValue: "14", size: displayHeight(context) * 0.0225),
                                          height: displayHeight(context)*0.03,),
                                        Expanded(
                                            child: Divider(
                                              color: Colors.black,
                                            )
                                        ),
                                        SizedBox(child: ReemKufi_Green(textValue: "Feb", size: displayHeight(context) * 0.02),
                                          height: displayHeight(context)*0.03,)
                                      ]),
                                )
                              ],
                            ),
                          )),
                    );
                  }),
            ),
          ],
        ),
      ),
      //bottomNavigationBar: BottomBar(),
    );
  }
}