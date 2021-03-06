import 'dart:convert';
import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:exchanger_server/oxr_export.dart';

class Client {
  ClientChannel channel;
  oxrClient stub;
  Future<Null> main(List<String> args) async {
    channel = new ClientChannel('0.0.0.0',
        port: 8080,
        options: const ChannelOptions(
            credentials: const ChannelCredentials.insecure()));
    stub = new oxrClient(channel,
        options: new CallOptions(timeout: new Duration(seconds: 30)));
    // Run all of the demos in order.
    try {
      OxrOutput output;
      output = await stub.get(new OxrInput()
        ..api = 'latest'
        ..base = 'TWD'
        ..symbols = 'JPY,USD,SEK,GBP');
      var message = json.decode(output.message);
      print('${message['rates']}');
    } catch (e) {
      print('Caught error: $e');
    }
    await channel.shutdown();
  }
}

main(List<String> args) async {
  await new Client().main(args);
}
