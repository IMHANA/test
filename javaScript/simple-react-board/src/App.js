import React, {Component} from 'react';
import './App.css';
import { BrowserRouter as Router, Route, Switch, Link } from 'react-router-dom'

import Main from './mainComponent/main';

function App() {
  return (
    <div className="App">
      <Router>
        <div>
          <ul>
            <li><Link to='/Main'>Main</Link></li>
            <li>AddContactPoint</li>
            <li>GroupList</li>
          </ul>
        </div>
        <div>
            <Switch>
              <Route path='/Main' component={Main} />
            </Switch>
          </div>
      </Router>
    </div>
  );
}

export default App;
