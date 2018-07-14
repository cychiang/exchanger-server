# Exchanger Server

A gRPC server for Exchanger Flutter App.

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

## Usage

A simple usage example:

    dart bin/server.dart ${api_key}

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme

## Use gRPC with Dart
Install the protoc plugin for Dart 

    pub global activate protoc_plugin

Generate gRPC code

    protoc -I exchanger-protos/ exchanger-protos/protos/open_exchanger.proto --dart_out=grpc:lib/protos