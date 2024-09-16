import 'package:movies/core/network/error_message_model.dart';

class ServerException implements Exception{
   final ErrorMessageModel errorMessageModel;
  ServerException({required this.errorMessageModel});


}


//For local DataSource
class LocalDataBaseException implements Exception{
  final String message;
  LocalDataBaseException({required this.message});
}