import 'package:bloc/bloc.dart';
import 'package:bookia/feature/profile/data/model/profile_model/profile_model.dart';
import 'package:bookia/feature/profile/data/repo/profile_repo.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  ProfileModel? profileModel;
  getDataOfProfile() async {
    emit(ProfileLoading());
    await ProfileRepo.getDataOfProfile().then((value) {
      if (value is ProfileModel) {
        profileModel = value;
        emit(ProfileSuccess());
      } else {
        emit(ProfileError("Some Thing is Error"));
      }
    });
  }
}
