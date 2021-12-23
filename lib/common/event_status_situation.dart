class EventStatusSituation {
  static const String public = 'public';
//  static const String open = 'open';
//  static const String close = 'close';
  static const String reject = 'reject';
  static const String delete = 'delete';

  static List<String> getOKSituation() {
    return [public];
  }

  static List<String> getNGSituation() {
    return [reject, delete];
  }

  static List<String> getOKAlgoliaSituation() {
    return ['status:public'];
  }
}
