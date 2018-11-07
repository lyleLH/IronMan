// { "framework": "Vue"} 

/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

var __vue_exports__, __vue_options__
var __vue_styles__ = []

/* styles */
__vue_styles__.push(__webpack_require__(1)
)

/* script */
__vue_exports__ = __webpack_require__(2)

/* template */
var __vue_template__ = __webpack_require__(3)
__vue_options__ = __vue_exports__ = __vue_exports__ || {}
if (
  typeof __vue_exports__.default === "object" ||
  typeof __vue_exports__.default === "function"
) {
if (Object.keys(__vue_exports__).some(function (key) { return key !== "default" && key !== "__esModule" })) {console.error("named exports are not supported in *.vue files.")}
__vue_options__ = __vue_exports__ = __vue_exports__.default
}
if (typeof __vue_options__ === "function") {
  __vue_options__ = __vue_options__.options
}
__vue_options__.__file = "/Users/MTT/Documents/万科/IronMan/Example/IronMan/dist/index.vue"
__vue_options__.render = __vue_template__.render
__vue_options__.staticRenderFns = __vue_template__.staticRenderFns
__vue_options__._scopeId = "data-v-3456dfac"
__vue_options__.style = __vue_options__.style || {}
__vue_styles__.forEach(function (module) {
  for (var name in module) {
    __vue_options__.style[name] = module[name]
  }
})
if (typeof __register_static_styles__ === "function") {
  __register_static_styles__(__vue_options__._scopeId, __vue_styles__)
}

module.exports = __vue_exports__
module.exports.el = 'true'
new Vue(module.exports)


/***/ }),
/* 1 */
/***/ (function(module, exports) {

module.exports = {
  "wrapper": {
    "alignItems": "center",
    "marginTop": "120"
  },
  "title": {
    "paddingTop": "40",
    "paddingBottom": "40",
    "fontSize": "48"
  },
  "desc": {
    "paddingTop": "20",
    "color": "#888888",
    "fontSize": "24"
  },
  "button": {
    "marginTop": "20",
    "marginRight": "20",
    "marginBottom": "20",
    "marginLeft": "20",
    "paddingTop": "20",
    "paddingRight": "20",
    "paddingBottom": "20",
    "paddingLeft": "20",
    "backgroundColor": "#1ba1e2",
    "color": "#ffffff"
  }
}

/***/ }),
/* 2 */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
Object.defineProperty(__webpack_exports__, "__esModule", { value: true });
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

var navigator = weex.requireModule('navigator');
var zip = weex.requireModule('zip');

/* harmony default export */ __webpack_exports__["default"] = ({

  init: function () {},
  created: function () {

    var bundleUrl = weex.config.bundleUrl;

    bundleUrl = new String(bundleUrl);
    console.log('bundleUrl', bundleUrl);

    var nativeBase;
    nativeBase = bundleUrl.substring(0, bundleUrl.lastIndexOf('/dist') + 1);
    console.log('nativeBase', nativeBase);

    this.baseURL = nativeBase;
  },

  ready: function () {},
  destroyed: function () {},

  data: {
    bundleUrl: 'world'
  },

  methods: {
    zip: function () {
      var srcPath = 'File.txt';
      console.log('srcPath:' + srcPath);
      var zippedPath = 'ZippedFile.zip';
      var args = {
        'src': srcPath,
        'des': zippedPath
      };
      zip.zip(args, function (ret, alive) {
        console.log(ret);
      });
    },

    unzip: function () {
      var srcPath = 'ZippedFile.zip';
      var zippedPath = 'unzipFile.txt';
      var args = {
        'src': srcPath,
        'des': zippedPath
      };
      zip.unzip(args, function (ret, alive) {
        console.log(ret);
      });
    },

    zipWithPwd: function () {
      var srcPath = 'File.txt';
      console.log('srcPath:' + srcPath);
      var zippedPath = 'ZippedFile.zip';
      var pwd = '123abc';
      var args = {
        'src': srcPath,
        'des': zippedPath,
        'pwd': pwd
      };
      zip.zipWithPassword(args, function (ret, alive) {
        console.log(ret);
      });
    },

    unzipWithPwd: function () {
      var srcPath = 'ZippedFile.zip';
      var zippedPath = 'unzipFile.txt';
      var pwd = '123abc';
      var args = {
        'src': srcPath,
        'des': zippedPath,
        'pwd': pwd
      };
      zip.unzipWithPassword(args, function (ret, alive) {
        console.log(ret);
      });
    }

  }
});

/***/ }),
/* 3 */
/***/ (function(module, exports) {

module.exports={render:function(){},staticRenderFns:[]}

/***/ })
/******/ ]);