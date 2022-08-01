import 'dart:ffi';

import 'package:opencv_ffi/util/structs.dart';

typedef Cimdecode = Pointer<DartMat> Function(Pointer<ImageData>);
