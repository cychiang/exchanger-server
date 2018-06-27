///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart';

class LatestInput extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('LatestInput')
    ..aOS(1, 'base')
    ..aOS(2, 'symbols')
    ..aOB(3, 'prettyprint')
    ..aOB(4, 'showAlternative')
    ..hasRequiredFields = false
  ;

  LatestInput() : super();
  LatestInput.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LatestInput.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LatestInput clone() => new LatestInput()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static LatestInput create() => new LatestInput();
  static PbList<LatestInput> createRepeated() => new PbList<LatestInput>();
  static LatestInput getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyLatestInput();
    return _defaultInstance;
  }
  static LatestInput _defaultInstance;
  static void $checkItem(LatestInput v) {
    if (v is! LatestInput) checkItemFailed(v, 'LatestInput');
  }

  String get base => $_getS(0, '');
  set base(String v) { $_setString(0, v); }
  bool hasBase() => $_has(0);
  void clearBase() => clearField(1);

  String get symbols => $_getS(1, '');
  set symbols(String v) { $_setString(1, v); }
  bool hasSymbols() => $_has(1);
  void clearSymbols() => clearField(2);

  bool get prettyprint => $_get(2, false);
  set prettyprint(bool v) { $_setBool(2, v); }
  bool hasPrettyprint() => $_has(2);
  void clearPrettyprint() => clearField(3);

  bool get showAlternative => $_get(3, false);
  set showAlternative(bool v) { $_setBool(3, v); }
  bool hasShowAlternative() => $_has(3);
  void clearShowAlternative() => clearField(4);
}

class _ReadonlyLatestInput extends LatestInput with ReadonlyMessageMixin {}

class Rate extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('Rate')
    ..aOS(1, 'name')
    ..a<double>(2, 'value', PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Rate() : super();
  Rate.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Rate.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Rate clone() => new Rate()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static Rate create() => new Rate();
  static PbList<Rate> createRepeated() => new PbList<Rate>();
  static Rate getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyRate();
    return _defaultInstance;
  }
  static Rate _defaultInstance;
  static void $checkItem(Rate v) {
    if (v is! Rate) checkItemFailed(v, 'Rate');
  }

  String get name => $_getS(0, '');
  set name(String v) { $_setString(0, v); }
  bool hasName() => $_has(0);
  void clearName() => clearField(1);

  double get value => $_getN(1);
  set value(double v) { $_setFloat(1, v); }
  bool hasValue() => $_has(1);
  void clearValue() => clearField(2);
}

class _ReadonlyRate extends Rate with ReadonlyMessageMixin {}

class LatestOutput extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('LatestOutput')
    ..aOS(1, 'disclaimer')
    ..aOS(2, 'license')
    ..aInt64(3, 'timestamp')
    ..aOS(4, 'base')
    ..pp<Rate>(5, 'rates', PbFieldType.PM, Rate.$checkItem, Rate.create)
    ..hasRequiredFields = false
  ;

  LatestOutput() : super();
  LatestOutput.fromBuffer(List<int> i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  LatestOutput.fromJson(String i, [ExtensionRegistry r = ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  LatestOutput clone() => new LatestOutput()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static LatestOutput create() => new LatestOutput();
  static PbList<LatestOutput> createRepeated() => new PbList<LatestOutput>();
  static LatestOutput getDefault() {
    if (_defaultInstance == null) _defaultInstance = new _ReadonlyLatestOutput();
    return _defaultInstance;
  }
  static LatestOutput _defaultInstance;
  static void $checkItem(LatestOutput v) {
    if (v is! LatestOutput) checkItemFailed(v, 'LatestOutput');
  }

  String get disclaimer => $_getS(0, '');
  set disclaimer(String v) { $_setString(0, v); }
  bool hasDisclaimer() => $_has(0);
  void clearDisclaimer() => clearField(1);

  String get license => $_getS(1, '');
  set license(String v) { $_setString(1, v); }
  bool hasLicense() => $_has(1);
  void clearLicense() => clearField(2);

  Int64 get timestamp => $_getI64(2);
  set timestamp(Int64 v) { $_setInt64(2, v); }
  bool hasTimestamp() => $_has(2);
  void clearTimestamp() => clearField(3);

  String get base => $_getS(3, '');
  set base(String v) { $_setString(3, v); }
  bool hasBase() => $_has(3);
  void clearBase() => clearField(4);

  List<Rate> get rates => $_getList(4);
}

class _ReadonlyLatestOutput extends LatestOutput with ReadonlyMessageMixin {}

