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
    <div className='content-box'>
      <h1 className="custom-text">Add a Teetime</h1>
      <input type='text' onChange={handleChange} placeholder="Search" />
      {addTeetime}
    </div>
  );
};

export default SearchForm;
