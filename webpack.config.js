const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
    //mode: 'production',
    mode: 'development',
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
            },
            {
                test: /\.css$/,
                use: [
                    MiniCssExtractPlugin.loader,
                    "css-loader"
                ]
            },
            {
                test: /\.(png|svg|jpg|gif)$/,
                exclude: [/node_modules/],
                use: {
                    loader: "file-loader",
                    options: {
                        name: "[path][name].[hash].[ext]",
                    },
                }
            }
        ],
        noParse: /\.elm$/
    },
    plugins: [
        new MiniCssExtractPlugin({
            filename: "[name].css"
        })
    ],
    devServer: {
        inline: true,
        stats: {
            colors: true
        }
    }
};