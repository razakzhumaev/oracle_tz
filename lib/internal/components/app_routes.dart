import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_tz/features/authorization/auth_screen.dart';
import 'package:oracle_tz/features/authorization/create_account_screen.dart';
import 'package:oracle_tz/features/authorization/login_screen.dart';
import 'package:oracle_tz/features/authorization/verify_email_screen.dart';
import 'package:oracle_tz/features/chat/james_info_chat.dart';
import 'package:oracle_tz/features/home_screen/home_screen.dart';
import 'package:oracle_tz/features/main/data/model/photo_model.dart';
import 'package:oracle_tz/features/main/data/model/user_model.dart';
import 'package:oracle_tz/features/main/presentation/screens/main_info_screen.dart';
import 'package:oracle_tz/features/main/presentation/screens/photo_info_screen.dart';
import 'package:oracle_tz/features/profile/profile_screen.dart';
import 'package:oracle_tz/internal/helpers/firebase_stream.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const FirebaseStream();
      },
    ),
    GoRoute(
      path: RouterConstants.auth,
      builder: (BuildContext context, GoRouterState state) {
        return const AuthScreen();
      },
    ),
    GoRoute(
      path: RouterConstants.login,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: RouterConstants.createAccount,
      builder: (BuildContext context, GoRouterState state) {
        return const CreateAccountScreen();
      },
    ),
    GoRoute(
      path: RouterConstants.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: RouterConstants.verifyEmail,
      builder: (BuildContext context, GoRouterState state) {
        return const VerifyEmailScreen();
      },
    ),
    GoRoute(
      path: RouterConstants.jamesInfoChat,
      builder: (BuildContext context, GoRouterState state) {
        return const JamesInfoChat();
      },
    ),
    GoRoute(
      path: RouterConstants.mainInfoScreen,
      builder: (BuildContext context, GoRouterState state) {
        UserModel? userModel;
        if (state.extra != null) {
          final Map<String, Object?> params =
              state.extra as Map<String, Object?>;
          userModel = params['userModel'] as UserModel;
        }
        return MainInfoScreen(userModel: userModel!);
      },
    ),
    GoRoute(
      path: RouterConstants.photoInfoScreen,
      builder: (BuildContext context, GoRouterState state) {
        PhotoModel? photoModel;
        if (state.extra != null) {
          final Map<String, Object?> params =
              state.extra as Map<String, Object?>;
          photoModel = params['photoModel'] as PhotoModel;
        }
        return PhotoInfoScreen(photoModel: photoModel!);
      },
    ),
    GoRoute(
      path: RouterConstants.profileScreen,
      builder: (BuildContext context, GoRouterState state) {
        UserModel? userModel;
        if (state.extra != null) {
          final Map<String, Object?> params =
              state.extra as Map<String, Object?>;
          userModel = params['userModel'] as UserModel;
        }
        return ProfileScreen(userModel: userModel);
      },
    )
  ],
);

class RouterConstants {
  static String auth = '/auth_screen';
  static String login = '/login_screen';
  static String createAccount = '/create_account_screen';
  static String homeScreen = '/home_screen';
  static String verifyEmail = '/verify_email';
  static String mainInfoScreen = '/main_info_screen';
  static String photoInfoScreen = '/photo_info_screen';
  static String profileScreen = '/profile_screen';
  static String jamesInfoChat = '/james_info_chat';
}
