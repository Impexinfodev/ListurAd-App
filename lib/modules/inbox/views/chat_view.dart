import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:list_ur_add/common_widgets/custom_app_bar.dart';
import 'package:list_ur_add/common_widgets/custom_input_fields.dart';
import 'package:list_ur_add/constant/app_colors.dart';
import 'package:list_ur_add/constant/app_fonts.dart';
import 'package:list_ur_add/constant/app_icons.dart';
import 'package:list_ur_add/modules/inbox/model/chat_message.dart';
import 'package:list_ur_add/modules/inbox/provider/chat_provider.dart';
import 'package:list_ur_add/widgets/inbox_widget/lower_nip_chat_clipper.dart';
import 'package:provider/provider.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final List<ChatMessage> messages = [
    ChatMessage(
      text: 'Hello Uncle Nice to talk with you, Hello Uncle Nice to talk with you, Hello Uncle Nice to talk with you',
      time: DateTime.now(),
      isMe: false,
    ),
    ChatMessage(
      text: 'Same here 🙂',
      time: DateTime.now(),
      isMe: true,
    ),
    ChatMessage(
      text: 'Kal milte hain',
      time: DateTime.now().subtract(const Duration(days: 1)),
      isMe: false,
    ),
  ];

  String getDateLabel(DateTime date) {
    final now = DateTime.now();

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return 'Today';
    }

    final yesterday = now.subtract(const Duration(days: 1));
    if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return 'Yesterday';
    }

    return '${date.day}/${date.month}/${date.year}';
  }

  String formatTime(DateTime date) {
    final h = date.hour.toString().padLeft(2, '0');
    final m = date.minute.toString().padLeft(2, '0');
    return '$h:$m ${date.hour >= 12 ? 'PM' : 'AM'}';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, provider, child){
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: '',
          isInbox: true,
          widget2: Row(
            crossAxisAlignment: .start,
            children: [
              Stack(
                children: [
                  Image.asset(AppIcons.profileIc, height: 44.h, width: 44.w, fit: BoxFit.cover),
                  Positioned(
                    bottom: 7,
                    right: 0,
                    child: Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: AppColors.clr49DB1C,
                        boxShadow: [
                          BoxShadow(color: AppColors.clr34AF0F.withOpacity(0.10), blurRadius: 10),  
                        ],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2.5.w),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Anshika Negi',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: AppFonts.medium,
                      color: AppColors.clr141619,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.medium,
                      color: AppColors.clr49DB1C,
                    ),
                  ),
                ],
              ),
            ],
          ),
          widget: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.clr2388FF.withOpacity(0.10),
                ),
                child: Image.asset(
                  AppIcons.wifiCallIc,
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 16.w),
              Image.asset(AppIcons.menuIc, height: 26.h, width: 26.w, fit: BoxFit.contain),
              SizedBox(width: 16.w),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColors.clr2388FF.withOpacity(0.10),
                  border: Border.all(color: AppColors.clr2388FF, width: 1.w),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  crossAxisAlignment: .start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        AppIcons.profileIc,
                        height: 46.h,
                        width: 46.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            'Groom Wanted',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: AppFonts.regular,
                              color: AppColors.clr141619,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            maxLines: 2,
                            overflow: .ellipsis,
                            'OnAnshika Negi, Manglik Girl, Looking for Manglik Negi Indian Handsome Boy, Call For More +91...',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.regular,
                              color: AppColors.clr687684,
                            ),
                          ),
                          SizedBox(height: 9.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              color: AppColors.clrF9F9F9,
                            ),
                            child: Text(
                              'Expand',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: AppFonts.medium,
                                color: AppColors.clr2388FF,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    bool showDate = false;
                    if (index == 0) {
                      showDate = true;
                    } else {
                      final prev = messages[index - 1].time;
                      if (prev.day != message.time.day ||
                          prev.month != message.time.month ||
                          prev.year != message.time.year) {
                        showDate = true;
                      }
                    }

                    return Column(
                      children: [
                        if (showDate)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [AppColors.clr0076F6, AppColors.clr0059BA],
                              ),
                              borderRadius: BorderRadius.circular(120.r),
                            ),
                            child: Text(
                              getDateLabel(message.time),
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontFamily: AppFonts.regular,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        SizedBox(height: 20.h),
                        if (!message.isMe)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppIcons.profileIc,
                                height: 36.h,
                                width: 36.w,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 6.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppIcons.chatSendIc),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Text(
                                        message.text,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppFonts.regular,
                                          color: AppColors.clr3F4E5D,
                                          height: 1.3,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      formatTime(message.time),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: AppFonts.medium,
                                        color: AppColors.clr687684,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        else
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding:
                                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppIcons.chatRecieveIc),
                                          fit: BoxFit.fill,
                                          colorFilter: ColorFilter.mode(
                                            AppColors.clr2388FF,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        message.text,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: AppFonts.regular,
                                          color: Colors.white,
                                          height: 1.3,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      formatTime(message.time),
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: AppFonts.medium,
                                        color: AppColors.clr687684,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Image.asset(
                                AppIcons.profileIc,
                                height: 36.h,
                                width: 36.w,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                      ],
                    );
                  },
                ),
              ),

            ],
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: .min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.clr2388FF.withOpacity(0.10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 2,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset(AppIcons.pinIc, height: 34.h, width: 34.w, fit: BoxFit.contain),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextField(
                      borderRadius: 10.r,
                      leading1: Image.asset(
                        AppIcons.sendIc,
                        height: 20.h,
                        width: 20.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });

  }
}


// ClipPath(
//   clipper: LowerNipMessageClipper(MessageType.send),
//   child: Container(
//     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
//     decoration: BoxDecoration(
//       color: AppColors.clr2388FF,
//       boxShadow: [
//         BoxShadow(
//           color: AppColors.clr687684.withOpacity(0.10),
//           blurRadius: 10.r,
//         ),
//       ],
//     ),
//     child: Text(
//       'Hello Uncle Nice to talk with you i’d  love to had convo with you.',
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontFamily: AppFonts.regular,
//         color: Colors.white,
//       ),
//     ),
//   ),
// ),
// ClipPath(
//   clipper: LowerNipBubbleClipper(MessageType.receive,),
//   child: Container(
//     padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
//     decoration: BoxDecoration(
//       color: AppColors.clr2388FF,
//       boxShadow: [
//         BoxShadow(
//           color: AppColors.clr687684.withOpacity(0.10),
//           blurRadius: 10.r,
//         ),
//       ],
//     ),
//     child: Text(
//       'Hello Uncle Nice to talk with you i’d  love to had convo with you.',
//       style: TextStyle(
//         fontSize: 16.sp,
//         fontFamily: AppFonts.regular,
//         color: Colors.white,
//       ),
//     ),
//   ),
// ),
