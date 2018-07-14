import 'dart:async';
import 'package:grpc/grpc.dart' as grpc;
import 'package:open_exchange_rates/open_exchange_rates.dart';
import 'package:exchanger_server/protos/open_exchanger.pbgrpc.dart';

/// Checks if you are awesome. Spoiler: you are.

class OpenExchanger extends OpenExchangerServiceBase {
  String api_key = '';
  final QueryLatest latest = QueryLatest.get();
  final QueryCurrencies currencies = QueryCurrencies.get();
  final QueryHistorical historical = QueryHistorical.get();

  OpenExchanger();

  OpenExchanger.Set(String api_key) {
    this.api_key = api_key;
  }

  @override
  Stream<GrpcRate> getOxrLatest(
      grpc.ServiceCall call, OxrInput request) async* {
    latest.query.add(Params(
        api_key: api_key,
        base: request.base,
        symbols: request.symbols,
        prettyprint: request.prettyprint,
        show_alternative: request.showAlternative
    ));
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
  Stream<GrpcRate> getOxrHistorical(grpc.ServiceCall call, OxrInput request) async* {
    historical.query.add(Params(
        api_key: api_key,
        base: request.base,
        symbols: request.symbols,
        date: request.date,
        prettyprint: request.prettyprint,
        show_alternative: request.showAlternative
    ));
    await for (List<Rate> Rates in historical.results) {
      for (Rate rate in Rates) {
        final _rate = GrpcRate.create()
          ..currency = rate.currency
          ..ratio = rate.ratio.toDouble();
        yield _rate;
      }
    }
  }

  @override
  Stream<GrpcCurrency> getOxrCurrencies (grpc.ServiceCall call, OxrInput request) async* {
    currencies.query.add(Params(
        api_key: api_key,
        prettyprint: request.prettyprint,
        show_alternative: request.showAlternative,
        show_inactive: request.showInactive
    ));
    await for (List<Currency> Currencies in currencies.results) {
      for (Currency currency in Currencies) {
        final _currency = GrpcCurrency.create()
          ..currency = currency.currency
          ..name = currency.name;
        yield _currency;
      }
    }
  }
}

class Server {
  OpenExchanger openExchanger;
  Future<Null> main(List<String> args) async {
    openExchanger = new OpenExchanger.Set(args[0]);
    final server = new grpc.Server([openExchanger]);
    await server.serve(port: 8080);
    print('Server listening on port ${server.port}...');
  }
}
