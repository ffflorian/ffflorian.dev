parcelRequire=function(e,r,n,t){var i="function"==typeof parcelRequire&&parcelRequire,o="function"==typeof require&&require;function u(n,t){if(!r[n]){if(!e[n]){var f="function"==typeof parcelRequire&&parcelRequire;if(!t&&f)return f(n,!0);if(i)return i(n,!0);if(o&&"string"==typeof n)return o(n);var c=new Error("Cannot find module '"+n+"'");throw c.code="MODULE_NOT_FOUND",c}p.resolve=function(r){return e[n][1][r]||r},p.cache={};var l=r[n]=new u.Module(n);e[n][0].call(l.exports,p,l,l.exports,this)}return r[n].exports;function p(e){return u(p.resolve(e))}}u.isParcelRequire=!0,u.Module=function(e){this.id=e,this.bundle=u,this.exports={}},u.modules=e,u.cache=r,u.parent=i,u.register=function(r,n){e[r]=[function(e,r){r.exports=n},{}]};for(var f=0;f<n.length;f++)u(n[f]);if(n.length){var c=u(n[n.length-1]);"object"==typeof exports&&"undefined"!=typeof module?module.exports=c:"function"==typeof define&&define.amd?define(function(){return c}):t&&(this[t]=c)}return u}({"IWhW":[function(require,module,exports) {
function t(t){"loading"!==document.readyState?t():document.addEventListener("DOMContentLoaded",t)}var e=function(t){return document.getElementById(t)},n=function(t){return document.getElementsByTagName(t)[0]};function o(t){var e=t.getBoundingClientRect();return{top:e.top+window.pageYOffset-document.documentElement.clientTop,left:e.left+window.pageXOffset-document.documentElement.clientLeft}}function l(t,e,n){t.style.transition="all "+e,Object.keys(n).forEach(function(e){return t.style[e]=n[e]})}t(function(){e("btnPGPKey").addEventListener("click",function(){return e("fingerprint").style.display="block"}),e("btnGallery").addEventListener("click",function(t){t.preventDefault();var n=e("gallery");n.style.display="block";var l=o(n).top;window.scroll({top:l,left:0,behavior:"smooth"})}),e("mail").setAttribute("href","mailto:hallo@ffflorian.de")});
},{}]},{},["IWhW"], null)
//# sourceMappingURL=base.68f9ee2b.map