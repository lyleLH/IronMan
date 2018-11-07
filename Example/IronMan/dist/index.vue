<template>
  <div class="wrapper" @click="update">
    <!-- <image :src="logoUrl" class="logo"></image> -->
    <image style="width:100px;height:100px" src="https://vuejs.org/images/logo.png"></image>
    <text class="title">Hello {{target}}</text>
    <text class="desc">Now, let's use vue to build your weex app.</text>
    <div @click="zip" class="button">
      <text style="color:#fff">zip</text>
    </div>
    <div @click="unzip" class="button">
      <text style="color:#fff">unzip</text>
    </div>
    <div @click="zipWithPwd" class="button">
      <text style="color:#fff">zipWithPwd</text>
    </div>
    <div @click="unzipWithPwd" class="button">
      <text style="color:#fff">unzipWithPwd</text>
    </div>

</template>

<style>
  .wrapper { align-items: center; margin-top: 120px; }
  .title { padding-top:40px; padding-bottom: 40px; font-size: 48px; }
  /* .logo { width: 360px; height: 156px; } */
  .desc { padding-top: 20px; color:#888; font-size: 24px;}

  .button {
    margin: 20px;
    padding:20px;
    background-color:#1ba1e2;
    color:#fff;
  }

</style>

<script>
  var navigator = weex.requireModule('navigator')
  var zip = weex.requireModule('zip') 


  export default {

    init: function () {
    },
    created: function(){

        var bundleUrl = weex.config.bundleUrl;

        bundleUrl = new String(bundleUrl);
        console.log('bundleUrl', bundleUrl);


        var nativeBase;
        nativeBase = bundleUrl.substring(0, bundleUrl.lastIndexOf('/dist')+1);
        console.log('nativeBase', nativeBase);

        this.baseURL = nativeBase;
    },

    ready: function () {
    },
    destroyed: function () {
      
    },

    data: {
      bundleUrl: 'world'
    },

    methods: {
      zip: function() {
          var srcPath = 'File.txt'
          console.log('srcPath:'+srcPath);
          var zippedPath = 'ZippedFile.zip'
          var args = {
            'src' : srcPath,
            'des' : zippedPath
          }
          zip.zip(args,function (ret,alive) {
            console.log(ret);
          });
      },

      unzip: function() {
          var srcPath = 'ZippedFile.zip'
          var zippedPath = 'unzipFile.txt'
          var args = {
            'src' : srcPath,
            'des' : zippedPath
          }
          zip.unzip(args,function (ret,alive) {
            console.log(ret);
          })
      },

      zipWithPwd: function() {
          var srcPath = 'File.txt'
          console.log('srcPath:'+srcPath);
          var zippedPath = 'ZippedFile.zip'
          var pwd = '123abc'
          var args = {
            'src' : srcPath,
            'des' : zippedPath,
            'pwd' : pwd
          }
          zip.zipWithPassword(args,function (ret,alive) {
            console.log(ret);
          });
      },

      unzipWithPwd: function() {
          var srcPath = 'ZippedFile.zip'
          var zippedPath = 'unzipFile.txt'
          var pwd = '123abc'
          var args = {
            'src' : srcPath,
            'des' : zippedPath,
            'pwd' : pwd
          }
          zip.unzipWithPassword(args,function (ret,alive) {
            console.log(ret);
          })
      }


    }
  }
</script>
