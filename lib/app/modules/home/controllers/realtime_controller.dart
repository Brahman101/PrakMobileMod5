import 'package:appwrite/appwrite.dart';
import 'package:modul3prak/app/modules/home/controllers/client_controller.dart';

class RealtimeController extends ClientController {
  Realtime? realtime;
  @override
  void onInit() {
    super.onInit();
// appwrite
    realtime = Realtime(client);
  }

  subsUserName() async {
    final subscription = realtime!.subscribe(['files']);
    subscription.stream.listen((response) {
      if (response.events.contains('buckets.*.files.*.create')) {
        print("RealtimeController:: subsUserName ${response.payload}");
        print("RealtimeController:: subsUserName ${response.events}");
      }
    });
  }
}
