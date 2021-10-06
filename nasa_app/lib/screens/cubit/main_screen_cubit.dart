import 'package:eticon_api/eticon_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/models/apod_model.dart';
import 'package:nasa_app/screens/cubit/mian_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  late List<ApodModel> apodModel;
  MainScreenCubit() : super(MainScreenLoading());

  Future<void> getData() async {
    try {
      Map<String, dynamic> response = await Api.get(
          method: 'rovers/curiosity/photos',
          query: {
            'sol': '1000',
            'api_key': 'hTyuBrb3xGcFIbQkGlsb8aMPurTJjQKuB20eAe65'
          });
      emit(MainScreenLoaded(result: ApodModel.fromJson(response)));
    } on APIException catch (error) {
      if (error.code == 0) {
        emit(MainScreenError(errorMsg: 'No internet connection...'));
      } else {
        emit(MainScreenError(errorMsg: 'Ups...'));
      }
    }
  }
}
