import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gita_book/screens/Adhyay/shlok_list_ui.dart';
import 'package:gita_book/util/colors/resuable_properties.dart';
import 'package:gita_book/util/colors/theme_colors.dart';
import 'package:gita_book/util/gita_data.dart';

class ChaptersList extends StatefulWidget {
  const ChaptersList({super.key});

  @override
  State<ChaptersList> createState() => _ChaptersListState();
}

late double height, width;

class _ChaptersListState extends State<ChaptersList> {
  int count = 0;

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
            margin: const EdgeInsets.only(left: 24, right: 24, bottom: 26),
            width: width,
            decoration: BoxDecoration(
              color: offWhite,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 26.0, horizontal: 16),
              child: Column(
                //list of title box using list.generate
                children: List.generate(
                    data[0]['chapters'].length, (index) => titleBox(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //title box
  titleBox(int index) {
    if (count == 6) {
      count = 0;
    }
    count++;
    return CupertinoButton(
      onPressed: () {
        chapterIndex = index;
        Navigator.pushNamed(context, '/shloks');
      },
      pressedOpacity: 0.8,
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: containerDeoration(),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Row(
          children: [
            Image.asset(
              'asset/images/icon$count.png',
              height: height / 12,
              width: 80,
            ),
            Container(
              height: height / 12,
              width: 1,
              color: dividerColor,
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data[0]['chapters'][index]['id'],
                      style: TextStyle(
                        fontSize: height / 50,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      data[0]['chapters'][index]['name'],
                      style: TextStyle(
                        fontSize: height / 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
