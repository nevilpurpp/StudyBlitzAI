import 'package:get_it/get_it.dart';
import '../../data/middleware/api_services.dart';
import '../../data/models/viewmodel/chat_view_model.dart';

final locator = GetIt.instance;
setUpLocator() {
  locator.registerLazySingleton(() => ChatViewModel());
  locator.registerLazySingleton(() => GoogleGenerativeServices());
}
