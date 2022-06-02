class Football {
  List<Stages>? stages;

  Football({this.stages});

  Football.fromJson(Map<String, dynamic> json) {
    if (json['Stages'] != null) {
      stages = <Stages>[];
      json['Stages'].forEach((v) {
        stages!.add(new Stages.fromJson(v));
      });
    }
  }


}

class Stages {
  String? sid;
  String? snm;
  String? sds;
  String? scd;
  String? cid;
  String? cnm;
  String? csnm;
  String? ccd;
  String? ccdiso;
  String? compId;
  String? compN;
  String? compST;
  String? compD;
  int? scu;
  int? chi;
  int? shi;
  String? sdn;
  List<Events>? events;

  Stages({this.sid,
    this.snm,
    this.sds,
    this.scd,
    this.cid,
    this.cnm,
    this.csnm,
    this.ccd,
    this.ccdiso,
    this.compId,
    this.compN,
    this.compST,
    this.compD,
    this.scu,
    this.chi,
    this.shi,
    this.sdn,
    this.events
  });

  Stages.fromJson(Map<String, dynamic> json) {
    sid = json['Sid'];
    snm = json['Snm'];
    sds = json['Sds'];
    scd = json['Scd'];
    cid = json['Cid'];
    cnm = json['Cnm'];
    csnm = json['Csnm'];
    ccd = json['Ccd'];
    ccdiso = json['Ccdiso'];
    compId = json['CompId'];
    compN = json['CompN'];
    compST = json['CompST'];
    compD = json['CompD'];
    scu = json['Scu'];
    chi = json['Chi'];
    shi = json['Shi'];
    sdn = json['Sdn'];
    if (json['Events'] != null) {
      events = <Events>[];
      json['Events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }
}




class Events {
  String? eid;
  Pids? pids;
  Pids? sids;
  String? tr1;
  String? tr2;
  String? trh1;
  String? trh2;
  String? tr1OR;
  String? tr2OR;
  List<T1>? t1;
  // List<T2>? t2;
  String? eps;
  int? esid;
  int? epr;
  int? ecov;
  int? ern;
  String? ernInf;
  int? ewt;
  int? et;
  int? esd;
  int? luUT;
  int? eds;
  int? edf;
  int? eact;
  int? incsX;
  int? comX;
  int? luX;
  int? statX;
  int? subsX;
  int? sDFowX;
  int? sDInnX;
  int? eO;
  int? luC;
  int? ehid;
  Stg? stg;
  int? pid;
  int? spid;

  Events(
      {this.eid,
        this.pids,
        this.sids,
        this.tr1,
        this.tr2,
        this.trh1,
        this.trh2,
        this.tr1OR,
        this.tr2OR,
        this.t1,
        // this.t2,
        this.eps,
        this.esid,
        this.epr,
        this.ecov,
        this.ern,
        this.ernInf,
        this.ewt,
        this.et,
        this.esd,
        this.luUT,
        this.eds,
        this.edf,
        this.eact,
        this.incsX,
        this.comX,
        this.luX,
        this.statX,
        this.subsX,
        this.sDFowX,
        this.sDInnX,
        this.eO,
        this.luC,
        this.ehid,
        this.stg,
        this.pid,
        this.spid});

  Events.fromJson(Map<String, dynamic> json) {
    eid = json['Eid'];
    pids = json['Pids'] != null ? new Pids.fromJson(json['Pids']) : null;
    sids = json['Sids'] != null ? new Pids.fromJson(json['Sids']) : null;
    tr1 = json['Tr1'];
    tr2 = json['Tr2'];
    trh1 = json['Trh1'];
    trh2 = json['Trh2'];
    tr1OR = json['Tr1OR'];
    tr2OR = json['Tr2OR'];
    if (json['T1'] != null) {
      t1 = <T1>[];
      json['T1'].forEach((v) {
        t1!.add(new T1.fromJson(v));
      });
    }
    // if (json['T2'] != null) {
    //   t2 = <T2>[];
    //   json['T2'].forEach((v) {
    //     t2!.add(new T2.fromJson(v));
    //   });
    // }
    eps = json['Eps'];
    esid = json['Esid'];
    epr = json['Epr'];
    ecov = json['Ecov'];
    ern = json['Ern'];
    ernInf = json['ErnInf'];
    ewt = json['Ewt'];
    et = json['Et'];
    esd = json['Esd'];
    luUT = json['LuUT'];
    eds = json['Eds'];
    edf = json['Edf'];
    eact = json['Eact'];
    incsX = json['IncsX'];
    comX = json['ComX'];
    luX = json['LuX'];
    statX = json['StatX'];
    subsX = json['SubsX'];
    sDFowX = json['SDFowX'];
    sDInnX = json['SDInnX'];
    eO = json['EO'];
    luC = json['LuC'];
    ehid = json['Ehid'];
    stg = json['Stg'] != null ? new Stg.fromJson(json['Stg']) : null;
    pid = json['Pid'];
    spid = json['Spid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Eid'] = this.eid;
    if (this.pids != null) {
      data['Pids'] = this.pids!.toJson();
    }
    if (this.sids != null) {
      data['Sids'] = this.sids!.toJson();
    }
    data['Tr1'] = this.tr1;
    data['Tr2'] = this.tr2;
    data['Trh1'] = this.trh1;
    data['Trh2'] = this.trh2;
    data['Tr1OR'] = this.tr1OR;
    data['Tr2OR'] = this.tr2OR;
    // if (this.t1 != null) {
    //   data['T1'] = this.t1!.map((v) => v.toJson()).toList();
    // }
    // if (this.t2 != null) {
    //   data['T2'] = this.t2!.map((v) => v.toJson()).toList();
    // }
    data['Eps'] = this.eps;
    data['Esid'] = this.esid;
    data['Epr'] = this.epr;
    data['Ecov'] = this.ecov;
    data['Ern'] = this.ern;
    data['ErnInf'] = this.ernInf;
    data['Ewt'] = this.ewt;
    data['Et'] = this.et;
    data['Esd'] = this.esd;
    data['LuUT'] = this.luUT;
    data['Eds'] = this.eds;
    data['Edf'] = this.edf;
    data['Eact'] = this.eact;
    data['IncsX'] = this.incsX;
    data['ComX'] = this.comX;
    data['LuX'] = this.luX;
    data['StatX'] = this.statX;
    data['SubsX'] = this.subsX;
    data['SDFowX'] = this.sDFowX;
    data['SDInnX'] = this.sDInnX;
    data['EO'] = this.eO;
    data['LuC'] = this.luC;
    data['Ehid'] = this.ehid;
    if (this.stg != null) {
      data['Stg'] = this.stg!.toJson();
    }
    data['Pid'] = this.pid;
    data['Spid'] = this.spid;
    return data;
  }
}

class Pids {
  String? s1;
  String? s6;
  String? s8;
  String? s12;

  Pids({this.s1, this.s6, this.s8, this.s12});

  Pids.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s6 = json['6'];
    s8 = json['8'];
    s12 = json['12'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['6'] = this.s6;
    data['8'] = this.s8;
    data['12'] = this.s12;
    return data;
  }
}

class T1 {
  String? nm;
  String? iD;
  int? tbd;
  String? img;
  int? gd;
  // Pids? pids;
  String? coNm;
  String? coId;
  // Shrt? shrt;
  bool? hasVideo;
  String? newsTag;

  T1(
      {this.nm,
        this.iD,
        this.tbd,
        this.img,
        this.gd,
        // this.pids,
        this.coNm,
        this.coId,
        // this.shrt,
        this.hasVideo,
        this.newsTag});

  T1.fromJson(Map<String, dynamic> json) {
    nm = json['Nm'];
    iD = json['ID'];
    tbd = json['tbd'];
    img = json['Img'];
    gd = json['Gd'];
    // pids = json['Pids'] != null ? new Pids.fromJson(json['Pids']) : null;
    coNm = json['CoNm'];
    coId = json['CoId'];
    // shrt = json['Shrt'] != null ? new Shrt.fromJson(json['Shrt']) : null;
    hasVideo = json['HasVideo'];
    newsTag = json['NewsTag'];
  }


}

class T2 {
  List<String>? l1;
  List<String>? l6;
  List<String>? l8;
  List<String>? l12;
  List<String>? l28;
  List<String>? l15;

  T2({this.l1, this.l6, this.l8, this.l12, this.l28, this.l15});

  T2.fromJson(Map<String, dynamic> json) {
    l1 = json['1'].cast<String>();
    l6 = json['6'].cast<String>();
    l8 = json['8'].cast<String>();
    l12 = json['12'].cast<String>();
    l28 = json['28'].cast<String>();
    l15 = json['15'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.l1;
    data['6'] = this.l6;
    data['8'] = this.l8;
    data['12'] = this.l12;
    data['28'] = this.l28;
    data['15'] = this.l15;
    return data;
  }
}

class Shrto {
  String? bs;
  String? sl;
  String? nmb;
  bool? sq;
  bool? st;
  bool? hst;
  bool? spl;
  String? sld;
  String? splC;
  String? stC;

  Shrto(
      {this.bs,
        this.sl,
        this.nmb,
        this.sq,
        this.st,
        this.hst,
        this.spl,
        this.sld,
        this.splC,
        this.stC});

  Shrto.fromJson(Map<String, dynamic> json) {
    bs = json['Bs'];
    sl = json['Sl'];
    nmb = json['Nmb'];
    sq = json['Sq'];
    st = json['St'];
    hst = json['Hst'];
    spl = json['Spl'];
    sld = json['Sld'];
    splC = json['SplC'];
    stC = json['StC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bs'] = this.bs;
    data['Sl'] = this.sl;
    data['Nmb'] = this.nmb;
    data['Sq'] = this.sq;
    data['St'] = this.st;
    data['Hst'] = this.hst;
    data['Spl'] = this.spl;
    data['Sld'] = this.sld;
    data['SplC'] = this.splC;
    data['StC'] = this.stC;
    return data;
  }
}

class Shrt {
  String? bs;
  String? sl;
  String? nmb;
  bool? sq;
  bool? st;
  bool? hst;
  bool? spl;
  String? sld;
  String? stC;

  Shrt(
      {this.bs,
        this.sl,
        this.nmb,
        this.sq,
        this.st,
        this.hst,
        this.spl,
        this.sld,
        this.stC});

  Shrt.fromJson(Map<String, dynamic> json) {
    bs = json['Bs'];
    sl = json['Sl'];
    nmb = json['Nmb'];
    sq = json['Sq'];
    st = json['St'];
    hst = json['Hst'];
    spl = json['Spl'];
    sld = json['Sld'];
    stC = json['StC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Bs'] = this.bs;
    data['Sl'] = this.sl;
    data['Nmb'] = this.nmb;
    data['Sq'] = this.sq;
    data['St'] = this.st;
    data['Hst'] = this.hst;
    data['Spl'] = this.spl;
    data['Sld'] = this.sld;
    data['StC'] = this.stC;
    return data;
  }
}

class Stg {
  String? sid;
  String? snm;
  String? sds;
  String? scd;
  String? cid;
  String? cnm;
  String? csnm;
  String? ccd;
  String? ccdiso;
  String? compId;
  String? compN;
  String? compST;
  String? compD;
  int? scu;
  int? chi;
  int? shi;
  String? sdn;

  Stg(
      {this.sid,
        this.snm,
        this.sds,
        this.scd,
        this.cid,
        this.cnm,
        this.csnm,
        this.ccd,
        this.ccdiso,
        this.compId,
        this.compN,
        this.compST,
        this.compD,
        this.scu,
        this.chi,
        this.shi,
        this.sdn});

  Stg.fromJson(Map<String, dynamic> json) {
    sid = json['Sid'];
    snm = json['Snm'];
    sds = json['Sds'];
    scd = json['Scd'];
    cid = json['Cid'];
    cnm = json['Cnm'];
    csnm = json['Csnm'];
    ccd = json['Ccd'];
    ccdiso = json['Ccdiso'];
    compId = json['CompId'];
    compN = json['CompN'];
    compST = json['CompST'];
    compD = json['CompD'];
    scu = json['Scu'];
    chi = json['Chi'];
    shi = json['Shi'];
    sdn = json['Sdn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sid'] = this.sid;
    data['Snm'] = this.snm;
    data['Sds'] = this.sds;
    data['Scd'] = this.scd;
    data['Cid'] = this.cid;
    data['Cnm'] = this.cnm;
    data['Csnm'] = this.csnm;
    data['Ccd'] = this.ccd;
    data['Ccdiso'] = this.ccdiso;
    data['CompId'] = this.compId;
    data['CompN'] = this.compN;
    data['CompST'] = this.compST;
    data['CompD'] = this.compD;
    data['Scu'] = this.scu;
    data['Chi'] = this.chi;
    data['Shi'] = this.shi;
    data['Sdn'] = this.sdn;
    return data;
  }
}

