import 'package:ecommercer_app/app_constants.dart';
import 'package:ecommercer_app/app_urls.dart';
import 'package:ecommercer_app/data/api_helper.dart';
import 'package:ecommercer_app/ui/on_boarding/bloc/user_event.dart';
import 'package:ecommercer_app/ui/on_boarding/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  ApiHelper apiHelper = ApiHelper();
  UserBloc({required this.apiHelper}) : super(UserInitialState()) {
    on<UserSignUpEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        dynamic data = await apiHelper.postApi(url: AppUrls.signUpUrl,mBodyParameters: {
          "name" : event.name,
          "mobile_number" : event.mobNo,
          "email" : event.email,
          "password" : event.password,

        },isAuth: true);
        if (data["status"]) {
          emit(UserSuccessState());
        } else {
          emit(UserFailureState(errorMsg: data["message"]));
        }
      } catch (e) {
        emit(UserFailureState(errorMsg: e.toString()));
      }
    });
    on<UserSignInEvent>((event, emit) async {
      emit(UserLoadingState());
      try{
        dynamic mData =await apiHelper.postApi(url: AppUrls.loginUrl,mBodyParameters: {
          "email" : event.email,
          "password" : event.password
        },
        isAuth: true);
        if(mData["status"]){
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(AppConstants.USER_TOKEN, mData["tokan"]);
          emit(UserSuccessState());
        }
        else{
          emit(UserFailureState(errorMsg: mData["message"]));
        }
      }catch(e){
        emit(UserFailureState(errorMsg: e.toString()));
      }

    });


  }
}
