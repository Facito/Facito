 <template>
    <div id="app">
        <Article title="This a sample text and image." bodytext="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ut vehicula nulla. Duis blandit mollis mauris. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec a risus et justo eleifend imperdiet. Praesent orci eros, auctor a elit eget, tristique ultrices diam. Vestibulum id ipsum imperdiet, suscipit eros at, vehicula urna. Nulla sed consequat leo. Aenean massa erat, porta eget faucibus vel, consequat sit amet leo. Morbi sollicitudin ipsum non arcu vulputate semper. In consequat bibendum eros aliquet pharetra. Phasellus in commodo nisl." headerlink="https://vonnscottbair.files.wordpress.com/2013/02/grey-study-0044.jpg" imagelink="https://vonnscottbair.files.wordpress.com/2013/02/grey-study-0044.jpg" id="article"/>
        <Article title="This a sample text and image." bodytext="Pretty neat text." headerlink="https://d18nh7ureywlth.cloudfront.net/wp-content/uploads/9242-gull-grey.jpg" imagelink="https://d18nh7ureywlth.cloudfront.net/wp-content/uploads/9242-gull-grey.jpg" id="article"/>
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
