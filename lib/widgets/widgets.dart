import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



Widget topBarTile(String title, bool selected) {
  return selected == true
      ? Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Container(
                height: 25,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  border: Border.all(color: Color(0x007540EE), style: BorderStyle.solid),
                ),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(color: Color(0xff7540EE), fontSize: 15),
                  ),
                ),
              ),
              listTileHorizontalLine(2),
            ],
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Container(
                height: 25,
                width: 120,
                decoration: BoxDecoration(
                  // color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  border: Border.all(color: Color(0xff7540EE), style: BorderStyle.solid),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: Color(0xff7540EE), fontSize: 15),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left : 4.0),
                        child: Image.asset("assets/images/key.png",width: 8, height: 9 ,),
                      ),
                    ],
                  ),
                ),
              ),
              listTileHorizontalLine(0),
            ],
          ),
        );
}

Widget listTileHorizontalLine(double height){
  return Container(
    width: 100,
    height: height,
    decoration: BoxDecoration(
      color: Color(0xff7540EE),
    ),

  );
}

Widget periodSelectorTile(String title, bool selected) {
  return selected == true
      ? Padding(
    padding: const EdgeInsets.all(4.0),
    child: Column(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            border: Border.all(color: Colors.red, style: BorderStyle.solid),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 11 ),
            ),
          ),
        ),
        // listTileHorizontalLine(2),
      ],
    ),
  )
      : Padding(
    padding: const EdgeInsets.all(4.0),
    child: Column(
      children: [
        Container(
          height: 30,
          width: 30,
          // decoration: BoxDecoration(
          //   // color: Colors.purple,
          //   borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(15),
          //     topRight: Radius.circular(15),
          //     bottomRight: Radius.circular(15),
          //     bottomLeft: Radius.circular(15),
          //   ),
          //   border: Border.all(color: Colors.purple, style: BorderStyle.solid),
          // ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.grey[400], fontSize: 11),
            ),
          ),
        ),
        // listTileHorizontalLine(0),
      ],
    ),
  );
}

Widget aboutListTile(BuildContext context, text1, text2, bool isUrl){
  return Padding(
    padding: const EdgeInsets.only(left:16 , top: 13.0, right: 13, bottom: 13),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width : MediaQuery.of(context).size.width * 0.45,
                child: Text(text1,textAlign: TextAlign.left, style: TextStyle(fontSize: 15,color: Color(0xff757575)),)),
            Container(
                width : MediaQuery.of(context).size.width * 0.45,
                child: Text(text2,textAlign: TextAlign.right, style: TextStyle(fontSize: 15,color: isUrl ? Color(0xff7540EE) : Color(0xff000000)),)),
          ],
        ),


      ],
    ),
  );
}

Widget aboutListTileDivider(){
  return Container(
    height: 1,
    decoration: BoxDecoration(
      color: Colors.grey[400],
    ),

  );
}

Widget tags(String title) {
  return Padding(
    padding: const EdgeInsets.only(right : 10.0),
    child: Column(
      children: [
        Container(
          height: 25,
          width: 104,
          decoration: BoxDecoration(
            color: Color(0xffE3D9FC),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            border: Border.all(color: Color(0x007540EE), style: BorderStyle.solid),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Color(0xff7540EE), fontSize: 13),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget newsTile(String title, String bodyText, String date, String param1, String param2) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 3,
      child: Container(
        height: 241,
        width: 194,
        child: Column(
          children: [

            // title
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                // height: 20,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left : 19.0, top: 16),
                      child: Container(width : 108 , height: 32,child: Text(title,style: TextStyle(fontSize: 14, color: Color(0xff8C8C8C), ))),
                    ),
                    SizedBox(width: 38,),
                    FaIcon(FontAwesomeIcons.caretUp,size: 20,color: Colors.green,)
                  ],
                ),
              ),
            ),

            // body
            Padding(
              padding: const EdgeInsets.only(left : 18.0, top :16, right:13),
              child: Container(
                height: 84,
                child: Text(bodyText, textAlign: TextAlign.start, style: TextStyle(fontSize: 17 , color: Color(0xff000000), fontWeight: FontWeight.bold),),
              ),
            ),

            // bottom
            Padding(
              padding: const EdgeInsets.only(left : 18.0, top :16, right:13),
              child: Container(
                // height: 20,
                child: Row(
                  children: [
                    Text(date, style: TextStyle(fontSize: 10, color: Color(0xff757575)),)
                  ],
                ),
              ),
            ),

            // horizontal line
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                // width: 200,
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xffE4E4E4),
                ),
              ),
            ),

            // footer info
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left : 16.0, top :8, right:13, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(param1, style: TextStyle(fontSize : 12, color: Color(0xffE54B6C)),),
                    SizedBox(width: 15,),
                    Text(param2, style: TextStyle(fontSize : 12, color: Color(0xff32BEB3)),)
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    ),
  );
}


Widget competitorsTile(String title, String subtitle, String amount, String status, String parameter, String logoSrc, String signSrc) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 3,
      child: Container(
        height: 173,
        width: 152,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(title, style: TextStyle(fontSize: 20, color: Color(0xff1A1A1A))),
                            Text(subtitle,style: TextStyle(fontSize: 9.5, color: Color(0xff757575))),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/$logoSrc.png",width: 35, height: 35 ,)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 68,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(amount,style: TextStyle(fontSize: 17, color: Color(0xff1A1A1A))),

                                signSrc != null
                                    ? Image.asset("assets/images/sign_$signSrc.png",width: 31.5, height: 31.5 ,)
                                    : Container()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(status,style: TextStyle(fontSize: 12, color: Color(0xff32BEB3))),
                              ],
                            ),
                          ],
                        ),
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //
                        //
                        //   ],
                        // ),
                      ],
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

