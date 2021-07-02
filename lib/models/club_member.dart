
import 'package:clubmate/models/club.dart';

class ClubMember {
  String role;
  String memberId;
  Club club;

  ClubMember.fromJson(json) {
    role = json['role'];
    memberId = json['_id'];
    club = Club.fromJson(json['club']);
  }
}