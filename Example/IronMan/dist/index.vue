<template>
  <div class="wrapper" @click="update">
    <!-- <image :src="logoUrl" class="logo"></image> -->
    <image style="width:100px;height:100px" src="https://vuejs.org/images/logo.png"></image>
    <text class="title">Hello {{target}}</text>
    <text class="desc">Now, let's use vue to build your weex app.</text>
    
    <div @click="choose" class="button">
      <text style="color:#fff">点击选择图片</text>
    </div>
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
  var photoPicker = weex.requireModule('photoPicker') 

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
      choose: function() {
          var _this = this;
          weex.requireModule('photoPicker').chooseImageWithOption({},function(data,alive){
            console.log('======选择~~~~~~~~=====');
            console.log(JSON.stringify(data));
          })
      },
    }
  }
</script>
