import React, { Component } from 'react';
import TeetimeList from './TeetimeList';
import SearchForm from './SearchForm';

class IndexApp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      query: "",
      signedIn: false
    };

    this.handleSearch = this.handleSearch.bind(this);
    this.setSignedIn = this.setSignedIn.bind(this);
  }

  handleSearch (query) {
    this.setState({query});
  }

  setSignedIn (boolean) {
    this.setState({signedIn: boolean});
  }

  render() {
    return(
      <div>
        < SearchForm
          handleSearch={this.handleSearch}
          signedIn={this.state.signedIn}
        />
        < TeetimeList
          query={this.state.query}
          setSignedIn={this.setSignedIn}
        />
      </div>
    );
  }
}

export default IndexApp;
