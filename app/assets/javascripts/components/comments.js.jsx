/** @jsx React.DOM */

var converter = new Showdown.converter();

var Comment = React.createClass({
  render: function() {
    var rawMarkup = converter.makeHtml(this.props.children.toString());
    return (
      <div className="comment panel panel-default">
        <div className="panel-heading">
          <h3 className="panel-title">
            {this.props.userId}
          </h3>
        </div>
        <div className="panel-body">
          <span dangerouslySetInnerHTML={{__html: rawMarkup}} />
        </div>
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
        <Comment userId={comment.user_id} key={index}>
          {comment.body}
        </Comment>
      );
    });
    return (
      <div className="commentList">
        {commentNodes}
      </div>
    );
  }
});

var CommentForm = React.createClass({
  handleSubmit: function(e) {
    e.preventDefault();
    var userId = this.refs.userId.getDOMNode().value.trim();
    var body = this.refs.body.getDOMNode().value.trim();
    if (!body || !userId) {
      return;
    }
    this.props.onCommentSubmit({userId: userId, body: body});
    this.refs.userId.getDOMNode().value = '';
    this.refs.body.getDOMNode().value = '';
    return;
  },
  render: function() {
    return (
      <div className="panel panel-default">
        <div className="panel-heading">Add a Note</div>
        <div className="panel-body">
          <form className="commentForm " onSubmit={this.handleSubmit}>
            <div className="form-group">
              <label className="control-label" forName="userIdInput">userId</label>
              <input type="text" id="userIdInput" className="form-control" placeholder="Your name" ref="author" />
            </div>
            <div className="form-group">
              <label className="control-label" forName="commentInput">Comment</label>
              <textarea className="form-control" id="commentInput" rows="3" placeholder="Say something..." ref="text" />
            </div>
            <input type="submit" className="btn btn-primary" value="Post" />
          </form>
        </div>
      </div>
    );
  }
});

var show = function(sentence_url) {
  React.render(
    <CommentBox url={sentence_url} pollInterval={2000} />,
    document.getElementById('popup')
  );
};

// This isn't cleaning up the ajax requests. Why not?
var hide = function() {
  React.unmountComponentAtNode(document.getElementById('popup'))
}