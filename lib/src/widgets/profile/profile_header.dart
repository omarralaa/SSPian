import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sspian/src/providers/profile.dart';
import 'package:sspian/src/utils/factory_utils.dart';

class ProfileHeader extends StatelessWidget {
  final FactoryUtils factoryUtils = FactoryUtils();

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context).profile;
    return Column(
      children: [
        _buildAvatar(profile),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            profile.firstName + " " + profile.lastName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "ID: " + profile.sspId + " - " + profile.department,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 16.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7, top: 3),
                child: Icon(
                  factoryUtils.getIconByDepartment(profile.department),
                  color: Colors.grey,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatar(profile) {
    return profile.hasPhoto
        ? Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(profile.photoUrl),
                fit: BoxFit.cover,
              ),
            ),
          )
        : Container(
            height: 120.0,
            width: 120.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
          );
  }
}
