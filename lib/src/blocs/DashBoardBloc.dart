import '../models/DashBoardDataModel.dart';
import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class DashBoardBloc {
  final _repository = Repository();
  final _dashboardsFatcher = PublishSubject<DashBoardDataModel>();

  Stream<DashBoardDataModel> get allDashBoard => _dashboardsFatcher.stream;

  fetchAllDashboard(city_, latitude_, longitude_, country_, context) async {
    DashBoardDataModel dashboard = await _repository.dashboard(
        city_, latitude_, longitude_, country_, context);
    _dashboardsFatcher.sink.add(dashboard);
  }

  dispose() {
    _dashboardsFatcher.close();
  }
}

final blocDashboard = DashBoardBloc();
