/** @jsx React.DOM */

var converter = new Showdown.converter();

var User = React.createClass({
  render: function() {
    return (
          <div>
            <img src={this.props.photo}></img>
            <h1>{this.props.name}</h1>
          </div>
    );
  }
});

var Comment = React.createClass({
  render: function() {
    var rawMarkup = converter.makeHtml(this.props.children.toString());
    return (            
      <div className="panel-body">
        <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
      </div>
    );
  }
});

var CommentBox = React.createClass({
  loadCommentsFromServer: function() {
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
  handleCommentSubmit: function(comment) {
    var comments = this.state.data;
    comments.push(comment);
    this.setState({data: comments}, function() {
      // `setState` accepts a callback. To avoid (improbable) race condition,
      // `we'll send the ajax request right after we optimistically set the new
      // `state.
      $.ajax({
        url: this.props.url,
        dataType: 'json',
        type: 'POST',
        data: { comment: comment },
        success: function(data) {
          this.setState({data: data});
        }.bind(this),
        error: function(xhr, status, err) {
          console.error(this.props.url, status, err.toString());
        }.bind(this)
      });
    });
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadCommentsFromServer();
    setInterval(this.loadCommentsFromServer, this.props.pollInterval);
  },
  render: function() {
    return (
      <div className="commentBox">
        <h1>Comments On This Sentence</h1>
        <CommentList data={this.state.data} />
        <CommentForm onCommentSubmit={this.handleCommentSubmit} />
      </div>
    );
  }
});

var CommentList = React.createClass({
  render: function() {
    var commentNodes = this.props.data.map(function(comment, index) {
      return (
        <li className="comment">
          <User name={comment.user.name} photo={comment.user.photo}>
          </User>
        <div>
          <Comment key={index}>
            {comment.body}
          </Comment>
        </div>
        </li>
      );
    });
    return (
      <div className="commentList">
        <ul>
          {commentNodes}
        </ul>
      </div>
    );
  }
});

var CommentForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    var body = this.refs.body.getDOMNode().value.trim();
    if (!body) {
      return;
    }
    this.props.onCommentSubmit({body: body, user: {name: "x", photo: "http://www.google.com"}});
    this.refs.body.getDOMNode().value = '';
    return;
  },
  render: function() {
    return (
      <div className="panel panel-default">
        <div className="panel-heading">Add your thoughts</div>
        <div className="panel-body">
          <form className="commentForm " onSubmit={this.handleSubmit}>
            <div className="form-group">
              <textarea className="form-control" id="commentInput" rows="3" placeholder="Say something..." ref="body" />
            </div>
            <input type="submit" className="btn btn-primary" value="Post" />
          </form>
        </div>
      </div>
    );
  }
});



var NewComments = React.createClass({
  loadCommentsFromServer: function() {
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
    this.loadCommentsFromServer();
    setInterval(this.loadCommentsFromServer, this.props.pollInterval);
  },
  render: function() {
    return (
      <div className="NewComments">
        <h1>New Comments</h1>
        <CommentList data={this.state.data} />
      </div>
    );
  }
});

var showNewComments = function(story_url) {
  React.render(
    <NewComments url={story_url} pollInterval={1000} />,
    document.getElementById('feed')
  );
}

var show = function(sentence_url) {
  React.render(
    <CommentBox url={sentence_url} pollInterval={1000} />,
    document.getElementById('popup')
  );
};

// This isn't cleaning up the ajax requests. Why not?
var hide = function() {
  React.unmountComponentAtNode(document.getElementById('popup'))
}