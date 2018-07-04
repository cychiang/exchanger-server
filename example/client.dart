import 'dart:async';
import 'package:grpc/grpc.dart';
import '../lib/src/generated/protos/open_exchanger.pb.dart';
import '../lib/src/generated/protos/open_exchanger.pbgrpc.dart';

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
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }

  Future<Null> runGetOxrLatest() async {
    final request = new OxrInput();

    await for (var rate in stub.getOxrLatest(request)) {
      print('${rate.currency}: ${rate.ratio}');
    }
  }
}

main(List<String> args) async {
  await new Client().main(args);
}
