class APIResponse<T> {
  bool isSuccessful;
  T data;
  String message;
  int responseCode;

  APIResponse(this.isSuccessful, this.data, this.message, this.responseCode);
}