import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';

import '../../core/theme/my_app_colors.dart';
import '../../data/models/chat_model.dart';
import '../screens/home/home_page.dart';
import 'common_image.dart';
import 'common_sized_box.dart';
import 'common_text.dart';

// ignore: must_be_immutable
class MessageBody extends StatelessWidget {
  MessageBody({super.key, required this.chatModel, required this.isLoading});
  ChatModel? chatModel;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Message bubble positioned at the bottom
        _buildMessageBubble(context),
SizedBox(height: 10,),
        // User/Nevi avatar positioned slightly on top
        Positioned(
          top: 1, // Adjust vertical offset (negative value overlaps)
          left: chatModel?.role == 'you' ? null : 0.0, // Position based on role
          right: chatModel?.role == 'you' ? 0.0 : null,
          child: chatModel?.role == 'you'
              ? _buildUserAvatar(context)
              : _buildNeviAvatar(),
        ),
      ],
    );
  }

  Widget _buildMessageBubble(BuildContext context) {
    return Align(
      alignment: chatModel?.role == 'you' ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: chatModel?.role == 'you'
                ? const EdgeInsets.only(top: 10, right: 15, left: 70)
                : const EdgeInsets.only(left: 15, right: 70, top: 10, bottom: 10),
            child: ClipRRect(
              borderRadius: chatModel?.role == 'you'
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))
                  : const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
              child: Container(
                padding: const EdgeInsets.all(10),
                color: chatModel?.role == 'you'
                    ? const Color.fromARGB(255, 122, 155, 23)
                    : const Color.fromARGB(255, 117, 146, 31),
                child: isLoading == true
                    ? LoadingAnimationWidget.waveDots(color: ColorConstants.white, size: 30)
                    : CommonText(
                        text: chatModel?.text ?? '',
                        color: ColorConstants.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
              ),
            ),
          ),
          chatModel?.photo != null
              ? CommonImages(
                  bottomLeft: 20,
                  topLeft: 20,
                  bottomRight: 20,
                  file: chatModel?.photo ?? File(''),
                )
              : CommonSizedBox(),
        ],
      ),
    );
  }

  Widget _buildUserAvatar(BuildContext context) {
    return SizedBox(
      height: 33,
      width: 33,
      child: CircleAvatar(
        backgroundColor: Colors.grey[200], // Consider using a placeholder color
        child: authViewModel.userphoto != null // Check if user photo exists
            ? ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  authViewModel.userphoto!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.account_circle), // Show placeholder on error
                ),
              )
            : const Text(
                "You",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
      ),
    );
  }

  Widget _buildNeviAvatar() {
    return const SizedBox(
      height: 33,
      width: 33,
      child: CircleAvatar(
        backgroundImage:  AssetImage(AssetConstant.nevilogo),
      ),
    );
  }
}
