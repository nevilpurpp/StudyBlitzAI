import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';
import '../../../core/theme/my_app_colors.dart';
import '../../../data/models/chat_model.dart';
import '../../../data/models/viewmodel/chat_view_model.dart';
import '../../widgets/common_sized_box.dart';
import '../../widgets/common_text.dart';
import '../../widgets/message_body.dart';
import '../../widgets/message_field.dart';
import '../../widgets/pop_up_menu.dart';
import '../base_view.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  ChatViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      onModelReady: (model) {
        this.model = model;
      },
      builder: (context, model, child) {
        return SafeArea(
            child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            model.keyboardAppear(false);
            
          },
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      AssetConstant.backGroundImage,
                    ))),
            child: Scaffold(
              backgroundColor: ColorConstants.transparent,
              body: buildBody(context),
            ),
          ),
        ));
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        CommonSizedBox(height: 10),
        Row(
          children: [
           /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: Image.asset(
                  height: 45,
                  width: 45,
                  AssetConstant.aiIcon,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            */
            CommonText(
              text: 'Chat With Nevi',
              color: ColorConstants.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        CommonSizedBox(height: 20),
        buildChatMessage(),
        MessageField(
            chatViewModel: model,
            onClipTap: () {
              _showPicker(context);
              
            },
            ),
        
      ],
    );
  }

  Widget buildChatMessage() {
    return Expanded(
      child: ListView.builder(
        controller: model?.scrollController,
        shrinkWrap: true,
        itemCount: model?.chatList.length ?? 0,
        itemBuilder: (context, index) {
          int last = (model?.chatList.length ?? 0);
          ChatModel? data;
          if (model?.chatList[index] != null) {
            data = model?.chatList[index];
          }
          bool isLoading = index + 1 == last &&
              data?.role != 'user' &&
              data?.text == '';
          return MessageBody(chatModel: data, isLoading: isLoading);
        },
      ),
    );
  }

  _showPicker(context) {
    showModalBottomSheet(
        backgroundColor: ColorConstants.transparent,
        context: context,
        builder: (BuildContext context) {
          return PopUpMenuWidget(
            onTapCamera: () {
              model?.imgFromDevice(ImageSource.camera);
              Navigator.pop(context);
            },
            onTapGalley: () {
              model?.imgFromDevice(ImageSource.gallery);
              Navigator.pop(context);
            },
          );
        });
  }
}
