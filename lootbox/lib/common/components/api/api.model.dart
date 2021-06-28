class APIResponse<T> {
  bool isSuccessful;
  T data;
  String message;
  int responseCode;

  APIResponse(this.isSuccessful, this.data, this.message, this.responseCode);
}

class RequestData extends Object {
  String _method = '';
  List arguments = [];

  RequestData(String method, List arguments) {
    _method = method;
    arguments = arguments;
  }

  @override 
  String toString() {

    return "${_method}();";
  }
}