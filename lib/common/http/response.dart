class DataResponse<T> {
  Status status;
  T data;
  String message;

  DataResponse.loading(this.message) : status = Status.Loading;

  DataResponse.success(this.data) : status = Status.Success;

  DataResponse.error(this.message) : status = Status.Error;

  DataResponse.connectivityError() : status = Status.ConnectivityError;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { Loading, Success, Error, ConnectivityError }
