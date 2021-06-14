import 'package:clubmate/color_styles.dart';
import 'package:clubmate/components/activity_list_tile.dart';
import 'package:flutter/material.dart';

class YourActivityListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _YourActivityListScreenState();
}

class _YourActivityListScreenState extends State<YourActivityListScreen> {
  String dropdownValue;
  String dropdownValue2;
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              width: 180,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorStyles.white),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: ColorStyles.white,
                                ),
                                isExpanded: true,
                                iconSize: 40,
                                elevation: 16,
                                style: const TextStyle(
                                    color: ColorStyles.white, fontSize: 20),
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                dropdownColor: ColorStyles.black,
                                hint: Text("Lựa chọn",
                                    style: TextStyle(color: ColorStyles.white)),
                                items: <String>[
                                  'Học Thuật',
                                  'Tình Nguyện',
                                  'Chính trị',
                                  'Âm nhạc',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(child: Text(value)),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              decoration: BoxDecoration(
                                color: ColorStyles.orange,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text("Thể loại",
                                  style: TextStyle(
                                      color: ColorStyles.white, fontSize: 15)),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              width: 180,
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorStyles.white),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: DropdownButton<String>(
                                value: dropdownValue2,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: ColorStyles.white,
                                ),
                                isExpanded: true,
                                iconSize: 40,
                                elevation: 16,
                                style: const TextStyle(
                                    color: ColorStyles.white, fontSize: 20),
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue2 = newValue;
                                  });
                                },
                                dropdownColor: ColorStyles.black,
                                hint: Text("Lựa chọn",
                                    style: TextStyle(color: ColorStyles.white)),
                                items: <String>[
                                  'Tháng này',
                                  'Tháng trước'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(child: Text(value)),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              decoration: BoxDecoration(
                                color: ColorStyles.orange,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text("Thời gian",
                                  style: TextStyle(
                                      color: ColorStyles.white, fontSize: 15)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) => ActivityListTile(
                          imageURL:
                              'https://cdn.icon-icons.com/icons2/2248/PNG/512/cat_icon_138789.png',
                          clubImageURL:
                              'https://cdn.icon-icons.com/icons2/2248/PNG/512/cat_icon_138789.png',
                          description: 'description',
                          name: 'name'),
                      itemCount: 3,
                    ))
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
