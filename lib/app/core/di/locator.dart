import 'package:get_it/get_it.dart';
import 'package:nevilai/app/data/providers/viewmodel/topic_summarizer_view.dart';
import '../../data/middleware/api_services.dart';
import '../../data/providers/viewmodel/chat_view_model.dart';

final locator = GetIt.instance;
setUpLocator() {
  locator.registerLazySingleton(() => ChatViewModel());
  locator.registerLazySingleton(() => TopicSummarizerView());
  locator.registerLazySingleton(() => GoogleGenerativeServices());
}
