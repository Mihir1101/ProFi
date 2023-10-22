import React, { useEffect } from 'react';
import '../styles/Navbar.css';

function Navbar() {
    // Get the current URL path
    const currentPath = window.location.pathname;

    useEffect(() => {
        const links = document.querySelectorAll('.header a');
        for (const link of links) {
            if (link.getAttribute('href') === currentPath) {
                link.classList.add('active');
            }
        }
    }, []);
    return (
        < div className='navDiv'>
            <h4>Team name: VasuK111</h4>
            <nav class="header">
                <a className='' href="/">Tokens</a>
                <a className='' href="/about">About</a>
            </nav>
            <button><a href='https://studio.tableland.xyz/vasuk111/ethonline23/deployments/default/bnb_data_420_37'><b>Tableland's</b> Address</a></button>
        </div>
    );
}

export default Navbar;
