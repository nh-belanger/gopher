import React, { Component } from 'react';

class TeetimeList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      teetimes: null
    };

    this.componentDidMount = this.componentDidMount.bind(this);
    this.getItems = this.getItems.bind(this);
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
          items: body.teetimes
        });
      });
  }

  render() {
    let teetimes = '';
    if (this.state.teetimes) {
      teetimes = this.state.teetimes.filter((teetime)=>{return teetime.date.toLowerCase().search(this.props.query.toLowerCase()) > -1; });
      teetimes = teetimes.map((item) => {
        let className = 'small-4 column content-box';
        // if (item == this.state.items[this.state.items.length - 1]) {
        //   className += ' end';
        // }
        return (
          <div key={teetime.id} className={className}>
            <a href={`/teetimes/${teetime.id}`}>
              <div className='content-box'>
                <p><b>{teetime.members.first.first_name}</b></p>
              </div>
            </a>
          </div>
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
