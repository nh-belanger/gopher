import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import IndexApp from './components/IndexApp';

$(function() {
  ReactDOM.render(
    < IndexApp />,
    document.getElementById('TeetimeList')
  );
});
