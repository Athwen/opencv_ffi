import 'dart:ffi';

class ImageData extends Struct {
  @Int32()
  external int len;

  external Pointer<Uint8> bytes;
}

class DartMat extends Struct {
  @Int32()
  external int rows;

  @Int32()
  external int cols;

  @Int32()
  external int type;

  external Pointer<Uint8> bytes;
}
