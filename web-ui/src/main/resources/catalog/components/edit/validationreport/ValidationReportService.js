(function() {
  goog.provide('gn_validation_service');

  var module = angular.module('gn_validation_service', [
  ]);

  module.factory('gnValidation', [
    'gnHttp',
    'gnEditor',
    'gnCurrentEdit',
    '$q',
    function(gnHttp, gnEditor, gnCurrentEdit, $q) {
      return {

        get: function() {
          var defer = $q.defer();

          gnHttp.callService('getValidation', {
            id: gnCurrentEdit.id
          }).success(function(data) {
            defer.resolve(data);
          });
          return defer.promise;
        }
      };
    }]);
})();
