///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes

import 'dart:async';

import 'package:grpc/grpc.dart';

import 'open_exchanger.pb.dart';
export 'open_exchanger.pb.dart';

class OpenExchangerClient extends Client {
  static final _$getLatest = new ClientMethod<LatestInput, LatestOutput>(
      '/openexchanger.OpenExchanger/GetLatest',
      (LatestInput value) => value.writeToBuffer(),
      (List<int> value) => new LatestOutput.fromBuffer(value));

  OpenExchangerClient(ClientChannel channel, {CallOptions options})
      : super(channel, options: options);

  ResponseFuture<LatestOutput> getLatest(LatestInput request,
      {CallOptions options}) {
    final call = $createCall(_$getLatest, new Stream.fromIterable([request]),
        options: options);
    return new ResponseFuture(call);
  }
}

abstract class OpenExchangerServiceBase extends Service {
  String get $name => 'openexchanger.OpenExchanger';

  OpenExchangerServiceBase() {
    $addMethod(new ServiceMethod<LatestInput, LatestOutput>(
        'GetLatest',
        getLatest_Pre,
        false,
        false,
        (List<int> value) => new LatestInput.fromBuffer(value),
        (LatestOutput value) => value.writeToBuffer()));
  }

  Future<LatestOutput> getLatest_Pre(ServiceCall call, Future request) async {
    return getLatest(call, await request);
  }

  Future<LatestOutput> getLatest(ServiceCall call, LatestInput request);
}
