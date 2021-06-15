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
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       leading: IconButton(
    //         icon: Icon(
    //           Icons.search,
    //           color: ColorStyles.darkOrange,
    //           size: 30,
    //         ),
    //         onPressed: () => print('back'),
    //       ),
    //       backgroundColor: Colors.transparent,
    //       elevation: 0.0,
    //       actions: [NotificationButton(num: 1)],
    //       flexibleSpace: Image.asset('assets/Home/home.png'),
    //       //title: Text('try it'),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             child: Text(
    //               'Hoạt động',
    //               style: TextStyle(color: ColorStyles.darkOrange),
    //             ),
    //           ),
    //           Tab(
    //             child: Text(
    //               'Câu lạc bộ',
    //               style: TextStyle(color: ColorStyles.darkOrange),
    //             ),
    //           )
    //         ],
    //         indicatorColor: ColorStyles.darkOrange,
    //       ),
    //     ),
    //     body: TabBarView(children: [
    //       SingleChildScrollView(
    //         child: Column(children: [
    //           ActivityListTile(
    //             imageURL:
    //                 'https://ntt.edu.vn/web/upload/images/Tin_Tuc/NAM%202020/202001_TIN/NTTU%20-%20Xuan%20tinh%20nguyen%20_%20cover.jpg',
    //             clubImageURL:
    //                 'https://upload.wikimedia.org/wikipedia/vi/4/42/Huy_hi%E1%BB%87u_H%E1%BB%99i_sinh_vi%C3%AAn_Vi%E1%BB%87t_Nam.png',
    //             description:
    //                 'Đó là sự kết nối của sinh viên - người dân, bởi những việc làm mang tính xã hội, một phần giúp người dân ý thức hơn trong việc bảo vệ môi trường',
    //             name: 'Xuân Tình Nguyện',
    //             color: ColorStyles.darkPurple,
    //           ),
    //           ActivityListTile(
    //             imageURL:
    //                 'https://avatar-ex-swe.nixcdn.com/playlist/2014/07/07/f/f/6/7/1404716760173_500.jpg',
    //             clubImageURL:
    //                 'https://upload.wikimedia.org/wikipedia/vi/4/42/Huy_hi%E1%BB%87u_H%E1%BB%99i_sinh_vi%C3%AAn_Vi%E1%BB%87t_Nam.png',
    //             description:
    //                 'Hòa chung không khí đoàn viên, thanh niên cả nước chung tay xây dựng các công trình ,phần việc hướng đến Kỷ niệm 20 năm các chiến dịch thanh niên tình nguyện hè toàn quốc.',
    //             name: 'Mùa hè xanh',
    //             color: ColorStyles.lightOrange,
    //           ),
    //           ActivityListTile(
    //             imageURL:
    //                 'https://ntt.edu.vn/web/upload/images/Tin_Tuc/NAM%202020/202001_TIN/NTTU%20-%20Xuan%20tinh%20nguyen%20_%20cover.jpg',
    //             clubImageURL:
    //                 'https://upload.wikimedia.org/wikipedia/vi/4/42/Huy_hi%E1%BB%87u_H%E1%BB%99i_sinh_vi%C3%AAn_Vi%E1%BB%87t_Nam.png',
    //             description:
    //                 'Đó là sự kết nối của sinh viên - người dân, bởi những việc làm mang tính xã hội, một phần giúp người dân ý thức hơn trong việc bảo vệ môi trường',
    //             name: 'Xuân Tình Nguyện',
    //             color: ColorStyles.darkPurple,
    //           ),
    //           ActivityListTile(
    //             imageURL:
    //                 'https://avatar-ex-swe.nixcdn.com/playlist/2014/07/07/f/f/6/7/1404716760173_500.jpg',
    //             clubImageURL:
    //                 'https://upload.wikimedia.org/wikipedia/vi/4/42/Huy_hi%E1%BB%87u_H%E1%BB%99i_sinh_vi%C3%AAn_Vi%E1%BB%87t_Nam.png',
    //             description:
    //                 'Hòa chung không khí đoàn viên, thanh niên cả nước chung tay xây dựng các công trình ,phần việc hướng đến Kỷ niệm 20 năm các chiến dịch thanh niên tình nguyện hè toàn quốc.',
    //             name: 'Mùa hè xanh',
    //             color: ColorStyles.lightOrange,
    //           )
    //         ]),
    //       ),
    //       SingleChildScrollView(
    //         child: Column(
    //           children: [
    //             ClubListTile(
    //               imageURL:
    //                   'https://upload.wikimedia.org/wikipedia/vi/archive/4/42/20210321041901%21Huy_hi%E1%BB%87u_H%E1%BB%99i_sinh_vi%C3%AAn_Vi%E1%BB%87t_Nam.png',
    //               description:
    //                   'Hội sinh viên Việt Nam là một tổ chức xã hội dành cho lứa tuổi thanh niên sinh viên Việt Nam, hoạt động song song cùng Hội Liên hiệp Thanh niên Việt Nam, với Đoàn Thanh niên Cộng sản Hồ Chí Minh là nòng cốt chính trị.',
    //               name: 'Hội sinh viên',
    //               type: 'Hội sinh viên trường KHTN',
    //             ),
    //           ],
    //         ),
    //       ),
    //     ]),
    //   ),
    // );

    return (SearchScreen());
  }
}
