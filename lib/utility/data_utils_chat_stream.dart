abstract class DataUtils {
  static String getUserImage(String userName) {
    if (userName == 'HarounTaHa') {
      return 'https://drive.google.com/file/d/1W1MW0HNElaVeV7jdZTo7xUHg8z36xb_S/view?usp=sharing';
    }
    return _getImageUrl(userName);
  }

  static String getChannelImage() => _getImageUrl('');
  static String _getImageUrl(String value) =>
      'https://ui-avatars.com/api/?name=$value&background=0D8ABC&color=fff';
}
