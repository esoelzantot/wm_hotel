import 'package:get_it/get_it.dart';
import 'package:wm_hotel/core/apis/api_services.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices());
}
