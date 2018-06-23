<template>
    <div id="app">
        <Article title="Welcome to Your Vue.js App" bodytext="Vue.js is pretty neat."/>
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
        color: #2c3e50;
    }
</style>
