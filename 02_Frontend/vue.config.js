'use strict';
const { defineConfig } = require('@vue/cli-service');
const path = require('path');
module.exports = defineConfig({
    transpileDependencies: true,
    runtimeCompiler: true,
    configureWebpack: {
        resolve: {
            alias: {
                '@': path.resolve(__dirname, './src'),
                '@assets': path.resolve(__dirname, './src/assets')
            },
            extensions: ['.js', '.vue', '.json']
        },
        module: {
            rules: [
                {
                    test: /\.html$/,
                    loader: 'html-loader',
                    include: [
                        path.resolve(__dirname, './src'),
                        path.resolve(__dirname, './test')
                    ]
                }
            ]
        }
    }
});
