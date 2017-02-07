import React, { Component } from 'react';

class TeetimeList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      teetimes: null
    };

    this.componentDidMount = this.componentDidMount.bind(this);
    this.getTeetimes = this.getTeetimes.bind(this);
  }

  componentDidMount() {
    this.getTeetimes();
    setInterval(this.getTeetimes, 3000);
  }

  getTeetimes () {
    fetch(`/api/v1/teetimes`, {
      credentials: 'same-origin',
    })
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status}, (${response.statusText})`;
          let error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.props.setSignedIn(body.signedIn);
        this.setState({
          teetimes: body.teetimes
        });
      });
  }

  render() {
    let teetimes = '';
    if (this.state.teetimes) {
      teetimes = this.state.teetimes.filter((teetime)=>{return teetime.date.toLowerCase().search(this.props.query.toLowerCase()) > -1; });
      teetimes = teetimes.map((teetime) => {
        // let className = 'small-4 column content-box';
        // if (item == this.state.items[this.state.items.length - 1]) {
        //   className += ' end';
        // }
        return (
          <ul>
          <div key={teetime.id} className="text-center small-4 large-6 small-centered large-centered">
          <div key={teetime.id} className="teetimes-box">
          <li className="teetime-list">
            <a href={`/teetimes/${teetime.id}`}>
              <div className='content-box'>
                <p><b>{teetime.date}</b></p>
              </div>
            </a>
          </li>
          </div>
          </div>
          </ul>
        );
      });
    }

    return(
      <div className='teetimeList'>
        {teetimes}
      </div>
    );
  }
}

export default TeetimeList;
