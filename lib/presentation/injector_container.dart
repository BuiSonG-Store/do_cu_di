import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../common/bloc/event_bus/event_bus_bloc.dart';
import '../common/bloc/loading_bloc/loading_bloc.dart';
import '../common/bloc/snackbar_bloc/snackbar_bloc.dart';
import '../common/local/app_cache.dart';
import '../common/local/local_app.dart';
import '../common/network/client.dart';

final injector = GetIt.instance;

Future<void> init() async {
  _initCommon();
  _initBloc();
}

void _initBloc() {
  injector.registerLazySingleton(() => EventBusBloc());
  injector.registerLazySingleton(() => LoadingBloc());
  injector.registerLazySingleton(() => SnackBarBloc());
  injector.registerLazySingleton(() => AppCache());
}

void _initCommon() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => sharedPreferences);
  injector.registerLazySingleton(() => AppClient(
        injector(),
        injector(),
      ));
  injector.registerLazySingleton(() => LocalApp(injector()));
}
