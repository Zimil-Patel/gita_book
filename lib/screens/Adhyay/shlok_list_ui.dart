import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gita_book/util/colors/resuable_properties.dart';
import 'package:gita_book/util/colors/theme_colors.dart';
import 'package:gita_book/util/gita_data.dart';

class ShlokList extends StatefulWidget {
  const ShlokList({super.key});

  @override
  State<ShlokList> createState() => _ShlokListState();
}

late double height, width;
int chapterIndex = 0;

class _ShlokListState extends State<ShlokList> {
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
                children: List.generate(
                    data[0]['chapters'][chapterIndex]['shloks'].length,
                    (index) => titleBox(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //title box
  titleBox(int index) {
    return Container(
      width: width,
      decoration: containerDeoration(),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 12),
            child: Column(
              children: [
                index == 0
                    ? Column(
                        children: [
                          Text(
                            data[0]['chapters'][chapterIndex]['id'],
                            style: TextStyle(
                              fontSize: height / 50,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            data[0]['chapters'][chapterIndex]['name'],
                            style: TextStyle(
                              fontSize: height / 35,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                        ],
                      )
                    : const SizedBox(),

                //shlok
                addText(index: index, key: 'shlok'),

                //divider
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(
                    indent: 10,
                    endIndent: 10,
                    color: dividerColor,
                  ),
                ),

                //meaning of shlok
                addText(index: index, key: 'meaning'),
              ],
            ),
          ),

          //copy and share button
          addCpyShareBtn(index, 'shlok', 'meaning'),
        ],
      ),
    );
  }

  //udf text
  addText({required int index, required String key}) {
    return Text(
      data[0]['chapters'][chapterIndex]['shloks'][index][key],
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: height / 34,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }

  addCpyShareBtn(int index, String key1, String key2) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(6),
          bottomRight: Radius.circular(6),
        ),
        color: Color(0xff2e2e2e),
      ),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          textBtn(btnName: 'COPY', index: index, key1: key1, key2: key2),
          const SizedBox(
            width: 50,
          ),
          textBtn(btnName: 'SHARE'),
        ],
      ),
    );
  }

  textBtn({required String btnName,int? index, String? key1, String? key2}) {
    return CupertinoButton(
      onPressed: () {
        if (btnName == 'COPY') {
          // Fluttertoast.showToast(
          //     msg: 'Copied!',
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.white,
          //     textColor: Colors.black,
          //     fontSize: 16.0);

          Clipboard.setData(ClipboardData(text: '${data[0]['chapters'][chapterIndex]['shloks'][index][key1]} \n ${data[0]['chapters'][chapterIndex]['shloks'][index][key2]}'),);

          const snackBar = SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              'Copied!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Text(
        btnName,
        style: TextStyle(
          fontSize: height / 45,
          fontWeight: FontWeight.bold,
          color: const Color(0xfffeb211),
        ),
      ),
    );
  }
}
