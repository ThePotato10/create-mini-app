#!/bin/sh

read -p "What is your projects name? " project

echo -e "Creating app $project\n"

npx create-react-app $project

cd $project/src

rm App.test.js
rm logo.svg
rm serviceWorker.js
rm setupTests.js

newIndex="import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';\n
ReactDOM.render(<App />, document.getElementById('root'));"

echo -e "$newIndex" > ./index.js

newApp="import React from 'react';
import './App.css';\n
function App() {
    return (
	<div className='App'>
	    <div className='App-header'>
	        <p>React App Generated With <code>create-mini-app</code></p>
	    </div>
	</div>
    );
}\n
export default App;"

echo -e "$newApp" > ./App.js

cd ../public

rm favicon.ico
rm logo192.png
rm logo512.png
rm manifest.json
rm robots.txt

newHtml="<!DOCTYPE html>
<html lang='en'>
    <head>
        <meta charset='utf-8' />
        <meta name='viewport' content='width=device-width, initial-scale=1' />
        <meta name='theme-color' content='#000000' />
        <meta name='description' content='Website created using create-mini-app' />
        <title>$project</title>
    </head>
    <body>
        <noscript>You need to enable JavaScript to run this app.</noscript>
        <div id='root'></div>
    </body>
</html>"

echo -e "$newHtml" > ./index.html

cd ..

git add -A
git commit -m "initialized $project with create-mini-app"
npm start
