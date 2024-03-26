import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_tz/features/main/data/model/photo_model.dart';
import 'package:oracle_tz/features/main/data/repository/photo_repository_impl.dart';
import 'package:oracle_tz/features/main/data/repository/user_repository_impl.dart';
import 'package:oracle_tz/features/main/domain/use_case/photo_use_case.dart';
import 'package:oracle_tz/features/main/domain/use_case/user_use_case.dart';
import 'package:oracle_tz/features/main/presentation/photo_logic/bloc/photo_bloc.dart';
import 'package:oracle_tz/features/main/presentation/user_logic/bloc/user_bloc.dart';
import 'package:oracle_tz/internal/components/app_routes.dart';
import 'package:oracle_tz/internal/components/text_helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UserBloc userBloc = UserBloc(
    userUseCase: UserUseCase(
      userRepository: UserRepositoryImpl(),
    ),
  );
  PhotoBloc photoBloc = PhotoBloc(
    photoUseCase: PhotoUseCase(
      photoRepository: PhotoRepositoryImpl(),
    ),
  );

  @override
  void initState() {
    userBloc.add(GetAllUsersEvent());
    photoBloc.add(GetAllPhotosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover',
                style: TextHelper.s36,
              ),
              SizedBox(height: 32.h),
              Text(
                "WHAT'S NEW TODAY",
                style: TextHelper.w900s13,
              ),
              SizedBox(height: 24.h),
              BlocConsumer<UserBloc, UserState>(
                bloc: userBloc,
                listener: (context, state) {
                  if (state is UserErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error.message.toString(),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UserLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is UserLoadedState) {
                    return SizedBox(
                      height: 393.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.userModelList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.push(
                                RouterConstants.mainInfoScreen,
                                extra: {
                                  'userModel': state.userModelList[index],
                                },
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/Rectangle 2.8.png',
                                  height: 343.h,
                                  width: 343.w,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: 16.h),
                                Row(
                                  children: [
                                    Image.asset('assets/images/man.png'),
                                    SizedBox(width: 8.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.userModelList[index].name ??
                                              '-',
                                          style: TextHelper.w700s13,
                                        ),
                                        Text(
                                          state.userModelList[index].email ??
                                              '-',
                                          style: TextHelper.s11,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10.w);
                        },
                      ),
                    );
                  }
                  if (state is UserErrorState) {
                    return Center(
                      child: TextButton(
                        onPressed: () {
                          userBloc.add(GetAllUsersEvent());
                        },
                        child: const Column(
                          
                          children: [
                            Text('Произошла ошибка'),
                            Text('Нажмите еще раз'),
                          ],
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              SizedBox(height: 48.h),
              Text(
                'BROWSE ALL',
                style: TextHelper.w900s13,
              ),
              SizedBox(height: 24.h),
              BlocConsumer<PhotoBloc, PhotoState>(
                bloc: photoBloc,
                listener: (context, state) {
                  if (state is PhotoErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error.message.toString(),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is PhotoLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is PhotoLoadedState) {
                    return GridViewContent(
                      photoModelList: state.photoModelList,
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GridViewContent extends StatelessWidget {
  final List<PhotoModel> photoModelList;

  const GridViewContent({
    super.key,
    required this.photoModelList,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: photoModelList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                context.push(
                  RouterConstants.photoInfoScreen,
                  extra: {
                    'photoModel': photoModelList[index],
                  },
                );
              },
              child: Image.network(
                photoModelList[index].thumbnailUrl ?? '-',
              ),
            ),
          ],
        );
      },
    );
  }
}
