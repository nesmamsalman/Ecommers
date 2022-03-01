import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget {
  PopularWidget({
    Key key,
     String name,
     String price,
     Widget imageShape,
     String sup,
  })  : _name = name,
        _price = price,
        _imageShape = imageShape,
        _sup = sup,
        super(key: key);
  final String _name;
  final String _price;
  final Widget _imageShape;
  String _sup;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 350,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFB6B7B7),
            offset: Offset(2, 2),
            blurRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: _imageShape,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    _name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  )),
                  SizedBox(height:5 ,),
                  Text(_sup, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black38),),
                ],
              ),
            ),
            Spacer(),
            Text("\$$_price" , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}
