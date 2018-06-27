// TODO: Put public facing types in this file.

import 'dart:async';
import 'package:grpc/grpc.dart' as grpc;
import 'generated/open_exchanger.pb.dart';
import 'generated/open_exchanger.pbgrpc.dart';

/// Checks if you are awesome. Spoiler: you are.
class OpenExchanger extends OpenExchangerServiceBase {
  @override
  Future<LatestOutput> getLatest(grpc.ServiceCall call, LatestInput input) async {
    return new LatestOutput()
      ..base='Hello again'
      ..disclaimer='Hello';
  }
}

class Server {
  Future<Null> main(List<String> args) async {
    final server = new grpc.Server([new OpenExchanger()]);
    await server.serve(port: 8080);
    print('Server listening on port ${server.port}...');
  }
}