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
        <div>
            <nav class="header">
                <a className='' href="/">Tokens</a>
                <a className='' href="http://localhost:3000/" >Chat</a>
                <a className='' href="/about">About</a>
            </nav>
        </div>
    );
}

export default Navbar;
