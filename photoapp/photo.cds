namespace photoapp;


entity Album {
    key Id : Integer;
    title: String(120);
    Description: String(255);
    View: Integer;
    photos: Association to many Photo on photos.Album = $self;
}



entity Photo {
    key Id: Integer;
    albumId:Integer;
    locationId:Integer;
    memberId:Integer;
    title: String(120);
    description: String(255);
    privacy:String(20);
    uploadDate: Date;
    view:Integer;
    imagePath:String(50);
    Album : Association to one Album;
    Location: Association to one Location;
    Member: Association to one Member;
    Comments: Association to many Comment on Comments.Photos = $self;
    Tags: Association to many Tag_photo on Tags.Photos = $self;
}



entity Location {
    key Id: Integer;
    name: String(200);
    shortName: String(50);
    Photos : Association to many Photo on Photos.Location = $self;
}



entity Member {
    key Id: Integer;
    name: String(255);
    phoneNum: String(20);
    email:String(200);
    address:String(255);
    Photos : Association to many Photo on Photos.Member = $self;
}



entity Comment {
    key Id: Integer;
    photoId: Integer;
    postDate: Date;
    content: String(255);
    Photos : Association to one Photo;
}



entity Tag_photo {
    key Id: Integer;
    tagId:Integer;
    photoId: Integer;
    tag: Association to one tag;
    Photos: Association to one Photo;
}



entity tag{
    key Id:Integer;
    title:String(120);
    Photos : Association to many Tag_photo on Photos.tag = $self;
}