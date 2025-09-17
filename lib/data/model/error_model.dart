class ErrorModel {
  String? title;
  String? message;
  ErrorModel({this.title, this.message});

  factory ErrorModel.empty() {
    return ErrorModel(title: '', message: '');
  }
}