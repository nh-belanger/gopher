import 'babel-polyfill';
import 'whatwg-fetch';
import React from 'react';
import ReactDOM from 'react-dom';
import IndexApp from './components/IndexApp';

$(function() {
  if (document.getElementById('TeetimeList')) {
    ReactDOM.render(
      < IndexApp />,
      document.getElementById('TeetimeList')
    );
  }
});
