const path = require('path');

module.exports = {
    entry: {
        app: [
            './src/index.js'
        ]
    },
    output: {
        filename: '[name].js',
        path: path.resolve(__dirname, 'dist')
    },
    module: {
        rules: [{
            test: /\.elm$/,
            exclude: [/elm-stuff/, /node_modules/],
            loader: 'elm-webpack-loader?verbose=true&warn=true',
        }],
        noParse: /\.elm$/
    }
};