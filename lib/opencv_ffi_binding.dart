import 'dart:ffi';
import 'dart:io';
import 'package:opencv_ffi/util/c_functions.dart';
import 'package:opencv_ffi/util/structs.dart';
import './util/dart_functions.dart';

final DynamicLibrary opencvLib = Platform.isAndroid
    ? DynamicLibrary.open('libopencv_ffi.so')
    : DynamicLibrary.process();

final ImDecode bindImdecode =
    opencvLib.lookup<NativeFunction<Cimdecode>>('dart_imdecode').asFunction();
