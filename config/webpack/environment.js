const { environment } = require('@rails/webpacker')
const customConfig = require('./custom')

environment.config.merge(customConfig)
// const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')
const stylus = require('./loaders/stylus')

// use if update to vue-loader version >14
// but got conflict using Pug

// environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.append('vue', vue)
environment.loaders.append('stylus', stylus)
module.exports = environment
