import 'dart:convert';

import 'package:amazone_clone_tutorial/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackbar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      showSnackbar(context, jsonDecode(response.body)['msg']);
      break;
    default:
      showSnackbar(context, response.body);
  }
}
