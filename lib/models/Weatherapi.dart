/// product : "astro"
/// init : "2022082106"
/// dataseries : [{"timepoint":3,"cloudcover":9,"seeing":6,"transparency":4,"lifted_index":-4,"rh2m":7,"wind10m":{"direction":"S","speed":2},"temp2m":32,"prec_type":"rain"},{"timepoint":6,"cloudcover":8,"seeing":6,"transparency":4,"lifted_index":-4,"rh2m":9,"wind10m":{"direction":"S","speed":2},"temp2m":30,"prec_type":"rain"},{"timepoint":9,"cloudcover":8,"seeing":6,"transparency":5,"lifted_index":-4,"rh2m":10,"wind10m":{"direction":"S","speed":2},"temp2m":29,"prec_type":"none"},{"timepoint":12,"cloudcover":7,"seeing":6,"transparency":6,"lifted_index":-4,"rh2m":11,"wind10m":{"direction":"S","speed":2},"temp2m":28,"prec_type":"none"},{"timepoint":15,"cloudcover":9,"seeing":6,"transparency":6,"lifted_index":-4,"rh2m":12,"wind10m":{"direction":"SW","speed":2},"temp2m":28,"prec_type":"none"},{"timepoint":18,"cloudcover":9,"seeing":6,"transparency":5,"lifted_index":-4,"rh2m":11,"wind10m":{"direction":"W","speed":2},"temp2m":28,"prec_type":"none"},{"timepoint":21,"cloudcover":8,"seeing":6,"transparency":4,"lifted_index":-4,"rh2m":7,"wind10m":{"direction":"SW","speed":2},"temp2m":32,"prec_type":"rain"},{"timepoint":24,"cloudcover":9,"seeing":6,"transparency":3,"lifted_index":-4,"rh2m":6,"wind10m":{"direction":"W","speed":2},"temp2m":35,"prec_type":"rain"},{"timepoint":27,"cloudcover":9,"seeing":6,"transparency":3,"lifted_index":-4,"rh2m":6,"wind10m":{"direction":"W","speed":2},"temp2m":34,"prec_type":"rain"},{"timepoint":30,"cloudcover":9,"seeing":6,"transparency":4,"lifted_index":-6,"rh2m":8,"wind10m":{"direction":"W","speed":2},"temp2m":33,"prec_type":"rain"},{"timepoint":33,"cloudcover":2,"seeing":6,"transparency":4,"lifted_index":-4,"rh2m":10,"wind10m":{"direction":"SW","speed":2},"temp2m":31,"prec_type":"none"},{"timepoint":36,"cloudcover":6,"seeing":6,"transparency":5,"lifted_index":-4,"rh2m":11,"wind10m":{"direction":"SW","speed":2},"temp2m":29,"prec_type":"none"},{"timepoint":39,"cloudcover":5,"seeing":6,"transparency":5,"lifted_index":-4,"rh2m":11,"wind10m":{"direction":"W","speed":2},"temp2m":28,"prec_type":"none"},{"timepoint":42,"cloudcover":5,"seeing":6,"transparency":5,"lifted_index":-4,"rh2m":11,"wind10m":{"direction":"W","speed":2},"temp2m":30,"prec_type":"none"},{"timepoint":45,"cloudcover":2,"seeing":6,"transparency":4,"lifted_index":-6,"rh2m":7,"wind10m":{"direction":"NW","speed":2},"temp2m":34,"prec_type":"none"},{"timepoint":48,"cloudcover":2,"seeing":6,"transparency":3,"lifted_index":-6,"rh2m":4,"wind10m":{"direction":"NW","speed":2},"temp2m":37,"prec_type":"none"},{"timepoint":51,"cloudcover":2,"seeing":6,"transparency":3,"lifted_index":-4,"rh2m":3,"wind10m":{"direction":"NW","speed":2},"temp2m":37,"prec_type":"none"},{"timepoint":54,"cloudcover":3,"seeing":7,"transparency":3,"lifted_index":-4,"rh2m":4,"wind10m":{"direction":"NW","speed":2},"temp2m":35,"prec_type":"none"},{"timepoint":57,"cloudcover":9,"seeing":6,"transparency":4,"lifted_index":-4,"rh2m":9,"wind10m":{"direction":"E","speed":2},"temp2m":29,"prec_type":"rain"},{"timepoint":60,"cloudcover":9,"seeing":6,"transparency":4,"lifted_index":-1,"rh2m":9,"wind10m":{"direction":"W","speed":2},"temp2m":29,"prec_type":"rain"},{"timepoint":63,"cloudcover":9,"seeing":6,"transparency":4,"lifted_index":-4,"rh2m":10,"wind10m":{"direction":"N","speed":2},"temp2m":29,"prec_type":"rain"},{"timepoint":66,"cloudcover":8,"seeing":6,"transparency":4,"lifted_index":-4,"rh2m":9,"wind10m":{"direction":"N","speed":2},"temp2m":30,"prec_type":"rain"},{"timepoint":69,"cloudcover":9,"seeing":6,"transparency":3,"lifted_index":-4,"rh2m":5,"wind10m":{"direction":"N","speed":2},"temp2m":34,"prec_type":"rain"},{"timepoint":72,"cloudcover":8,"seeing":6,"transparency":3,"lifted_index":-4,"rh2m":3,"wind10m":{"direction":"N","speed":2},"temp2m":38,"prec_type":"rain"}]

