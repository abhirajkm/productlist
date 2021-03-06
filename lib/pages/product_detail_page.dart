import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shopping_cart/colors.dart';

class ProductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String code;
  final String img;
  final String price;
  final String promotionPrice;


  const ProductDetailPage({Key key, this.id, this.name, this.code, this.img, this.price, this.promotionPrice}) : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSize = 0;
  int activeColor = 0;
  String activeImg = '';
  int qty = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeImg = widget.img;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }
  Widget getBottom(){
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      child: FlatButton(
        color: primary,
        onPressed: (){
        // your add cart here
      }, child: Text("ADD TO CART",style: TextStyle(
        fontSize: 18,
        color: white
      ),)),
    );
  }
  Widget getBody(){
    return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: ListView(
        children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                            child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.arrow_back_ios)),
              ),
            ),
            SizedBox(height: 10,),
            Card(
              elevation: 2,
                        child: Hero(
                          tag: widget.id.toString(),
                                                child: Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(image: new AssetImage(activeImg),fit: BoxFit.cover)
                ),
              ),
                        ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Name :",style: TextStyle(
                    fontSize: 16,
                    height: 1.5
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                                  child: Text(widget.name,style: TextStyle(
                      fontSize: 16,
                      height: 1.5
                    ),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Code :",style: TextStyle(
                    fontSize: 16,
                    height: 1.5
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                                  child: Text(widget.code,style: TextStyle(
                      fontSize: 16,
                      height: 1.5
                    ),),
                  ),
                ],
              ),
            ),
             SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Price :",style: TextStyle(
                    fontSize: 16,
                    height: 1.5
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                                  child: Row(children: <Widget>[
                                    Text("??? " + widget.promotionPrice,style: TextStyle(
                                      fontSize: 16,height: 1.5
                                    ),),
                                    SizedBox(width: 20,),
                                    Text("??? " +widget.price,style: TextStyle(
                                      fontSize: 20,height: 1.5,
                                      color: primary,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.lineThrough
                                    ),)
                                  ],)
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Size :",style: TextStyle(
                    fontSize: 16,
                    height: 1.5
                  ),),
                  SizedBox(width: 20,),

                ],
              ),
            ),


            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Qty :",style: TextStyle(
                    fontSize: 16,
                    height: 1.5
                  ),),
                  SizedBox(width: 20,),
                  Flexible(
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              if(qty > 1){
                                setState(() {
                                  qty = --qty;
                                });
                              }
                            },
                                                    child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: black.withOpacity(0.5)
                                )
                              ),
                              width: 35,
                              height: 35,
                              child: Icon(LineIcons.minus,color: black.withOpacity(0.5),),
                            ),
                          ),
                          SizedBox(width: 25,),
                          Text(qty.toString(),style: TextStyle(
                            fontSize: 16
                          ),),
                          SizedBox(width: 25,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                  qty = ++qty;
                                });
                            },
                                                    child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: black.withOpacity(0.5)
                                )
                              ),
                              width: 35,
                              height: 35,
                              child: Icon(LineIcons.plus,color: black.withOpacity(0.5),),
                            ),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
        ],
      ),
          ),
    );
  }
}