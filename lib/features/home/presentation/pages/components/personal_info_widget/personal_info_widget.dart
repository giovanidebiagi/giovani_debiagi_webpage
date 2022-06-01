import 'package:flutter/material.dart';
import 'package:giovani_debiagi_webpage/core/size_constants.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/pages/components/personal_info_widget/components/professions_widget/professions_widget.dart';
import 'package:giovani_debiagi_webpage/features/home/presentation/pages/components/personal_info_widget/components/social_media_row_widget/social_media_row_widget.dart';
import '../../../../data/personal_info_constants.dart';
import 'components/about_me_widget.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          left: SizeConstants.pageBodyLeftPadding,
          right: SizeConstants.pageBodyRightPadding,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 64.0),
          child: Column(
            children: [
              SizedBox(
                width: 800,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'lib/features/home/data/assets/images/giovani_profile_picture.png'),
                            radius: SizeConstants.profilePictureAvatarRadius,
                          ),
                          SizedBox(height: 32.0),
                          Text(
                            'I am ${PersonalInfoConstants.personalInfoName} ${PersonalInfoConstants.personalInfoLastName}',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            PersonalInfoConstants.personalInfoEmail,
                            style: TextStyle(fontSize: 14.0),
                          ),
                          SizedBox(height: 32.0),
                          ProfessionsWidget(),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24.0),
                    Expanded(
                      child: Column(
                        children: const [
                          AboutMeWidget(),
                          SizedBox(height: 48.0),
                          SocialMediaRowWidget(),
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
}
