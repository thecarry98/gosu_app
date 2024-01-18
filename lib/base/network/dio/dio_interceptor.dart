import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/local_data/pref_key.dart';

// const String token =
//     "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJHZUdVd3NxcVM2TXRaM0xuOW12NVFNRzBDQkJ4a0Jfc01zVmhPUHJHYThNIn0.eyJqdGkiOiJiZTQzMmM5Yy0zYzgyLTRjZDctYjkxMy03YTA5YWRmNDM3ZDEiLCJleHAiOjE2ODg3MTQ2ODUsIm5iZiI6MCwiaWF0IjoxNjg2MTIyNjg1LCJpc3MiOiJodHRwczovL3Nzby5tY2Jvb2tzLnZuL2F1dGgvcmVhbG1zL01DQk9PSyIsInN1YiI6IjZjOGIwZmQ2LWQ2NTUtNGMxZC1hZTI3LTE5NzJhNTIxNDg3OCIsInR5cCI6IkJlYXJlciIsImF6cCI6ImFkbWluLWNsaSIsImF1dGhfdGltZSI6MCwic2Vzc2lvbl9zdGF0ZSI6ImVkYjkwMDk1LTlhNzQtNGVlZC05MGM1LTk1ZWUwMGE4ZDJmYSIsImFjciI6IjEiLCJzY29wZSI6IiIsIm5hbWUiOiJUdeG6pW4gQW5oIiwicHJlZmVycmVkX3VzZXJuYW1lIjoidHVhbmFuaHZkMTk5OEBnbWFpbC5jb20iLCJnaXZlbl9uYW1lIjoiVHXhuqVuIiwiZmFtaWx5X25hbWUiOiJBbmgiLCJlbWFpbCI6InR1YW5hbmh2ZDE5OThAZ21haWwuY29tIn0.ECrgSxz3X9wv7gvm1KbSePMUc0A2svsepBBE_KKVenXTd4fTLCHKnfuGAuDBqxZIPJIPPn9V_4Uxohs_4A__w6k_H31n7LsnIK1SQx791ya2LG1m_ZrZBC2ZseDmZ3xOEGO-Hz2bThgSjwKyLXfbSiK0XBVwjlxYijrGsO1z1xi2T2hPx_pVKeW2R0dRdx50TF9ninDoVp-WNlUBOqBDVGII-Jg3VmAKGattVnWrLxrex-632uQcxFgy5u8O-LnspHiLQJUeD_dLCtplS0UEmw0pFLwSl1K0cFVIvpEfYYw4-LrGzO93-W4R3ATKirRgSus0dN9FM0L1XFUSa_B1vA";

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final Map<String, dynamic> header = {};
    final prefs = await SharedPreferences.getInstance();
    // header["X-RapidAPI-Key"] =
    // "78d211523bmsh34d9b38775ea89bp1f0570jsn3659220c752a";
    // header["X-RapidAPI-Host"] = "free-nba.p.rapidapi.com";
    final token = prefs.get(PrefKeys.token);
    if (token != null) {
      header['Authorization'] = "Bearer $token";
    }
    // const String tokenn = "7deb305a-c132-44fc-9fae-a080ddb391b2";
    // header['Authorization'] = "Bearer $token";
    // header['Tenant-Id'] = 1;
    header['Content-Type'] = 'application/json';
    final appId = Platform.isIOS ? 1 : 2;
    header['AppId'] = appId;
    //for web
    // header['Access-Control-Allow-Origin'] = '*';
    // getIt<LogUtils>().logI(header);
    final locale = prefs.get("locale");
    if (locale == "en_US") {
      header['lang'] = 'en';
    } else {
      header['lang'] = 'vi';
    }
    options.headers.addAll(header);
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // ErrorHandling.withError(error: err);
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
