import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class StorageService {
  static const String _divesKey = 'dive_sessions';
  static const String _userProfileKey = 'user_profile';

  static Future<void> saveDiveSessions(List<Map<String, dynamic>> sessions) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(sessions);
      await prefs.setString(_divesKey, jsonString);
    } catch (e) {
      debugPrint('Error saving dive sessions: $e');
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> loadDiveSessions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_divesKey);
      if (jsonString == null || jsonString.isEmpty) return [];

      final List<dynamic> decoded = jsonDecode(jsonString);
      final List<Map<String, dynamic>> validSessions = [];
      
      for (var item in decoded) {
        if (item is Map<String, dynamic>) {
          if (_isValidDiveSession(item)) {
            validSessions.add(item);
          } else {
            debugPrint('Skipping invalid dive session: missing required fields');
          }
        }
      }
      
      if (validSessions.length < decoded.length) {
        await saveDiveSessions(validSessions);
      }
      
      return validSessions;
    } catch (e) {
      debugPrint('Error loading dive sessions: $e. Returning empty list.');
      await SharedPreferences.getInstance().then((prefs) => prefs.remove(_divesKey));
      return [];
    }
  }

  static bool _isValidDiveSession(Map<String, dynamic> session) {
    final requiredFields = ['id', 'userId', 'cliente', 'operadoraBuceo', 'lugarBuceo', 
      'tipoBuceo', 'horaEntrada', 'horaSalida', 'createdAt', 'updatedAt'];
    return requiredFields.every((field) => session.containsKey(field) && session[field] != null);
  }

  static Future<void> saveUserProfile(Map<String, dynamic> profile) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(profile);
      await prefs.setString(_userProfileKey, jsonString);
    } catch (e) {
      debugPrint('Error saving user profile: $e');
      rethrow;
    }
  }

  static Future<Map<String, dynamic>?> loadUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(_userProfileKey);
      if (jsonString == null || jsonString.isEmpty) return null;

      final decoded = jsonDecode(jsonString);
      if (decoded is Map<String, dynamic> && _isValidUserProfile(decoded)) {
        return decoded;
      }
      
      debugPrint('Invalid user profile data. Removing corrupted data.');
      await prefs.remove(_userProfileKey);
      return null;
    } catch (e) {
      debugPrint('Error loading user profile: $e. Returning null.');
      await SharedPreferences.getInstance().then((prefs) => prefs.remove(_userProfileKey));
      return null;
    }
  }

  static bool _isValidUserProfile(Map<String, dynamic> profile) {
    final requiredFields = ['id', 'name', 'email', 'createdAt', 'updatedAt'];
    return requiredFields.every((field) => profile.containsKey(field) && profile[field] != null);
  }

  static Future<void> clearAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    } catch (e) {
      debugPrint('Error clearing storage: $e');
      rethrow;
    }
  }
}
