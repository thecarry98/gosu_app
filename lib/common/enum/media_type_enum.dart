enum MediaTypeEnum {
  video(0),
  audio(1),
  image(2),
  none(3);

  final int id;
  const MediaTypeEnum(this.id);

  factory MediaTypeEnum.fromId(int id) {
    switch (id) {
      case 0:
        return MediaTypeEnum.video;
      case 1:
        return MediaTypeEnum.audio;
      case 2:
        return MediaTypeEnum.image;
      default:
        return MediaTypeEnum.none;
    }
  }
  factory MediaTypeEnum.fromMediaType(String mediaType) {
    switch (mediaType) {
      case 'video':
        return MediaTypeEnum.video;
      case 'audio':
        return MediaTypeEnum.audio;
      case 'image':
        return MediaTypeEnum.image;
      // case '':
      //   return MediaTypeEnum.none;
      default:
        return MediaTypeEnum.none;
    }
  }
}
