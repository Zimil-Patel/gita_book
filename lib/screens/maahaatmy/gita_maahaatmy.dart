import 'package:flutter/material.dart';
import 'package:gita_book/util/colors/resuable_properties.dart';
import 'package:gita_book/util/colors/theme_colors.dart';
import 'package:gita_book/util/gita_data.dart';

class Maahaatmy extends StatefulWidget {
  const Maahaatmy({super.key});

  @override
  State<Maahaatmy> createState() => _MaahaatmyState();
}

late double height, width;

class _MaahaatmyState extends State<Maahaatmy> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          //background image of body
          bgImgContainer(),

          //titles
          addColumn(),
        ],
      ),
    );
  }

  //background image of body
  bgImgContainer() {
    return Container(
      height: 400,
      color: bg,
      child: Image.asset(
        'asset/images/appBG.png',
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }

//gita text and titles
  addColumn() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //gita text image
          SizedBox(
            height: height / 3.5,
            child: Image.asset(
              'asset/images/text.png',
              height: 130,
              width: 130,
            ),
          ),

          //all titles
          Container(
            width: width,
            margin: const EdgeInsets.only(bottom: 80),
            decoration: BoxDecoration(
              color: offWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12),
              child: Column(
                  //list of title box using list.generate
                  children: [
                    Container(
                      width: width,
                      decoration: containerDeoration(),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 12),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      data[2]['index'],
                                      style: TextStyle(
                                        fontSize: height / 40,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    addText(),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //copy and share button
                          addCpyShareBtn(),
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  //udf text
  addText() {
    return Text(
      data[2]['maahaatmy'],
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: height / 40,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }

  addCpyShareBtn() {
    return Container(
      height: 10,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
        color: Color(0xff2e2e2e),
      ),
      width: width,
    );
  }
}
