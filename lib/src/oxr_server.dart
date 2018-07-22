import 'dart:async';
import 'dart:convert';
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
  Future<OxrOutput> get(grpc.ServiceCall call, OxrInput input) async {
    int status = 200;
    switch (input.api.toString()) {
      case 'latest':
        String jsonObj = json.encode(await oxr.latest
            .Get(
                base: input.base,
                symbols: input.symbols,
                prettyprint: input.prettyprint,
                show_alternative: input.showAlternative)
            .catchError(() => status = 500));
        return new OxrOutput()
          ..message = jsonObj
          ..status = status;
      case 'historical':
        String jsonObj = json.encode(await oxr.historical
            .Get(
                date: input.date,
                base: input.base,
                symbols: input.symbols,
                show_alternative: input.showAlternative,
                prettyprint: input.prettyprint)
            .catchError(() => status = 500));
        return new OxrOutput()
          ..message = jsonObj
          ..status = status;
      case 'currencies':
        String jsonObj = json.encode(await oxr.currencies
            .Get(
                prettyprint: input.prettyprint,
                show_alternative: input.showAlternative,
                show_inactive: input.showInactive)
            .catchError(() => status = 500));
        return new OxrOutput()
          ..message = jsonObj
          ..status = status;
      case 'time-series':
        String jsonObj = json.encode(await oxr.timeseries
            .Get(
                start: input.start,
                end: input.end,
                base: input.base,
                symbols: input.symbols,
                show_alternative: input.showAlternative,
                prettyprint: input.prettyprint)
            .catchError(() => status = 500));
        return new OxrOutput()
          ..message = jsonObj
          ..status = status;
      case 'convert':
        String jsonObj = json.encode(await oxr.convert
            .Get(
                value: input.value,
                from: input.from,
                to: input.to,
                prettyprint: input.prettyprint)
            .catchError(() => status = 500));
        return new OxrOutput()
          ..message = jsonObj
          ..status = status;
      default:
        return new OxrOutput()
          ..status = 500
          ..message = "{'message':'No such method ${input.api}'}";
    }
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
