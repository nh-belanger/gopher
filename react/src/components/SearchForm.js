import React from 'react';

const SearchForm = props => {
  let handleChange = (event) => props.handleSearch(event.target.value);

  let addTeetime = null;
  if (props.signedIn) {
    addTeetime = <u><a href="/teetimes/new">Reserve a Teetime</a></u>;
  } else {
    addTeetime = <p>Sign in to Reserve a Teetime</p>;
  }

  return(
      <div className="animated fadeIn centered small-1 large-6 small-centered large-centered columns">
        <input type='text' onChange={handleChange} placeholder="Search the Timesheet for Members" />
      </div>
  );
};

export default SearchForm;
