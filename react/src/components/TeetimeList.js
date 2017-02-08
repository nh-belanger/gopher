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
      // TODO: fix so this can search for dates and for users
      teetimes = this.state.teetimes.filter((teetime)=>{return teetime.creator.toLowerCase().search(this.props.query.toLowerCase()) > -1; });
      teetimes = teetimes.map((teetime) => {
        return (
          <div className="wow animated slideInLeft">
              <div key={teetime.id} className="text-center small-4 large-6 small-centered large-centered">
                <div key={teetime.id} className="teetimes-box">
                  <div className="teetime-list">
                    <a href={`/members/1/teetimes/${teetime.id}`}>
                      <div>{teetime.formatted_date} | {teetime.formatted_time} | {teetime.creator}</div>
                    </a>
                  </div>
                </div>
              </div>
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
