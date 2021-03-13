import React from 'react';
import Avatar from './Avatar';

Userlnfo.propTypes = {
    
};

function Userlnfo(props) {
    return (
        <div className="UserInfo">
            <Avatar author={props.author} />
            <div className="UserInfo-name">
                {props.author.name}
            </div>
        </div>
    );
}

export default Userlnfo;