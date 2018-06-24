<template>
    <div id="app">
        <Article title="Eyecatching Headline" bodytext="Pretty neat text." headerlink="https://www.iupdateos.com/wp-content/uploads/2016/10/newMBPwallDaki3.jpg" imagelink="http://media.idownloadblog.com/wp-content/uploads/2016/10/MacBook-Pro-Event-Wallpaper-ari-weinkle-Spiral_1A.jpg" id="article"/>
        <Article title="Eyecatching Headline" bodytext="Pretty neat text." headerlink="http://media.idownloadblog.com/wp-content/uploads/2016/10/MacBook-Pro-Event-Wallpaper-ari-weinkle-Spiral_1A.jpg" imagelink="https://hdqwalls.com/download/abstract-artistic-blue-nn-2880x1800.jpg" id="article"/>
    </div>
</template>

<script>
    import Article from './components/Article.vue'

    export default {
        name: 'app',
        components: {
            Article
        }
    }
</script>

<style>
    #app {
        font-family: 'Avenir', Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
    }

    #article {
        padding-bottom: 1%;
    }
</style>
