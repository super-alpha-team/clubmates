import 'package:clubmate/apis/club_api.dart';
import 'package:clubmate/models/club.dart';
import 'package:clubmate/screens/club/club_screen.dart';
import 'package:flutter/material.dart';
import '../../color_styles.dart';
import 'package:clubmate/components/notification_button.dart';
import 'package:clubmate/components/activity_list_tile.dart';
import 'package:clubmate/components/club_list_tile.dart';
import 'package:clubmate/screens/home/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final clubAPI = ClubAPI.instance;
  List<Club> allClubs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllClubs();
  }

  void getAllClubs() async {
    allClubs = await clubAPI.all();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: ColorStyles.orange,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: ColorStyles.white,
                size: 30,
              ),
              onPressed: () => print('back'),
            ),
          ),
          actions: [NotificationButton(num: 1)],
        ),
        body: SafeArea(
          child: TabBarView(children: [
            SingleChildScrollView(
              child: Column(children: [
                _header(),
                _activityList(),
              ]),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  _header(),
                  _clubList(),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        Container(
          child: Image(
            image: NetworkImage(
                'https://www.geeklawblog.com/wp-content/uploads/sites/528/2018/12/liprofile-656x369.png'),
            fit: BoxFit.contain,
          ),
        ),
        TabBar(
          tabs: [
            Tab(
              child: Text(
                'Hoạt động',
                style: TextStyle(
                  color: ColorStyles.darkOrange,
                  fontSize: 24,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Câu lạc bộ',
                style: TextStyle(
                  color: ColorStyles.darkOrange,
                  fontSize: 24,
                ),
              ),
            ),
          ],
          indicatorColor: ColorStyles.darkOrange,
        ),
      ],
    );
  }

  void clubDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ClubScreen(),
      ),
    );
  }

  Widget _clubList() {
    return Column(
      children: allClubs
          .map(
            (club) => GestureDetector(
              onTap: clubDetail,
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: ClubListTile(
                  imageURL: club.photo,
                  description: club.description,
                  name: club.name,
                  color: ColorStyles.fromCategory(club.category),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _activityList() {
    return Column(
      children: [
        ActivityListTile(
          imageURL:
              'https://ntt.edu.vn/web/upload/images/Tin_Tuc/NAM%202020/202001_TIN/NTTU%20-%20Xuan%20tinh%20nguyen%20_%20cover.jpg',
          clubImageURL:
              'https://upload.wikimedia.org/wikipedia/vi/4/42/Huy_hi%E1%BB%87u_H%E1%BB%99i_sinh_vi%C3%AAn_Vi%E1%BB%87t_Nam.png',
          description:
              'Đó là sự kết nối của sinh viên - người dân, bởi những việc làm mang tính xã hội, một phần giúp người dân ý thức hơn trong việc bảo vệ môi trường',
          name: 'Xuân Tình Nguyện',
          color: ColorStyles.darkPurple,
        ),
        ActivityListTile(
          imageURL:
              'https://avatar-ex-swe.nixcdn.com/playlist/2014/07/07/f/f/6/7/1404716760173_500.jpg',
          clubImageURL:
              'https://upload.wikimedia.org/wikipedia/vi/4/42/Huy_hi%E1%BB%87u_H%E1%BB%99i_sinh_vi%C3%AAn_Vi%E1%BB%87t_Nam.png',
          description:
              'Hòa chung không khí đoàn viên, thanh niên cả nước chung tay xây dựng các công trình ,phần việc hướng đến Kỷ niệm 20 năm các chiến dịch thanh niên tình nguyện hè toàn quốc.',
          name: 'Mùa hè xanh',
          color: ColorStyles.lightOrange,
        ),
        ActivityListTile(
          imageURL:
              'https://ntt.edu.vn/web/upload/images/Tin_Tuc/NAM%202020/202001_TIN/NTTU%20-%20Xuan%20tinh%20nguyen%20_%20cover.jpg',
          clubImageURL:
              'https://upload.wikimedia.org/wikipedia/vi/4/42/Huy_hi%E1%BB%87u_H%E1%BB%99i_sinh_vi%C3%AAn_Vi%E1%BB%87t_Nam.png',
          description:
              'Đó là sự kết nối của sinh viên - người dân, bởi những việc làm mang tính xã hội, một phần giúp người dân ý thức hơn trong việc bảo vệ môi trường',
          name: 'Xuân Tình Nguyện',
          color: ColorStyles.darkPurple,
        ),
        ActivityListTile(
          imageURL:
              'https://avatar-ex-swe.nixcdn.com/playlist/2014/07/07/f/f/6/7/1404716760173_500.jpg',
          clubImageURL:
              'https://upload.wikimedia.org/wikipedia/vi/4/42/Huy_hi%E1%BB%87u_H%E1%BB%99i_sinh_vi%C3%AAn_Vi%E1%BB%87t_Nam.png',
          description:
              'Hòa chung không khí đoàn viên, thanh niên cả nước chung tay xây dựng các công trình ,phần việc hướng đến Kỷ niệm 20 năm các chiến dịch thanh niên tình nguyện hè toàn quốc.',
          name: 'Mùa hè xanh',
          color: ColorStyles.lightOrange,
        )
      ],
    );
  }
}
