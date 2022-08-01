import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:image/image.dart' as imgLib;
import 'package:opencv_ffi/util/structs.dart';
import 'dart:ffi';
import 'opencv_ffi_binding.dart';

class NativeCV {
  void imdecode(
    Uint8List data,
  ) {
    final Pointer<ImageData> imgData =
        malloc.allocate<ImageData>(sizeOf<ImageData>());

    Uint8List buf = data;

    imgData.ref.len = buf.length;
    imgData.ref.bytes = malloc.allocate<Uint8>(sizeOf<Uint8>() * buf.length);
    //3168659
    print(imgData.ref.len);
    print(imgData.ref.bytes.value);

    for (int i = 0; i < buf.length; i++) {
      imgData.ref.bytes.elementAt(i).value = buf[i];
    }

    print("before calling ffi funcion");
    Pointer<DartMat> retv = bindImdecode(imgData);
    print("after calling ffi funcion");
    print(retv.ref.rows);
    print(retv.ref.cols);
    print(retv.ref.bytes.asTypedList(buf.length));
  }
}
