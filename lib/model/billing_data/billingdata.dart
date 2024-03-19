class billingdata {
  String first_name;
  String last_name;
  String phone_number;
  String email;
  String floor;
  String apartment;
  String street;
  String building;
  String shipping_method;
  String postal_code;
  String city;
  String country;
  String state;

  billingdata({required this.first_name, required this.last_name ,required this.phone_number ,
    required this.email, this.floor="NA",this.apartment="NA" ,this.street="NA" , this.building="NA" ,
    this.shipping_method="NA",this.postal_code="NA" , this.city="NA" , this.country="NA", this.state="NA"}
      );

  Map<String,String> toMap(){ return
    {"apartment": apartment?? "NA",
      "email": email ,
      "floor": floor ??"NA",
      "first_name": first_name ,
      "street": street?? "NA",
      "building":building?? "NA",
      "phone_number": phone_number,
      "shipping_method": shipping_method ?? "NA",
      "postal_code": postal_code ?? "NA",
      "city": city ?? "NA",
      "country": country ?? "NA",
      "last_name": last_name ,
      "state": state ?? "NA"};
  }
}