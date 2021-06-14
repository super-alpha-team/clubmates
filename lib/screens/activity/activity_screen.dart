import 'package:clubmate/color_styles.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  String dropdownValue = 'Học Thuật';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 30),
            child: InkWell(
              child: Wrap(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 35,
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: ColorStyles.darkBlue,
                          size: 30,
                        ),
                      ),
                      Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorStyles.darkBlue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "10",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                ),
              ]),
              onTap: () {},
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Text(
                "Hoạt động của tôi",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: ColorStyles.darkOrange),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 6,
                        offset: Offset(2, 7), // changes position of shadow
                      ),
                    ],
                    color: ColorStyles.darkBlue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng hoạt động trong tháng",
                        style: TextStyle(
                            color: ColorStyles.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                            color: ColorStyles.lightPurple,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                padding:
                    EdgeInsets.only(top: 40, right: 20, left: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: ColorStyles.orange,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Sắp xếp theo",
                          style: TextStyle(
                              color: ColorStyles.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 200,
                          color: ColorStyles.lightBlue,
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            iconSize: 40,
                            elevation: 16,
                            style: const TextStyle(
                                color: ColorStyles.black, fontSize: 23),
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>[
                              'Học Thuật',
                              'Tình Nguyện',
                              'Chính trị',
                              'Âm nhạc'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(child: Text(value)),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
