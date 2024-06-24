import 'package:get_it/get_it.dart';
import 'package:nevilai/app/core/utils/utils.dart';
import 'package:nevilai/app/data/providers/viewmodel/auth_view_model.dart';
import 'package:nevilai/app/data/providers/viewmodel/onboarding_view_model.dart';
import 'package:nevilai/app/data/providers/viewmodel/topic_summarizer_view.dart';
import '../../data/middleware/api_services.dart';
import '../../data/providers/viewmodel/chat_view_model.dart';
import '../../data/providers/viewmodel/exam_prep_view_model.dart';

final locator = GetIt.instance;
setUpLocator() {
  locator.registerLazySingleton(() => ChatViewModel());
  locator.registerLazySingleton(() => TopicSummarizerView());
  locator.registerLazySingleton(() => ExamPrepViewModel());
  locator.registerLazySingleton(() => GoogleGenerativeServices());
  locator.registerLazySingleton(() => AuthViewModel());
  locator.registerLazySingleton(() => AppUtils());
  locator.registerLazySingleton(() => OnboardingViewModel());
}
