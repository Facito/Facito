<template>
    <div class="article">
        <div class="articlehead">
            <h1 class="header">{{title}}</h1>
            <div class="buttoncontainer">
                <input type="button" id="show" class="button" value="Show">
            </div>
        </div>
        <div id="content">
            <div class="heading">
                <h1 class="articleheader">{{title}}</h1>
            </div>

            <div class="articlebody">
                <div class="bodytextcontainer">
                    <p>
                        {{bodytext}}
                    </p>
                </div>
                <div class="bodyimagecontainer">
                    <div class="bodyimages"></div>
                </div>
                <input type="button" id="hide" class="button" value="Hide" style="margin-top: 0.5%; margin-left: 1%;">
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: 'Article',
        props: {
            title: String,
            author: String,
            bodytext: String
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
    h3 {
        margin: 40px 0 0;
    }
    ul {
        list-style-type: none;
        padding: 0;
    }
    li {
        display: inline-block;
        margin: 0 10px;
    }
    a {
        color: #42b983;
    }
</style>
