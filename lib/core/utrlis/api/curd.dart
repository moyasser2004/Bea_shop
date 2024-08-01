import 'dart:convert';

import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../function/internet_connect.dart';

class Curd {
  Future<Either<RequestState, Map<String, dynamic>>> post(
      String url, Map<String, dynamic> data) async {
    try {
      if (await internetConnect()) {
        final response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 ||
            response.statusCode == 201) {
          Map<String, dynamic> responseBody =
              jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(RequestState.serverFailure);
        }
      } else {
        return const Left(RequestState.internetFailure);
      }
    } catch (e) {
      return const Left(RequestState.error);
    }
  }

  Future<Either<RequestState, Map<String, dynamic>>> get(
      String url) async {
    try {
      if (await internetConnect()) {
        final response = await http.get(
          Uri.parse(url),
        );
        if (response.statusCode == 200 ||
            response.statusCode == 201) {
          Map<String, dynamic> responseBody =
              jsonDecode(response.body);
          return Right(responseBody);
        } else {
          return const Left(RequestState.serverFailure);
        }
      } else {
        return const Left(RequestState.internetFailure);
      }
    } catch (e) {
      return const Left(RequestState.error);
    }
  }
}
