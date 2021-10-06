class ApodModel {
  late List<Photos> photos;

  ApodModel({required this.photos});

  ApodModel.fromJson(Map<String, dynamic> json) {
    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  late int id;
  late int sol;
  late Camera camera;
  late String imgSrc;
  late String earthDate;
  late Rover rover;

  Photos(
      {required this.id,
        required this.sol,
        required this.camera,
        required this.imgSrc,
        required this.earthDate,
        required this.rover});

  Photos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    camera =
    (json['camera'] != null ? new Camera.fromJson(json['camera']) : null)!;
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
    rover = (json['rover'] != null ? new Rover.fromJson(json['rover']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sol'] = this.sol;
    if (this.camera != null) {
      data['camera'] = this.camera.toJson();
    }
    data['img_src'] = this.imgSrc;
    data['earth_date'] = this.earthDate;
    if (this.rover != null) {
      data['rover'] = this.rover.toJson();
    }
    return data;
  }
}

class Camera {
  late int id;
  late String name;
  late int roverId;
  late String fullName;

  Camera({required this.id, required this.name, required this.roverId, required this.fullName});

  Camera.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roverId = json['rover_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['rover_id'] = this.roverId;
    data['full_name'] = this.fullName;
    return data;
  }
}

class Rover {
  late int id;
  late String name;
  late String landingDate;
  late String launchDate;
  late String status;

  Rover({required this.id, required this.name, required this.landingDate, required this.launchDate, required this.status});

  Rover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    landingDate = json['landing_date'];
    launchDate = json['launch_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['landing_date'] = this.landingDate;
    data['launch_date'] = this.launchDate;
    data['status'] = this.status;
    return data;
  }
}
