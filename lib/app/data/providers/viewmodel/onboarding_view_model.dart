import 'package:flutter/material.dart';

import '../../../core/constants/assets_constant.dart';
import '../../models/onboard_model.dart';
import 'base_model.dart';

class OnboardingViewModel extends BaseModel {
  int _currentPage = 0;
  int get currentPage => _currentPage;
PageController pageController = PageController();
  final List<OnBoard> demoData = [
    OnBoard(
      image: AssetConstant.firstImage,
      title: 'Intelligent AI Interaction',
      description: 'Engage in sophisticated, \nreal-time conversations with StudyBlitzAI to receive precise and insightful academic assistance.',
    ),
    OnBoard(
      image: AssetConstant.secondImage,
      title: 'Advanced Topic Summarization',
      description: 'Input your subject and specific topic for a comprehensive summarization.\n Receive clear, concise overviews to enhance your understanding.',
    ),
    OnBoard(
      image: AssetConstant.thirdImage,
      title: 'Comprehensive Exam Preparation',
      description: 'Generate tailored multiple-choice questions by entering your subject and topic. Practice effectively and receive immediate feedback to excel in your exams.',
    ),
  ];

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }
    @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
