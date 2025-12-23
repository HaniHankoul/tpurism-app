import 'package:dio/dio.dart';
import 'package:travel/models/attraction_model.dart';
import 'package:travel/models/trip_model.dart';

class AttractionsRepository{
  final Dio _dio;

  // You can customize Dio instance based on your needs
  AttractionsRepository({Dio? dio})
      : _dio = dio ??
      Dio(BaseOptions(
        baseUrl: 'http://travels1.runasp.net',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ));
  Future<List<AttractionModel>> getAllAttractions() async {
    try {
      final response = await _dio.get('/AttractionConrtoller/GetAllAttractions');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data;
        print('object4');
        return jsonList.map((json) => AttractionModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load scholars: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load scholars: $e');
    }
  }

  // Get single scholar by ID
  Future<AttractionModel> getAttractionsById(int id) async {
    try {
      final response = await _dio.get('/AttractionConrtoller/GetAllAttractions$id');

      if (response.statusCode == 200) {
        print('Response data: ${response.data}'); // Debug print

        // Check if response.data is a List
        if (response.data is List) {
          final List<dynamic> dataList = response.data;

          if (dataList.isEmpty) {
            throw Exception('No trip found with id: $id');
          }

          // Assuming the list contains the trip as the first element
          // OR find by id in the list if it contains multiple items
          final tripData = dataList[0]; // Takes first element

          // If list might contain multiple and you need to find by id:
          // final tripData = dataList.firstWhere(
          //   (item) => item['id'] == id,
          //   orElse: () => throw Exception('Trip not found')
          // );

          return AttractionModel.fromJson(tripData);
        } else if (response.data is Map) {
          // If it's already a Map (object)
          return AttractionModel.fromJson(response.data);
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to load id1: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      throw Exception('Failed to load id: $e');
    }
  }


  // Error handler for Dio exceptions
  String _handleDioError(DioException e) {
    if (e.response != null) {
      return 'Server error: ${e.response?.statusCode} - ${e.response?.statusMessage}';
    } else if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return 'Receive timeout';
    } else if (e.type == DioExceptionType.sendTimeout) {
      return 'Send timeout';
    } else if (e.type == DioExceptionType.connectionError) {
      return 'Connection error';
    } else if (e.type == DioExceptionType.cancel) {
      return 'Request cancelled';
    } else {
      return 'Network error: ${e.message}';
    }
  }

  // You can also add interceptors if needed
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }
}
