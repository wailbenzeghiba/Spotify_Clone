// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRemoteRepo 
{
Future<void> signup( {required String name, required String email, required String password}) async{
  try {
 final response = await http.post(Uri.parse("http://127.0.0.1:8000/auth/signup"),
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
  print(response.body);
  print(response.statusCode);
  } catch (e) {
    print(e);
  }
}
Future<void> login({required String email , required String password}) async{
  try {
 final response = await http.post(Uri.parse("http://127.0.0.1:8000/auth/login"),
 headers: {
   'Content-Type': 'application/json',
   'access-control-allow-origin': 'login',
 },
 body: jsonEncode({
   'email': email,
   'password': password,
 },) ,
 );
  print(response.body);
  print(response.statusCode);
  } catch (e) {
    print(e);
  }
}}