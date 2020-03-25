import 'model/cases.dart';
import 'model/chart_model.dart';
import 'data/data.dart';

Cases latestCases = Cases(0, 0, 0, 0);
List<ChartModel> charts = List();
Data data = Data();
int totalReport;
bool dataLoaded = false;
