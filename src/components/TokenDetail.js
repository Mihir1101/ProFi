import React from 'react';
import { useParams } from 'react-router-dom';

const TokenDetail = () => {
    const { id } = useParams();

    return (
        <div>
            <h1>TokenDetail {id}</h1>
        </div>
    );
};

export default TokenDetail;