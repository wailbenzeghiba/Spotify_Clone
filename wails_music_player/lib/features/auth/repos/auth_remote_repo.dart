// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:wails_music_player/core/theme/constants/server_constant.dart';
import 'package:wails_music_player/core/theme/failure/failure.dart';
import 'package:wails_music_player/features/auth/model/user_model.dart';

class AuthRemoteRepo 
{
Future<Either<Failure, UserModel>> signup( {required String name, required String email, required String password}) async{
  try {
 final response = await http.post(Uri.parse("${ServerConstant.serverURL}/auth/signup"),
 headers: {
   'Content-Type': 'application/json',
   'access-control-allow-origin': 'signup',
 },
 body: jsonEncode({
   'name': name,
   'email': email,
   'password': password,
 },) ,
 );
 final responseBodyMap = jsonDecode(response.body) as Map<String , dynamic>;
 if (response.statusCode != 201) {
 return Left(Failure(responseBodyMap['detail']));
 } 
 
 return Right(UserModel.fromMap(responseBodyMap));

  } catch (e) {
    return Left(Failure(e.toString()));
  }
}
Future<Either<Failure,UserModel>> login({required String email , required String password}) async{
  try {
 final response = await http.post(Uri.parse("${ServerConstant.serverURL}/auth/login"),
 headers: {
   'Content-Type': 'application/json',
   'access-control-allow-origin': 'login',
 },
 body: jsonEncode({
   'email': email,
   'password': password,
 },) ,
 );
final responseBodyMap = jsonDecode(response.body) as Map<String , dynamic>;

  if (response.statusCode != 200) 
  {
    return Left(Failure(responseBodyMap['detail']));
  }
  return Right(UserModel.fromMap(responseBodyMap));
  } catch (e) {
    return Left(Failure(e.toString()));
  }
}}