import 'dart:ffi';
import 'package:opencv_ffi/util/structs.dart';

typedef ImDecode = Pointer<DartMat> Function(Pointer<ImageData>);
