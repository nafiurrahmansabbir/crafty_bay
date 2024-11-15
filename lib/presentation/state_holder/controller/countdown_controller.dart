import 'package:get/get.dart';

class CountdownController extends GetxController {
  var remainingSeconds = 120.obs;
  late final _timer;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    _timer = Stream.periodic(const Duration(seconds: 1), (int count) {
      return 120 - count;
    }).take(121).listen((value) {
      remainingSeconds.value = value;
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
