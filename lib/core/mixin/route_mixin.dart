import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rotation_app/product/service/api/api_service.dart';
import 'package:rotation_app/product/util/constants/color_data.dart';
import 'package:rotation_app/product/util/constants/string_data.dart';
import 'package:rotation_app/product/util/dialog/dialog_util.dart';

mixin RouteMixin on DialogUtil {
  ApiService apiService = ApiService();
  Future<List<Polyline>?>? drawRoute({String? lat1, String? lat2, String? lng1, String? lng2}) async {
    List? path = await apiService.getDirections("$lng1,$lat1", "$lng2,$lat2");
    if (path == null || path.isEmpty) {
      showErrorDialog(StringData.routeError);
      return null;
    }
    return [
      Polyline(
        points: path.map((e) => LatLng(e[1], e[0])).toList(),
        strokeWidth: 4.0,
        color: ColorData.eyeBlue,
      ),
    ];
  }
}