class Weatherapi {
  Weatherapi({
      String? product, 
      String? init, 
      List<Dataseries>? dataseries,}){
    _product = product;
    _init = init;
    _dataseries = dataseries;
}

  Weatherapi.fromJson(dynamic json) {
    _product = json['product'];
    _init = json['init'];
    if (json['dataseries'] != null) {
      _dataseries = [];
      json['dataseries'].forEach((v) {
        _dataseries?.add(Dataseries.fromJson(v));
      });
    }
  }
  String? _product;
  String? _init;
  List<Dataseries>? _dataseries;

  String? get product => _product;
  String? get init => _init;
  List<Dataseries>? get dataseries => _dataseries;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product'] = _product;
    map['init'] = _init;
    if (_dataseries != null) {
      map['dataseries'] = _dataseries?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// timepoint : 3
/// cloudcover : 9
/// seeing : 6
/// transparency : 4
/// lifted_index : -4
/// rh2m : 7
/// wind10m : {"direction":"S","speed":2}
/// temp2m : 32
/// prec_type : "rain"

class Dataseries {
  Dataseries({
      int? timepoint, 
      int? cloudcover, 
      int? seeing, 
      int? transparency, 
      int? liftedIndex, 
      int? rh2m, 
      Wind10m? wind10m, 
      int? temp2m, 
      String? precType,}){
    _timepoint = timepoint;
    _cloudcover = cloudcover;
    _seeing = seeing;
    _transparency = transparency;
    _liftedIndex = liftedIndex;
    _rh2m = rh2m;
    _wind10m = wind10m;
    _temp2m = temp2m;
    _precType = precType;
}

  Dataseries.fromJson(dynamic json) {
    _timepoint = json['timepoint'];
    _cloudcover = json['cloudcover'];
    _seeing = json['seeing'];
    _transparency = json['transparency'];
    _liftedIndex = json['lifted_index'];
    _rh2m = json['rh2m'];
    _wind10m = json['wind10m'] != null ? Wind10m.fromJson(json['wind10m']) : null;
    _temp2m = json['temp2m'];
    _precType = json['prec_type'];
  }
  int? _timepoint;
  int? _cloudcover;
  int? _seeing;
  int? _transparency;
  int? _liftedIndex;
  int? _rh2m;
  Wind10m? _wind10m;
  int? _temp2m;
  String? _precType;

  int? get timepoint => _timepoint;
  int? get cloudcover => _cloudcover;
  int? get seeing => _seeing;
  int? get transparency => _transparency;
  int? get liftedIndex => _liftedIndex;
  int? get rh2m => _rh2m;
  Wind10m? get wind10m => _wind10m;
  int? get temp2m => _temp2m;
  String? get precType => _precType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timepoint'] = _timepoint;
    map['cloudcover'] = _cloudcover;
    map['seeing'] = _seeing;
    map['transparency'] = _transparency;
    map['lifted_index'] = _liftedIndex;
    map['rh2m'] = _rh2m;
    if (_wind10m != null) {
      map['wind10m'] = _wind10m?.toJson();
    }
    map['temp2m'] = _temp2m;
    map['prec_type'] = _precType;
    return map;
  }

}

/// direction : "S"
/// speed : 2

class Wind10m {
  Wind10m({
      String? direction, 
      int? speed,}){
    _direction = direction;
    _speed = speed;
}

  Wind10m.fromJson(dynamic json) {
    _direction = json['direction'];
    _speed = json['speed'];
  }
  String? _direction;
  int? _speed;

  String? get direction => _direction;
  int? get speed => _speed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['direction'] = _direction;
    map['speed'] = _speed;
    return map;
  }

}