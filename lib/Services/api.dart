import 'dart:convert';
import 'dart:io';
import 'package:flutter_application_3/Models/user_model.dart';
import 'package:flutter_application_3/Services/sharedprefrences.dart';
import 'package:flutter_application_3/alerts.dart';
import 'package:flutter_application_3/bottom_screens/home_layout.dart';
import 'package:flutter_application_3/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String _baseUrl = 'https://radiant-falls-92419.herokuapp.com';

  static Future<Map<String, String>> _getHeaders() async {
    final token = await SharedPrefrencesStorage.getSavedToken();
    return {"Accept": "application/json", "Authorization": "Bearer $token"};
  }

  static Future<Map> login(
    String email,
    String password, {
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await post(
          Uri.parse(_baseUrl +
              '/api/${isDoctor ? "doctor" : "student"}/login?email=$email&password=$password'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        String token = parsed['data']['token'];
        await SharedPrefrencesStorage.saveToken(token);
        final user = UserModel.fromJson(parsed['data']);
        await SharedPrefrencesStorage.saveUser(jsonEncode(user.toJson()));
        Get.offAll(() => const HomeLayOut());
        return {};
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> uploadStudentPhoto(
    File image, {
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) Alerts.showLoading();

      http.MultipartRequest request = http.MultipartRequest(
        "POST",
        Uri.parse(_baseUrl + '/api/student/update-picture'),
      );

      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('photo', image.path);

      request.files.add(multipartFile);
      request.headers.addAll(await _getHeaders());

      final responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);
      final parsed = jsonDecode(response.body);

      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        final user = UserModel.fromJson(parsed['data']);
        await SharedPrefrencesStorage.saveUser(jsonEncode(user.toJson()));
        Alerts.showSnackBar(msg: parsed['message'], isError: false);
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> changeStudentPassword(String newPassword,
      {bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await put(
          Uri.parse(
              _baseUrl + '/api/student/change-password?password=$newPassword'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> logout({bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await post(Uri.parse(_baseUrl + '/api/student/logout'),
          encoding: Encoding.getByName('utf-8'), headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      }
      // Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> deleteProfileImage({bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await delete(
          Uri.parse(_baseUrl + '/api/student/delete-picture'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        final user = UserModel.fromJson(parsed['data']);
        await SharedPrefrencesStorage.saveUser(jsonEncode(user.toJson()));
        Alerts.showSnackBar(msg: parsed['message'], isError: false);
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> getProfile(String newPassword,
      {bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await get(Uri.parse(_baseUrl + '/api/student/profile'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> addSubject(
    String subjectName,
    String oralDegree,
    String practicalDegree,
    String midTermDegree,
    String finalDegree,
    String yearId,
    String nOfHours,
    File image, {
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) Alerts.showLoading();
      http.MultipartRequest request = http.MultipartRequest(
        "POST",
        Uri.parse(_baseUrl +
            '/api/doctor/insert-subject?subject_name=$subjectName&oral_degree=$oralDegree&practical_degree=$practicalDegree&midTerm_degree=$midTermDegree&final_degree=$finalDegree&year_id=$yearId&No_of_hours=$nOfHours'),
      );

      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('file', image.path);
      request.files.add(multipartFile);
      request.headers.addAll(await _getHeaders());

      final responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);

      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      bool isSuccess = response.statusCode == 200;
      Alerts.showSnackBar(msg: parsed['message'], isError: !isSuccess);
      return parsed['data'] ?? {};
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> deleteSubject(String subjectId,
      {bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await delete(
          Uri.parse(_baseUrl + '/api/doctor/delete-subject/$subjectId'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        Alerts.showSnackBar(msg: parsed['message'], isError: false);
        return parsed['data'] ?? {};
      } else {
        Alerts.showSnackBar(msg: parsed['message']);
      }
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<List> getHome() async {
    try {
      final response = await get(
          Uri.parse(_baseUrl +
              (isDoctor
                  ? "/api/doctor/show-doctor-subject"
                  : "/api/student/subjects")),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      Alerts.showSnackBar();
    }
    return [];
  }

  static Future<List> getPosts(String subjectId) async {
    try {
      final response = await get(
          Uri.parse(_baseUrl +
              (isDoctor
                  ? "/api/doctor/show-post-subject/$subjectId"
                  : "/api/student/show-post-subject/$subjectId")),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      } else {
        Alerts.showSnackBar(msg: parsed['message']);
      }
    } catch (e) {
      Alerts.showSnackBar();
    }
    return [];
  }

  static Future<List> getComments(String postId) async {
    try {
      final response = await get(
          Uri.parse(_baseUrl +
              "/api/${isDoctor ? 'doctor' : 'student'}/show-comments/$postId"),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (response.statusCode == 200 && parsed['status'] == 200) {
        return parsed['data'];
      } else {
        Alerts.showSnackBar(msg: parsed['message']);
      }
    } catch (e) {
      Alerts.showSnackBar();
    }
    return [];
  }

  static Future<Map> addPost(
      File? image, String title, String body, String subjectId, String postId,
      {bool showLoading = false, bool update = false}) async {
    try {
      if (showLoading) Alerts.showLoading();

      http.MultipartRequest request = http.MultipartRequest(
        "POST",
        Uri.parse(
          _baseUrl +
              '/api/doctor/${update ? "update-post/$postId" : "insert-post"}?title=$title&body=$body&subject_id=$subjectId',
        ),
      );
      if (image != null) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('file', image.path);
        request.files.add(multipartFile);
      }
      request.headers.addAll(await _getHeaders());

      final responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);
      final parsed = jsonDecode(response.body);

      if (showLoading) Get.back();

      if (response.statusCode == 200 && parsed['status'] == 200) {
        Alerts.showSnackBar(msg: parsed['message'], isError: false);
        return parsed['data'];
      } else {
        Alerts.showSnackBar(msg: parsed['message']);
      }
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> updatePost(
    File? image,
    String title,
    String body,
    String subjectId,
    String postId, {
    bool showLoading = false,
  }) async {
    return await addPost(image, title, body, subjectId, postId,
        showLoading: showLoading, update: true);
  }

  static Future<Map> deletePost(String postId,
      {bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await delete(
          Uri.parse(_baseUrl + '/api/doctor/delete-post/$postId'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        Alerts.showSnackBar(msg: parsed['message'], isError: false);
      } else {
        Alerts.showSnackBar(msg: parsed['message']);
      }
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

  static Future<Map> deleteCmment(String commentId,
      {bool showLoading = false}) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await delete(
          Uri.parse(_baseUrl +
              '/api/${isDoctor ? 'doctor' : 'student'}/delete-comment/$commentId'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        Alerts.showSnackBar(msg: parsed['message'], isError: false);
      } else {
        Alerts.showSnackBar(msg: parsed['message']);
      }
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }

//Subjects name ,Subject Duration
  //

  static Future<Map> addComment(
    String postId,
    String comment, {
    bool showLoading = false,
  }) async {
    try {
      if (showLoading) Alerts.showLoading();
      final response = await post(
          Uri.parse(_baseUrl +
              '/api/${isDoctor ? 'doctor' : 'student'}/insert-comment?comment=$comment&post_id=$postId'),
          encoding: Encoding.getByName('utf-8'),
          headers: await _getHeaders());
      final parsed = jsonDecode(response.body);
      if (showLoading) Get.back();
      if (response.statusCode == 200 && parsed['status'] == 200) {
        Alerts.showSnackBar(msg: parsed['message'], isError: false);
        return parsed['data'];
      }
      Alerts.showSnackBar(msg: parsed['message']);
    } catch (e) {
      if (showLoading) Get.back();
      Alerts.showSnackBar();
    }
    return {};
  }
  // static Future<Map> addQuiz(
  //   String subjectId,
  //   String pointsNumber,
  //   String notes,
  //   String totalDegree,
  //   String duration, {
  //   bool showLoading = false,
  // }) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await post(
  //         Uri.parse(_baseUrl +
  //             '/api/doctor/insert-quiz?subject_id=$subjectId&pointsNumber=$pointsNumber&notes=$notes&totalDegree=$totalDegree&duration=$duration'),
  //         encoding: Encoding.getByName('utf-8'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       Alerts.showSnackBar(msg: parsed['message'], isError: false);
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }

  // static Future<Map> updateQuiz(
  //   String subjectId,
  //   String pointsNumber,
  //   String notes,
  //   String totalDegree,
  //   String duration, {
  //   bool showLoading = false,
  // }) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await put(
  //         Uri.parse(_baseUrl +
  //             '/api/doctor/insert-quiz?subject_id=$subjectId&pointsNumber=$pointsNumber&notes=$notes&totalDegree=$totalDegree&duration=$duration'),
  //         encoding: Encoding.getByName('utf-8'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       Alerts.showSnackBar(msg: parsed['message'], isError: false);
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }

  // static Future<Map> deleteQuiz(String quizId,
  //     {bool showLoading = false}) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await delete(
  //         Uri.parse(_baseUrl + '/api/doctor/delete-quiz/$quizId'),
  //         encoding: Encoding.getByName('utf-8'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       Alerts.showSnackBar(msg: parsed['message'], isError: false);
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }

  // static Future<Map> getQuizbysubjectId(String subjectId,
  //     {bool showLoading = false}) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await get(
  //         Uri.parse(_baseUrl + '/api/doctor/subject-quizes/$subjectId'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }

  // static Future<Map> getQuizbyId(String id, {bool showLoading = false}) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await get(
  //         Uri.parse(_baseUrl + '/api/doctor/show-quize/$id'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }

  // static Future<Map> getQuizbDegreeyId(String id,
  //     {bool showLoading = false}) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await get(
  //         Uri.parse(_baseUrl + '/api/doctor/quize-degrees/$id'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }

  // static Future<Map> updateQuizStatus(
  //   String status, {
  //   bool showLoading = false,
  // }) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await put(
  //         Uri.parse(
  //             _baseUrl + '/api/doctor/update-quiz-status/2?status=$status'),
  //         encoding: Encoding.getByName('utf-8'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       Alerts.showSnackBar(msg: parsed['message'], isError: false);
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }

  // static Future<Map> addQuestion(
  //   String question,
  //   String choice1,
  //   String rightAnswer,
  //   String pointDegree,
  //   String quizeId,
  //   String choice2,
  //   String choice4,
  //   String choice3, {
  //   bool showLoading = false,
  // }) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await post(
  //         Uri.parse(_baseUrl +
  //             '/api/doctor/insert-question?question=$question&choice[0]=$choice1&right_answer=$rightAnswer&pointDegree=$pointDegree&quize_id=$quizeId&choice[1]=$choice2&choice[2]=$choice3&choice[3]=$choice4'),
  //         encoding: Encoding.getByName('utf-8'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       Alerts.showSnackBar(msg: parsed['message'], isError: false);
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }

  // static Future<Map> updateQuestion(
  //   String question,
  //   String choice1,
  //   String rightAnswer,
  //   String pointDegree,
  //   String quizeId,
  //   String choice2,
  //   String choice4,
  //   String choice3, {
  //   bool showLoading = false,
  // }) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await put(
  //         Uri.parse(_baseUrl +
  //             '/api/doctor/insert-question?question=$question&choice[0]=$choice1&right_answer=$rightAnswer&pointDegree=$pointDegree&quize_id=$quizeId&choice[1]=$choice2&choice[2]=$choice3&choice[3]=$choice4'),
  //         encoding: Encoding.getByName('utf-8'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       Alerts.showSnackBar(msg: parsed['message'], isError: false);
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }

  // static Future<Map> deleteQuestion(String questionId,
  //     {bool showLoading = false}) async {
  //   try {
  //     if (showLoading) Alerts.showLoading();
  //     final response = await delete(
  //         Uri.parse(_baseUrl + '/api/doctor/delete-question/$questionId'),
  //         encoding: Encoding.getByName('utf-8'),
  //         headers: await _getHeaders());
  //     final parsed = jsonDecode(response.body);
  //     if (showLoading) Get.back();
  //     if (response.statusCode == 200 && parsed['status'] == 200) {
  //       Alerts.showSnackBar(msg: parsed['message'], isError: false);
  //       return parsed['data'];
  //     }
  //     Alerts.showSnackBar(msg: parsed['message']);
  //   } catch (e) {
  //     if (showLoading) Get.back();
  //     Alerts.showSnackBar();
  //   }
  //   return {};
  // }
}
