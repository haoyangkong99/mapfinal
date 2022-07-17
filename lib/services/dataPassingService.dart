class DataPassingService {
  var data;
  void assign(var obj) {
    data = obj;
  }

  get _data => data;
}
