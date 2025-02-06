import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:kollibry/common/themes/theme.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../../../common/styles/colors.dart';

class DeliveryPointScreen extends StatefulWidget {
  @override
  _DeliveryPointScreenState createState() => _DeliveryPointScreenState();
}

class _DeliveryPointScreenState extends State<DeliveryPointScreen> {
  final MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  Location _location = Location();
  LatLng? _currentPosition;
  LatLng _defaultPosition = LatLng(59.9343, 30.3351); // Санкт-Петербург
  Marker? _deliveryMarker;

  @override
  void initState() {
    super.initState();
    _checkAndRequestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Точка доставки',
          style: TAppTheme.lightTheme.appBarTheme.titleTextStyle,
        ),
        backgroundColor: KColors.primary,
      ),
      body: Stack(
        children: [
          // Карта
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _currentPosition ?? _defaultPosition,
              initialZoom: 14.0,
              onTap: (tapPosition, point) {
                _updateDeliveryPoint(point);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              if (_deliveryMarker != null)
                MarkerLayer(
                  markers: [_deliveryMarker!],
                ),
            ],
          ),
          // Поле поиска
          Positioned(
            top: 10,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _searchController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Введите адрес...",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: _searchLocation,
                  ),
                ),
                onSubmitted: (_) => _searchLocation(),
              ),
            ),
          ),
          // Кнопки управления
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  backgroundColor: KColors.primary,
                  onPressed: _getCurrentLocation,
                  child: const Icon(Icons.my_location, color: Colors.white),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  backgroundColor: KColors.primary,
                  onPressed: _openInYandexMaps,
                  child: const Icon(Icons.map, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Проверка и запрос разрешений
  Future<void> _checkAndRequestPermissions() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        Get.snackbar('Ошибка', 'Необходимо включить GPS');
        return;
      }
    }

    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        Get.snackbar('Ошибка', 'Необходимо разрешение на геолокацию');
        return;
      }
    }
  }

  /// Получение текущего местоположения
  Future<void> _getCurrentLocation() async {
    try {
      LocationData locationData = await _location.getLocation();
      final LatLng newLocation =
          LatLng(locationData.latitude!, locationData.longitude!);

      setState(() {
        _currentPosition = newLocation;
        _updateDeliveryPoint(newLocation);
      });

      _mapController.move(newLocation, 14.0);

      Get.snackbar(
        'Успешно',
        'Местоположение определено: ${newLocation.latitude}, ${newLocation.longitude}',
      );
    } catch (e) {
      Get.snackbar('Ошибка', 'Не удалось получить текущее местоположение');
    }
  }

  /// Поиск местоположения по адресу
  Future<void> _searchLocation() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) {
      Get.snackbar('Ошибка', 'Введите адрес для поиска');
      return;
    }

    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      if (data.isNotEmpty) {
        final double lat = double.parse(data[0]['lat']);
        final double lon = double.parse(data[0]['lon']);
        final LatLng newLocation = LatLng(lat, lon);

        setState(() {
          _currentPosition = newLocation;
          _updateDeliveryPoint(newLocation);
        });

        _mapController.move(newLocation, 14.0);
        Get.snackbar('Успешно', 'Найден адрес: $query');
      } else {
        Get.snackbar('Ошибка', 'Адрес не найден');
      }
    } else {
      Get.snackbar('Ошибка', 'Ошибка при выполнении запроса');
    }
  }

  /// Открытие координат в Яндекс Картах
  Future<void> _openInYandexMaps() async {
    if (_currentPosition == null) {
      Get.snackbar('Ошибка', 'Сначала выберите местоположение');
      return;
    }

    final url =
        'https://yandex.ru/maps/?ll=${_currentPosition!.longitude},${_currentPosition!.latitude}&z=16';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar('Ошибка', 'Не удалось открыть Яндекс.Карты');
    }
  }

  /// Обновление точки доставки на карте
  void _updateDeliveryPoint(LatLng point) {
    setState(() {
      _deliveryMarker = Marker(
        point: point,
        width: 40,
        height: 40,
        child: const Icon(
          Icons.location_pin,
          color: Colors.red,
          size: 40,
        ),
      );
    });

    _mapController.move(point, 14.0);
    Get.snackbar('Точка выбрана', '${point.latitude}, ${point.longitude}');
  }
}
