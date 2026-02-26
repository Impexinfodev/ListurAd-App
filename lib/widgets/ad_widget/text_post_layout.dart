import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/inbox/views/chat_view.dart';
import 'package:list_ur_add/widgets/home_widget/action_icon.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class TextPostLayout extends StatefulWidget {
  final Color backgroundColor;

  const TextPostLayout({super.key, required this.backgroundColor});

  @override
  State<TextPostLayout> createState() => _TextPostLayoutState();
}

class _TextPostLayoutState extends State<TextPostLayout> {
  bool isLiked = false;
  bool isTranslated = false;
  bool isCommentBoxVisible = false;
  bool isCommentSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppIcons.profileIc, height: 35.h, width: 35.w, fit: BoxFit.contain),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'Rahul Sharma',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: AppFonts.semibold,
                                    color: AppColors.clr141619,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Image.asset(AppIcons.verifyIc, height: 15.h, width: 15.w),
                              SizedBox(width: 8.w),
                              Text(
                                'Follow',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: AppFonts.semibold,
                                  color: AppColors.clr2388FF,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Sponsored',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.semibold,
                            color: AppColors.clr141619,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Image.asset(AppIcons.moreIc, height: 15.h, width: 15.w),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: widget.backgroundColor,
                      ),
                      child: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: TextStyle(
                            color: AppColors.clr141618,
                            fontFamily: AppFonts.regular,
                            fontSize: 14.sp,
                          ),
                          children: [
                            const TextSpan(
                              text:
                                  'वर्क फ्रॉम होम पार्ट टाइम फुल टाइम एक्स्ट्रा इनकम फीमेल छात्राएं गृहणियां वर्किंग वीमेन लिमिटेड कंपनी मैं आवश्यकता [लिमिटेड सीट्स] डिंपल ',
                            ),
                            TextSpan(
                              text: '9166387605',
                              style: TextStyle(color: AppColors.clr2388FF),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isLiked = !isLiked;
                            });
                          },
                          child: ActionIcon(
                            icon: isLiked ? AppIcons.heartFilledIc : AppIcons.heartIc,
                            text: '3',
                          ),
                        ),
                        SizedBox(width: 29.w),

                        GestureDetector(
                          onTap: onCommentTap,
                          child: ActionIcon(
                            icon: isCommentSelected
                                ? AppIcons.commentSelectedIc
                                : AppIcons.commentIc,
                          ),
                        ),
                        SizedBox(width: 29.w),

                        GestureDetector(
                          onTap: () {
                            const phone = 'tel:+919999999999';
                            launchUrl(Uri.parse(phone));
                          },
                          child: ActionIcon(icon: AppIcons.callIc),
                        ),
                        SizedBox(width: 29.w),

                        GestureDetector(
                          onTap: () {},
                          child: ActionIcon(icon: AppIcons.analysisIc, text: '15k'),
                        ),
                        SizedBox(width: 29.w),

                        GestureDetector(
                          onTap: () {},
                          child: ActionIcon(icon: AppIcons.bookmarkIc),
                        ),
                        SizedBox(width: 29.w),

                        GestureDetector(
                          onTap: () {
                            Share.share('Check out this job post');
                          },
                          child: ActionIcon(icon: AppIcons.shareIc),
                        ),
                        SizedBox(width: 29.w),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isTranslated = !isTranslated;
                            });
                          },
                          child: ActionIcon(
                            icon: isTranslated
                                ? AppIcons.translateSelectedIc
                                : AppIcons.translateSelectedIc,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          if (isCommentBoxVisible) ...[_buildCommentInputBox(), SizedBox(height: 10.h)],
          Divider(color: AppColors.clrCED5DC),
        ],
      ),
    );
  }

  void onCommentTap() {
    setState(() {
      isCommentBoxVisible = !isCommentBoxVisible;
      isCommentSelected = !isCommentSelected;
    });
  }

  Widget _buildCommentInputBox() {
    final TextEditingController controller = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: .start,
          children: [
            Image.asset(AppIcons.profileIc, height: 36.h, width: 36.w, fit: BoxFit.cover),
            SizedBox(width: 6.w),
            Image.asset(AppIcons.gallaryIc, height: 22.h, width: 22.w),
            SizedBox(width: 6.w),
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.clr0067FF),
              child: Icon(Icons.add, size: 18.sp, color: Colors.white),
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.clrF7F7F7,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextField(
                  controller: controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'I would like to connect with you, Can we make a on call Discussion?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 6.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChatView()),
                    );
                  },
                  child: Image.asset(
                    AppIcons.sendChatIc,
                    height: 24.h,
                    width: 24.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
