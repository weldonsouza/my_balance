import 'dart:async';

final DebounceExtension debounce = DebounceExtension(Duration(milliseconds: 400));

class DebounceExtension {
  Duration delay;
  Timer? _timer;

  DebounceExtension(
    this.delay,
  );

  call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  dispose() {
    _timer?.cancel();
  }
}
