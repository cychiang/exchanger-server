import 'dart:async';
import 'package:grpc/grpc.dart' as grpc;
import 'package:open_exchange_rates/open_exchange_rates.dart';
import 'generated/protos/open_exchanger.pbgrpc.dart';

/// Checks if you are awesome. Spoiler: you are.

class OpenExchanger extends OpenExchangerServiceBase {
  final String api_key = 'api_key';
  final QueryLatest latest = QueryLatest.get();
  final QueryCurrencies currencies = QueryCurrencies.get();
  final QueryHistorical historical = QueryHistorical.get();

  @override
  Stream<GrpcRate> getOxrLatest(
      grpc.ServiceCall call, OxrInput request) async* {
    latest.query.add(Params(api_key: api_key));
    await for (List<Rate> Rates in latest.results) {
      for (Rate rate in Rates) {
        final _rate = GrpcRate.create()
          ..currency = rate.currency
          ..ratio = rate.ratio.toDouble();
        yield _rate;
      }
    }
  }

  @override
  Stream<GrpcRate> getOxrHistorical(grpc.ServiceCall call, OxrInput request) {
    // TODO: implement getOxrHistorical
    return null;
  }

  @override
  Stream<GrpcCurrency> getOxrCurrencies(
      grpc.ServiceCall call, OxrInput request) {
    // TODO: implement getOxrCurrencies
    return null;
  }
}

class Server {
  final openExchanger = new OpenExchanger();
  Future<Null> main(List<String> args) async {
    final server = new grpc.Server([openExchanger]);
    await server.serve(port: 8080);
    print('Server listening on port ${server.port}...');
  }
}
