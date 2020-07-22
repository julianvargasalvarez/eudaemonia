import React from "react"
import PropTypes from "prop-types"
class Candidate extends React.Component {
  render () {
    return (
      <article className={"candidate"} htmlDraggable={'true'} data-id={this.props.name}>
        <h3>{this.props.name}</h3>
        <form>
          <label>Mark as ...</label> 
        </form>
      </article>
    );
  }
}


Candidate.propTypes = {
  name: PropTypes.string,
  status: PropTypes.string
};
export default Candidate
