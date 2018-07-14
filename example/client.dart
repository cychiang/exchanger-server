import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:exchanger_server/protos/open_exchanger.pb.dart';
import 'package:exchanger_server/protos/open_exchanger.pbgrpc.dart';

class Client {
  ClientChannel channel;
  OpenExchangerClient stub;
  Future<Null> main(List<String> args) async {
    channel = new ClientChannel('0.0.0.0',
        port: 8080,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    stub = new OpenExchangerClient(channel,
        options: new CallOptions(timeout: new Duration(seconds: 30)));
    // Run all of the demos in order.
    try {
      await runGetOxrLatest();
//      await runGetOxrHistorical();
//      await runGetCurrencies();
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }

  Future<Null> runGetOxrLatest() async {
    final request = new OxrInput()..symbols="JPY,TWD";
    await for (GrpcRate rate in stub.getOxrLatest(request)) {
      print('${rate.currency}: ${rate.ratio}');
    }
  }
  Future<Null> runGetOxrHistorical() async {
    final request = new OxrInput()..date='2018-07-01';
    await for (GrpcRate rate in stub.getOxrHistorical(request)) {
      print('${rate.currency}: ${rate.ratio}');
    }
  }
  Future<Null> runGetCurrencies() async {
    final request = new OxrInput();
    await for (GrpcCurrency currency in stub.getOxrCurrencies(request)) {
      print('${currency.currency}: ${currency.name}');
    }
  }
}

main(List<String> args) async {
  await new Client().main(args);
}
