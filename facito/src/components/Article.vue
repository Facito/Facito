<template>
    <div class="article">
        <div class="articlehead" :style="{'background-image': getlink()}">
            <h1 class="header">{{title}}</h1>
            <div class="buttoncontainer">
                <button id="show" value="Show" class="button" v-on:click="show">Show</button>
            </div>
        </div>
        <div class="content">
            <div class="heading">
                <h1>{{title}}</h1>
            </div>

            <div class="articlebody">
                <div class="bodyimagecontainer">
                    <img class="bodyimages" :src="imagelink">
                </div>
                <div class="bodytextcontainer">
                    <p>
                        {{bodytext}}
                    </p>
                    <button id="hide" value="Hide" class="button" v-on:click="hide" style="margin-top: 0.5%;">Hide</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script scoped>
    export default {
        name: 'Article',
        props: {
            title: String,
            author: String,
            imagelink: String,
            headerlink: String,
            bodytext: String
        }, methods: {
            show: function(event) {
                if (event) {
                    var parentDiv = event.target.parentNode.parentNode.parentNode;

                    var content = parentDiv.querySelector('.content');

                    event.target.style.display = 'none';
                    content.style.display = 'block';
                }
            }, hide: function(event) {
                if (event) {
                    var parentDiv = event.target.parentNode.parentNode.parentNode.parentNode;

                    var content = parentDiv.querySelector('.content');
                    var show = parentDiv.querySelector('#show');

                    show.style.display = 'inline-block';
                    content.style.display = 'none';
                }
            }, getlink: function() {
                let self = this;
                return 'url('+self.headerlink+')';
            }
        }
    }
</script>


<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    @import "../assets/css/style.css";
</style>
