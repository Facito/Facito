<template>
    <div class="article">
        <div class="articlehead">
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
                </div>
                <div class="bodybuttoncontainer">
                    <button id="hide" value="Hide" class="button" v-on:click="hide" style="margin-top: 0.5%; margin-left: 1%;">Hide</button>
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
            bodytext: String
        }, methods: {
            show: function(event) {
                if (event) {
                    var buttons = document.getElementsByClassName('button');

                    var content = document.getElementsByClassName('content');

                    var x = 0

                    while (x != buttons.length-1) {
                        if (buttons[x].outerHTML == event.target.outerHTML) {
                            break;
                        }
                        x++;
                    }

                    event.target.style.display = 'none';
                    buttons[x].style.display = 'none';
                    buttons[x+1].style.display = 'block';
                }
            }, hide: function(event) {
                if (event) {
                    var buttons = document.getElementsByClassName('button');

                    var content = document.getElementsByClassName('content');

                    var x = 0

                    while (x != buttons.length-1) {
                        if (buttons[x].outerHTML == event.target.outerHTML) {
                            break;
                        }
                        x++;
                    }

                    event.target.style.display = 'none';
                    buttons[x].style.display = 'none';
                    buttons[x-1].style.display = 'block';
                }
            }
        }
    }
</script>


<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    @import "../assets/css/style.css";
</style>
