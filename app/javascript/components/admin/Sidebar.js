import React from "react"

export default class Sidebar extends React.Component {
  render () {
    
    return (
      <React.Fragment>
        <div className="sidebar">
          <div className="sidebar-inner">
            <div className="sidebar-logo">
              <div className="logo-inner">
                bedouino
              </div>
            </div>
            <ul className="sidebar-menu">
              <li  className="nav-item mT-30">
              <a href="#" className="sidebar-link"> Users</a>
              </li>
              <li className="nav-item">
                <a href="/admin/categories" className="sidebar-link">Categories</a>
              </li>
              <li className="nav-item">
                <a href="#" className="sidebar-link">Companies</a>
              </li>
              <li className="nav-item">
                <a href="#" className="sidebar-link">Products</a>
              </li>
            </ul>
          </div>
        </div>

      </React.Fragment>
    );
  }
}