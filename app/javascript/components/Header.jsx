import React, {useState, useEffect} from "react"
import axios from 'axios'
import UserProfile from 'images/user-solid.svg'
import Burger from 'images/user-solid.svg'

const Header = props => {
  const [active, setActive] = useState(false)
  const [isUserLoggedIn, setIsUserLoggedIn] = useState(props.isUserLoggedIn)
  let csrf = document.querySelector('meta[name="csrf-token"]').content;

  const toggleActive = () => {
    if(active) 
      setActive(false)
    else 
      setActive(true)
  }
  const logout = () => {
    axios({
      method: 'delete',
      url: 'http://localhost:3000' + props.logoutPath,
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrf
      }
    }).then(res => {
      console.log(res, 'res')
      setIsUserLoggedIn(false)
      return false
    }).catch(err => {
      console.log(err)
      window.location.href = "/";
    })
  }

  return (
    <header>
      <a className="logo" href="/"></a>
      <nav className={active ? ' show' : ''}>
        <div className="container">
          <ul>
            <li><a href="/">Home</a></li>
            <li><a href="/properties">Properties</a></li>
            <li><a href="/about">About us</a></li>
            <li><a href="/contact">Contact us</a></li>
            <li><a href="/privacy">Privacy policy</a></li>
          </ul>
          {
            !isUserLoggedIn ?
            <>
          <ul>
            <li><a href={props.loginPath}>Login</a></li>
            <li><a href={props.signUpPath}>Sign up</a></li>
          </ul>
            </>
            :
            <>
            <ul>
              <li><a href={props.userProfilePath}><img className="user-profile" src={UserProfile}/></a></li>
              <li><a onClick={() => logout()}>Logout</a></li>
            </ul>
            </>
          }
          <span className="close" onClick={() => toggleActive()}></span>
        </div>
      </nav>
      <div className="burger-menu">
        <button onClick={() => toggleActive()} className="hamburger hamburger--collapse" type="button">
            <span className="hamburger-box">
                <span className="hamburger-inner"></span>
            </span>
        </button>
      </div>
    </header>
  )
}

export default Header
