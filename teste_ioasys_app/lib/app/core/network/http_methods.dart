import 'package:flutter/material.dart';

enum HttpMethodName {GET, POST, DELETE, PUT, PATCH}

abstract class HttpMethod {
  HttpMethodName get methodName;
}

class Get implements HttpMethod {
  const Get({@required this.url});

  final String url;

  HttpMethodName get methodName => HttpMethodName.GET;
}

class Post implements HttpMethod {
  const Post({@required this.url, this.body});

  final String url;
  final dynamic body;

  HttpMethodName get methodName => HttpMethodName.POST;
}

class Delete implements HttpMethod {
  const Delete({@required this.url, this.body});

  final String url;
  final dynamic body;

  HttpMethodName get methodName => HttpMethodName.DELETE;
}

class Put implements HttpMethod {
  const Put({@required this.url, this.body});

  final String url;
  final dynamic body;

  HttpMethodName get methodName => HttpMethodName.PUT;
}

class Patch implements HttpMethod {
  const Patch({@required this.url, this.body});

  final String url;
  final dynamic body;

  HttpMethodName get methodName => HttpMethodName.PATCH;
}