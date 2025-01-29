// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AuthRemoteRepo {
  Future<void> signup({required String name, required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/auth/signup'), // Ensure this matches the FastAPI endpoint
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        print('Signup successful');
      } else {
        print('Failed to signup: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      print('Connection failed: $e');
    } on HttpException catch (e) {
      print('HTTP error: $e');
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/auth/login'), // Ensure this matches the FastAPI endpoint
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        print('Login successful');
      } else {
        print('Failed to login: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      print('Connection failed: $e');
    } on HttpException catch (e) {
      print('HTTP error: $e');
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}