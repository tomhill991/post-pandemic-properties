import 'mapbox-gl/dist/mapbox-gl.css'
import 'react-map-gl-geocoder/dist/mapbox-gl-geocoder.css'
import React, { useState, useRef, useCallback, useEffect } from 'react'
import MapGL, { Marker, Popup } from "react-map-gl";
import Geocoder from 'react-map-gl-geocoder'
import MapMarker from 'images/map-marker-alt-solid.svg'
import PropertyCard from './PropertyCard.jsx'
 
// Ways to set Mapbox token: https://uber.github.io/react-map-gl/#/Documentation/getting-started/about-mapbox-tokens
const MAPBOX_TOKEN = process.env.MAPBOX_API_KEY
 
const Map = props => {
  const [properties, setProperties] = useState(props.properties)

  const [viewport, setViewport] = useState({
    latitude: 51.509865,
    longitude: -0.118092,
    zoom: 8,
  });
  const geocoderContainerRef = useRef();
  const mapRef = useRef();
  const handleViewportChange = useCallback(
    (newViewport) => setViewport(newViewport),
    []
  );
  const [selectedProperty, setSelectedProperty] = useState(null)
  const [showMenu, setShowMenu] = useState(false)

  const handleClick = () => {
    if(showMenu)
      setShowMenu(false)
    else
      setShowMenu(true)
  }

  return (
    <div className={"map-container" + (showMenu ? ' show' : '')}>
      <div className="geocoder-container" ref={geocoderContainerRef}></div>
      <MapGL
        ref={mapRef}
        {...viewport}
        width="100vw"
        height="calc(100vh - 113px)"
        onViewportChange={handleViewportChange}
        mapboxApiAccessToken={MAPBOX_TOKEN}
      >
        {
          properties.map(property => (
            <>
            <Marker
              key={property.id}
              latitude={property.latitude}
              longitude={property.longitude}
            >
              <button className="marker-btn" onClick={() => setSelectedProperty(property)} >
                <img className="map-marker" src={MapMarker} alt="map marker" />
              </button>
            </Marker>
            <Popup
              latitude={property.latitude}
              longitude={property.longitude}
              closeButton={false}
            >
              <div>
                <p>{property.title}</p>
              </div>
            </Popup>
            </>
          ))
        }
      <Geocoder
        mapRef={mapRef}
        containerRef={geocoderContainerRef}
        onViewportChange={handleViewportChange}
        mapboxApiAccessToken={MAPBOX_TOKEN}
      />
      </MapGL>
      <div className="map-toggler">
        <div className="open-close-wrap" onClick={() => handleClick()}>
          <span className="search-icon"></span>
          <button className="open-close"></button>
        </div>
      </div>

      {
        selectedProperty && 
          <PropertyCard property={selectedProperty ? selectedProperty : properties[0]} closeCard={setSelectedProperty}/>
      }

    </div>
  );
};

{/* <div className={"property-hide-show" + (selectedProperty ? ' show' : ' hide')}> */}
{/* </div> */}

export default Map
