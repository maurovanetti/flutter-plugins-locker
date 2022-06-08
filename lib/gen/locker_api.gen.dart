// Autogenerated from Pigeon (v3.1.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name
// @dart = 2.12
import 'dart:async';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

import 'package:flutter/foundation.dart' show WriteBuffer, ReadBuffer;
import 'package:flutter/services.dart';

class RetrieveSecretRequest {
  RetrieveSecretRequest({
    required this.key,
    required this.androidPrompt,
    required this.iOsPrompt,
  });

  String key;
  AndroidPrompt androidPrompt;
  IOsPrompt iOsPrompt;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['key'] = key;
    pigeonMap['androidPrompt'] = androidPrompt.encode();
    pigeonMap['iOsPrompt'] = iOsPrompt.encode();
    return pigeonMap;
  }

  static RetrieveSecretRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return RetrieveSecretRequest(
      key: pigeonMap['key']! as String,
      androidPrompt: AndroidPrompt.decode(pigeonMap['androidPrompt']!)
,
      iOsPrompt: IOsPrompt.decode(pigeonMap['iOsPrompt']!)
,
    );
  }
}

class SaveSecretRequest {
  SaveSecretRequest({
    required this.key,
    required this.secret,
    required this.androidPrompt,
  });

  String key;
  String secret;
  AndroidPrompt androidPrompt;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['key'] = key;
    pigeonMap['secret'] = secret;
    pigeonMap['androidPrompt'] = androidPrompt.encode();
    return pigeonMap;
  }

  static SaveSecretRequest decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return SaveSecretRequest(
      key: pigeonMap['key']! as String,
      secret: pigeonMap['secret']! as String,
      androidPrompt: AndroidPrompt.decode(pigeonMap['androidPrompt']!)
,
    );
  }
}

class AndroidPrompt {
  AndroidPrompt({
    required this.title,
    required this.cancelLabel,
    this.description,
  });

  String title;
  String cancelLabel;
  String? description;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['title'] = title;
    pigeonMap['cancelLabel'] = cancelLabel;
    pigeonMap['description'] = description;
    return pigeonMap;
  }

  static AndroidPrompt decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return AndroidPrompt(
      title: pigeonMap['title']! as String,
      cancelLabel: pigeonMap['cancelLabel']! as String,
      description: pigeonMap['description'] as String?,
    );
  }
}

class IOsPrompt {
  IOsPrompt({
    required this.touchIdText,
  });

  String touchIdText;

  Object encode() {
    final Map<Object?, Object?> pigeonMap = <Object?, Object?>{};
    pigeonMap['touchIdText'] = touchIdText;
    return pigeonMap;
  }

  static IOsPrompt decode(Object message) {
    final Map<Object?, Object?> pigeonMap = message as Map<Object?, Object?>;
    return IOsPrompt(
      touchIdText: pigeonMap['touchIdText']! as String,
    );
  }
}

class _PigeonApiCodec extends StandardMessageCodec {
  const _PigeonApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AndroidPrompt) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else 
    if (value is IOsPrompt) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else 
    if (value is RetrieveSecretRequest) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else 
    if (value is SaveSecretRequest) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else 
{
      super.writeValue(buffer, value);
    }
  }
  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:       
        return AndroidPrompt.decode(readValue(buffer)!);
      
      case 129:       
        return IOsPrompt.decode(readValue(buffer)!);
      
      case 130:       
        return RetrieveSecretRequest.decode(readValue(buffer)!);
      
      case 131:       
        return SaveSecretRequest.decode(readValue(buffer)!);
      
      default:      
        return super.readValueOfType(type, buffer);
      
    }
  }
}

class PigeonApi {
  /// Constructor for [PigeonApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  PigeonApi({BinaryMessenger? binaryMessenger}) : _binaryMessenger = binaryMessenger;

  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _PigeonApiCodec();

  Future<bool> canAuthenticate() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PigeonApi.canAuthenticate', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(null) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as bool?)!;
    }
  }

  Future<bool> save(SaveSecretRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PigeonApi.save', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as bool?)!;
    }
  }

  Future<String> retrieve(RetrieveSecretRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PigeonApi.retrieve', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_request]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else if (replyMap['result'] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyMap['result'] as String?)!;
    }
  }

  Future<void> delete(String arg_key) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.PigeonApi.delete', codec, binaryMessenger: _binaryMessenger);
    final Map<Object?, Object?>? replyMap =
        await channel.send(<Object?>[arg_key]) as Map<Object?, Object?>?;
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyMap['error'] != null) {
      final Map<Object?, Object?> error = (replyMap['error'] as Map<Object?, Object?>?)!;
      throw PlatformException(
        code: (error['code'] as String?)!,
        message: error['message'] as String?,
        details: error['details'],
      );
    } else {
      return;
    }
  }
}
