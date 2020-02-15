import React from "react"
import Sidebar from "./Sidebar"

export default class Categories extends React.Component {
  render () {
    const { categories } = this.props

    const allCategories= categories.map((category, index) => {
      return  <div key={ index } className="category-container">
                <div className="section-title">
                  <div className="category-title">
                    <a className="category-link" href={`/categories/${category.slug}`}>{ category.name} </a>
                  </div>
                </div>
                <div className="subcat-display-container">
                  <ul className="list">
                    
                  </ul>
                </div>
              </div>
            }
          )
    
    return (
      <React.Fragment>
        {allCategories}
      </React.Fragment>
    );
  }
}