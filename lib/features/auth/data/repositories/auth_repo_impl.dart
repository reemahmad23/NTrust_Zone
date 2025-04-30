import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/errors/failure.dart';
import '../../data/datasource/auth_remote_datasource.dart';
import '../../domain/repositories/auth_repo.dart';


class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remote;

  AuthRepoImpl(this.remote);

  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async
  {
    try {
      final response = await remote.login(
        email: email,
        password: password,
        rememberMe: rememberMe,
      );
      return Right(response);
    } catch (e) {
      if (e is DioError) {
        if (e.error == "Invalid credentials") {
          return Left(InvalidCredentialsFailure());
        } else if (e.error == "Server error occurred") {
          return Left(ServerErrorFailure());
        } else if (e.error == "Bad Request") {
          return Left(BadRequestFailure());
        } else {
          return Left(ServerFailure(error: e.message??''));
        }
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signUp({
    required BuildContext context,
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
    required int age,
    required int disabilityTypeId,
  }) async {
    try {
      final response = await remote.signUp(
        username: username,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        age: age,
        disabilityTypeId: disabilityTypeId, context: context,
      );
      return Right(response);

    } catch (e) {
      if (e is DioError) {
        if (e.error == "Invalid credentials") {
          return Left(InvalidCredentialsFailure());
        } else if (e.error == "Server error occurred") {
          return Left(ServerErrorFailure());
        } else if (e.error == "Bad Request") {
          return Left(BadRequestFailure());
        } else {
          return Left(ServerFailure(error: e.message??''));
        }
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

}
