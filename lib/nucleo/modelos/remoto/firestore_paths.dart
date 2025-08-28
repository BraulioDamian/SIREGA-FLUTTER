class FsPaths {
  // Root collections
  static String users() => 'users';
  static String herds() => 'herds';

  // Documents
  static String user(String uid) => 'users/$uid';
  static String herd(String herdId) => 'herds/$herdId';

  // Subcollections under herd
  static String cattle(String herdId) => 'herds/$herdId/cattle';
  static String cattleDoc(String herdId, String nfcTagId) => 'herds/$herdId/cattle/$nfcTagId';
  static String healthRecords(String herdId, String nfcTagId) => 'herds/$herdId/cattle/$nfcTagId/healthRecords';
  static String genealogy(String herdId, String nfcTagId) => 'herds/$herdId/cattle/$nfcTagId/genealogy';
  static String productionRecords(String herdId, String nfcTagId) => 'herds/$herdId/cattle/$nfcTagId/productionRecords';
}
