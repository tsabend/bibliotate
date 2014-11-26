var User = React.createClass({
  render: function() {
    return (
          <div>
            <h1>{this.props.name}</h1>
            <img src={this.props.photo}></img>
          </div>
    );
  }
});

var UserBox = React.createClass({
  loadUsersFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      success: function(data) {
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadUsersFromServer();
    setInterval(this.loadUsersFromServer, this.props.pollInterval);
  },
  render: function() {
    return (
      <div className="userBox">
        <h1>Users on this sentence</h1>
        <UserList data={this.state.data} />
      </div>
    );
  }
});

var UserList = React.createClass({
  render: function() {
    var userNodes = this.props.data.map(function(user, index) {
      return (
        <User name={user.name} photo={user.photo} key={index}>

        </User>
      );
    });
    return (
      <div className="userList">
        {userNodes}
      </div>
    );
  }
});

var showUsers = function(sentence_url) {
  React.render(
    <UserBox url={sentence_url} pollInterval={2000} />,
    document.getElementById('user-list')
  );
};
