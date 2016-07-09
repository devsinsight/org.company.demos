/* */ 
'use strict';
Object.defineProperty(exports, '__esModule', {value: true});
var _createClass = (function() {
  function defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
      var descriptor = props[i];
      descriptor.enumerable = descriptor.enumerable || false;
      descriptor.configurable = true;
      if ('value' in descriptor)
        descriptor.writable = true;
      Object.defineProperty(target, descriptor.key, descriptor);
    }
  }
  return function(Constructor, protoProps, staticProps) {
    if (protoProps)
      defineProperties(Constructor.prototype, protoProps);
    if (staticProps)
      defineProperties(Constructor, staticProps);
    return Constructor;
  };
})();
function _interopRequireDefault(obj) {
  return obj && obj.__esModule ? obj : {'default': obj};
}
function _classCallCheck(instance, Constructor) {
  if (!(instance instanceof Constructor)) {
    throw new TypeError('Cannot call a class as a function');
  }
}
var _indexJs = require('./index');
var _indexJs2 = _interopRequireDefault(_indexJs);
var _fs = require('fs');
var _fs2 = _interopRequireDefault(_fs);
var _path = require('path');
var _path2 = _interopRequireDefault(_path);
var traceKeySorter = function traceKeySorter(a, b) {
  if (a.length < b.length) {
    return a < b.substring(0, a.length) ? -1 : 1;
  } else if (a.length > b.length) {
    return a.substring(0, b.length) <= b ? -1 : 1;
  } else {
    return a < b ? -1 : 1;
  }
};
var FileSystemLoader = (function() {
  function FileSystemLoader(root, plugins) {
    _classCallCheck(this, FileSystemLoader);
    this.root = root;
    this.sources = {};
    this.importNr = 0;
    this.core = new _indexJs2['default'](plugins);
    this.tokensByFile = {};
  }
  _createClass(FileSystemLoader, [{
    key: 'fetch',
    value: function fetch(_newPath, relativeTo, _trace) {
      var _this = this;
      var newPath = _newPath.replace(/^["']|["']$/g, ""),
          trace = _trace || String.fromCharCode(this.importNr++);
      return new Promise(function(resolve, reject) {
        var relativeDir = _path2['default'].dirname(relativeTo),
            rootRelativePath = _path2['default'].resolve(relativeDir, newPath),
            fileRelativePath = _path2['default'].resolve(_path2['default'].join(_this.root, relativeDir), newPath);
        if (newPath[0] !== '.' && newPath[0] !== '/') {
          try {
            fileRelativePath = require.resolve(newPath);
          } catch (e) {}
        }
        var tokens = _this.tokensByFile[fileRelativePath];
        if (tokens) {
          return resolve(tokens);
        }
        _fs2['default'].readFile(fileRelativePath, "utf-8", function(err, source) {
          if (err)
            reject(err);
          _this.core.load(source, rootRelativePath, trace, _this.fetch.bind(_this)).then(function(_ref) {
            var injectableSource = _ref.injectableSource;
            var exportTokens = _ref.exportTokens;
            _this.sources[trace] = injectableSource;
            _this.tokensByFile[fileRelativePath] = exportTokens;
            resolve(exportTokens);
          }, reject);
        });
      });
    }
  }, {
    key: 'finalSource',
    get: function get() {
      var _this2 = this;
      return Object.keys(this.sources).sort(traceKeySorter).map(function(s) {
        return _this2.sources[s];
      }).join("");
    }
  }]);
  return FileSystemLoader;
})();
exports['default'] = FileSystemLoader;
module.exports = exports['default'];
