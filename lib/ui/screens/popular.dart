import 'package:flutter/material.dart';
import 'package:mns/ui/widgets/popular.dart';


class PopularScreen extends StatelessWidget {
  const PopularScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: CircleBorder(),
                  ),
                  child: Image.asset('assets/images/Vector.png'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Popular",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
             Container(
               width: 350,
                height: 800,
               child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 4,
                      crossAxisCount: 1,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 5
                    ),
                    itemCount: 5,
                    itemBuilder: (BuildContext ctx, index) {
                      return  Container(
                     
                      child: PopularWidget(
                        imageShape: Image.asset("assets/images/Rectangle 26.png"),
                        name: "Gia Borghini",
                        sup: "RHW Rosie 1 Sandals",
                        price: "740.00",
                      ));
                    }),
             ),
            
               
              ],
            ),
        
        ),
      
    );
  }
}
