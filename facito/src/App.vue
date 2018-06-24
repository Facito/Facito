<template>
    <div id="app">
        <Article title="Eyecatching Headline" bodytext="Pretty neat text." imagelink="http://media.idownloadblog.com/wp-content/uploads/2016/10/MacBook-Pro-Event-Wallpaper-ari-weinkle-Spiral_1A.jpg"/>
        <Article title="Eyecatching Headline" bodytext="Pretty neat text." imagelink="http://media.idownloadblog.com/wp-content/uploads/2016/10/MacBook-Pro-Event-Wallpaper-ari-weinkle-Spiral_1A.jpg"/>
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
</style>
