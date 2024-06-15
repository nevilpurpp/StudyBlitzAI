import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nevilai/app/core/constants/assets_constant.dart';
import '../../../core/theme/my_app_colors.dart';
import '../../../data/models/chat_model.dart';
import '../../../data/providers/viewmodel/chat_view_model.dart';
import '../../widgets/common_sized_box.dart';
import '../../widgets/common_text.dart';
import '../../widgets/message_body.dart';
import '../../widgets/message_field.dart';
import '../../widgets/pop_up_menu.dart';
import '../../../data/providers/base_view.dart';
import '../home/home_page.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  ChatViewModel? model;

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
      onModelReady: (model) {
        this.model = model;
        model.updateHistory("opened_chat");
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
                    image: AssetImage(AssetConstant.backGroundImage))),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),
            _buildNeviAvatar(),
            const SizedBox(width: 10),
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
              data?.role != '${authViewModel.username ?? 'user'}' &&
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
      },
    );
  }

  Widget _buildNeviAvatar() {
    return const SizedBox(
      height: 37,
      width: 37,
      child: CircleAvatar(
        backgroundImage: AssetImage(AssetConstant.nevilogo),
      ),
    );
  }
}
