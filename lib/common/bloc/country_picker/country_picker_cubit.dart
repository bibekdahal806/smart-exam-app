import 'package:bloc/bloc.dart';
import 'package:country_picker/country_picker.dart';

class CountryPickerCubit extends Cubit<Country> {
  CountryPickerCubit()
    : super(CountryService().findByCode('NP') ?? Country.worldWide);
  void change(Country country) {
    emit(country);
  }
}
