import 'dart:async';
import 'package:grpc/grpc.dart' as grpc;
import 'package:open_exchange_rates/open_exchange_rates.dart' as Oxr;
import 'protos/oxr.pbgrpc.dart';

/// Checks if you are awesome. Spoiler: you are.

class OxrServer extends oxrServiceBase {
  Oxr.New oxr;
  OxrServer.Set(String api_key) {
    oxr = new Oxr.New(api_key);
  }

  @override
  Future<OxrOutput> get(grpc.ServiceCall call, OxrInput request) async {
    OxrOutput output = new OxrOutput();

    return output;
  }
}

class Server {
  OxrServer oxrServer;
  Future<Null> main(List<String> args) async {
    oxrServer = new OxrServer.Set(args[0]);
    final server = new grpc.Server([oxrServer]);
    await server.serve(port: 8080);
    print('Server listening on port ${server.port}...');
  }
}
