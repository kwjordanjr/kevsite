import Navbar from 'react-bootstrap/Navbar'
import Nav from 'react-bootstrap/Nav'

const TopBar = () => {
    return (
        <div>
            <Navbar>
                <Navbar.Collapse>
                    <Nav.Link href='home'>
                        Home
                    </Nav.Link>
                    <Nav.Link href='resume'>
                        Resume
                    </Nav.Link>
                    <Nav.Link href='about'>
                        About
                    </Nav.Link>
                </Navbar.Collapse>
            </Navbar>
        </div>
    )
};

export default TopBar;