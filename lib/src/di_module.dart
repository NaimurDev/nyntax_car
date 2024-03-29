import 'package:get_it/get_it.dart';
import 'package:nyntax_car/src/core/network/http_client.dart';

final GetIt di = GetIt.instance;

Future<void> initDI() async {
  di.registerSingleton<BaseHttpClient>(BaseHttpClient());
}
