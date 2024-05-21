import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/theme/my_app_colors.dart';
import '../../data/models/chat_model.dart';
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
    return Align(
      alignment: chatModel?.role == 'user'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: chatModel?.role == 'user'
                ? const EdgeInsets.only(top: 10, right: 15, left: 70)
                : const EdgeInsets.only(
                    left: 15, right: 70, top: 10, bottom: 10),
            child: ClipRRect(
              borderRadius: chatModel?.role == 'user'
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
                color: chatModel?.role == 'user'
                    ? ColorConstants.grey7A8194
                    : ColorConstants.green373E4E,
                child: isLoading == true
                    ? LoadingAnimationWidget.waveDots(
                        color: ColorConstants.white, size: 30)
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
              : CommonSizedBox()
        ],
      ),
    );
  }
}
