class PokeAPIJohto {
  String id;
  Names names;
  Stats stats;
  PrimaryType primaryType;

  PokeAPIJohto({
    this.id,
    this.names,
    this.stats,
    this.primaryType,
  });

  PokeAPIJohto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    primaryType = json['primaryType'] != null
        ? new PrimaryType.fromJson(json['primaryType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.names != null) {
      data['names'] = this.names.toJson();
    }
    if (this.stats != null) {
      data['stats'] = this.stats.toJson();
    }
    if (this.primaryType != null) {
      data['primaryType'] = this.primaryType.toJson();
    }
    return data;
  }
}

class Names {
  String english;
  String german;
  String french;
  String italian;
  String japanese;
  String korean;
  String spanish;

  Names(
      {this.english,
      this.german,
      this.french,
      this.italian,
      this.japanese,
      this.korean,
      this.spanish});

  Names.fromJson(Map<String, dynamic> json) {
    english = json['English'];
    german = json['German'];
    french = json['French'];
    italian = json['Italian'];
    japanese = json['Japanese'];
    korean = json['Korean'];
    spanish = json['Spanish'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['English'] = this.english;
    data['German'] = this.german;
    data['French'] = this.french;
    data['Italian'] = this.italian;
    data['Japanese'] = this.japanese;
    data['Korean'] = this.korean;
    data['Spanish'] = this.spanish;
    return data;
  }
}

class Stats {
  int stamina;
  int attack;
  int defense;

  Stats({this.stamina, this.attack, this.defense});

  Stats.fromJson(Map<String, dynamic> json) {
    stamina = json['stamina'];
    attack = json['attack'];
    defense = json['defense'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stamina'] = this.stamina;
    data['attack'] = this.attack;
    data['defense'] = this.defense;
    return data;
  }
}

class PrimaryType {
  String type;
  Names names;

  PrimaryType({this.type, this.names});

  PrimaryType.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    names = json['names'] != null ? new Names.fromJson(json['names']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    if (this.names != null) {
      data['names'] = this.names.toJson();
    }
    return data;
  }
}
